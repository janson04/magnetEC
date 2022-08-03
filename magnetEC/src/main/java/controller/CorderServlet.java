package controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDaoImpl;
import model.Corder_detail;
import model.Users;

@WebServlet("/cart/car_complete")
public class CorderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CorderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		/*
		// 取出所有Parameter
		System.out.println("------開始取出Parameter------");

		// 返回包含名稱的字符串對象的Enumeration
		// 此request中包含的parameters。
		Enumeration paramNames = request.getParameterNames();

		// 如果enumeration包含更多的 elements，則讀取下一個(nextElement)繼續取出
		while (paramNames.hasMoreElements()) {
			String paraName = (String) paramNames.nextElement();
			System.out.print(paraName + ": ");
			String[] paramValues = request.getParameterValues(paraName);
			// 當此參數只有一個時
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() == 0) {
					System.out.println("null");
				} else {
					System.out.println(paramValue);
				}
			} else {
				// 當此參數有好幾個值時
				for (int i = 0; i < paramValues.length; i++) {
					System.out.print(paramValues[i] + "\t");
				}
				System.out.println("");
			}
		}
		System.out.println("------結束取出Parameter------");
		*/
		
		service.ShoppingCartService SC = null;
		
		//如果ShoppingCart內沒有商品或商品數量小於等於0，則跳轉至第一頁，顯示"您沒有選擇任何商品"
		if (request.getSession().getAttribute("ShoppingCart") != null) {
			SC = ((service.ShoppingCartService) request.getSession().getAttribute("ShoppingCart"));
			if (SC.shoppingMapSize() <= 0) {
				// 跳轉至結帳第一頁
				response.sendRedirect("cart_start.jsp");
				return;
			}
		}
		
		//驗證param是否正確，如不正確，則導回首頁
		//讀取所有的的param
		
		String shippingmethod = model.EnumShippingName.getEnum(request.getParameter("transport")) != null ?
								model.EnumShippingName.getEnum(request.getParameter("transport")).getName()
								: null ;
		String paymethod = model.EnumPayName.getEnum(request.getParameter("pay")) != null ?
						   model.EnumPayName.getEnum(request.getParameter("pay")).getName()
						   : null ;
		
		String users_id = null;
		model.Users user = (model.Users) request.getSession().getAttribute("user");
		if (user != null) { users_id = user.getUsers_id();}
		
		String SyncData = request.getParameter("SyncData");
		
		String cname = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String notes = request.getParameter("notes");
		String receipt = model.EnumReceiptName.getEnum(request.getParameter("receipt")) != null ? model.EnumReceiptName.getEnum(request.getParameter("receipt")).getName() : null;	
		String taxname = request.getParameter("taxname");
		String taxnumber = request.getParameter("taxnumber");
		
		System.out.println(
				"---CorderServlet:開始 ---"
				+"\nusers_id: "+users_id	//不一定會有，有登入才有
				+"\nSyncData: "+SyncData
				+"\n"
				+"\ncname: "+cname
				+"\nphone: "+phone
				+"\nemail: "+email
				+"\ncity: "+city
				+"\npostcode: "+postcode
				+"\naddress: "+address
				+"\nnotes: "+notes
				+"\nshippingmethod: "+shippingmethod
				+"\npaymethod: "+paymethod
				+"\nreceipt: "+receipt
				+"\ntaxname: "+taxname
				+"\ntaxnumber: "+taxnumber
				+"\n---CorderServlet:結束 ---");
		
		//如果有以下有一項為空值，代表為非法執行
		if (	shippingmethod == null || paymethod == null || cname == null || phone == null
				|| email == null || city == null || postcode == null || address == null
				|| notes == null || receipt == null || taxname == null || taxnumber == null
				) 
		{
			//非法執行跳轉至錯誤頁面
			System.out.println("CorderServlet: 非法執行");
			response.sendRedirect("cart_error.jsp");
			return;
		}
		
		//依照規則再次驗證傳入的值
		if (	shippingmethod.isEmpty() || paymethod.isEmpty() || cname.isEmpty()
				|| !Pattern.matches("^[0][9][0-9]{8}$" , phone)
				|| (!email.isEmpty() && !Pattern.matches("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$", email))
				|| city.isEmpty()
				|| !Pattern.matches("[0-9]{3,6}" , postcode)
				|| address.isEmpty() || receipt.isEmpty()
				|| ( "TriplicateInvoices".equals(receipt) && (taxname.isEmpty() || !Pattern.matches("^[0-9]{8}$",taxnumber)) )
				)
		{
			//驗證失敗則跳轉至錯誤頁面
			System.out.println("CorderServlet: 驗證失敗");
			response.sendRedirect("cart_error.jsp");
			return;
			
		} else {
			//成功驗證，要把訂單資訊輸出至資料庫，並清除購物車
			
			//勾選 "同步更新至帳號個人資料" 把資料更新至資料庫
			if (users_id != null && "true".equals(SyncData)) {
				boolean updateSuccess = false;
				
				Users u = new Users();
				u.setUsers_id(users_id);
				u.setName(cname);
				u.setPhone(phone);
				u.setEmail(email);
				u.setCity(city);
				u.setPostcode(postcode);
				u.setAddress(address);
//				u.setRegisterTime(LocalDateTime.now().toString());
				
				updateSuccess = new UsersDaoImpl().updateUsersNotPasswordTime(u);
				
				if (updateSuccess) {
					//成功更新，所以也要更新Session的user
					request.getSession().setAttribute("user", new dao.UsersDaoImpl().queryUsers(users_id) );
					System.out.println("CorderServlet - 同步更新至帳號個人資料: 更新成功");
				} else {
					System.out.println("CorderServlet - 同步更新至帳號個人資料: 更新失敗");
				}
				
			}
			
			String order_id = service.CorderService.orderNewID();	//新建一個訂單CID
			int subtotal_sum = SC.totalAllMoney();		//商品小計總和(不含運費)
			int transportfee = service.ShoppingCartService.transportfee(shippingmethod, subtotal_sum);	//運費
			int sum = subtotal_sum + transportfee;		//訂單總金額(含運費)
			
			//把訂單輸出至資料庫
			new dao.CorderDaoImpl().add(order_id,users_id , cname, phone, email, city
					, postcode, address, notes, shippingmethod, paymethod
					, receipt, taxname, taxnumber, 0, sum);
			
			//把購物車明細，新增至資料庫
			for (Corder_detail cod : SC.getShoppingMap().values()) {
				new dao.Corder_detailDaoImpl().add( order_id , cod.getProduct_Id() 
						, cod.getProduct_Name() , cod.getProduct_price() , cod.getSingle_buynum());
			}
			
			//新增訂單完成，清除 購物車Session、資料庫購物車
			request.getSession().removeAttribute("ShoppingCart");
			if (users_id != null) {
				boolean deleteSuccess = new dao.ShoppingcartDaoImpl().deleteUIDAll(users_id);
				System.out.println("CorderServlet 刪除: " + deleteSuccess);
			}
			
			request.setAttribute("order_id", order_id);
			request.setAttribute("shippingmethod", shippingmethod);
			request.setAttribute("paymethod", paymethod);
			request.setAttribute("sum", sum);
			
			request.getRequestDispatcher("cart_complete.jsp").forward(request, response);
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
