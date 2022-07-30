package controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cart/CorderSend")
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
		
		//如果ShoppingCart內沒有商品或商品數量小於等於0，則跳轉至第一頁，顯示"您沒有選擇任何商品"
		if (request.getSession().getAttribute("ShoppingCart") != null) {
			service.ShoppingCartService SC = ((service.ShoppingCartService) request.getSession().getAttribute("ShoppingCart"));
			if (SC.shoppingMapSize() <= 0) {
				// 跳轉至結帳第一頁
				response.sendRedirect("cart_start.jsp");
				return;
			}
		}
		
		//驗證param是否正確，如不正確，則導回首頁
		//讀取所有的的param
		String shippingmethod = request.getParameter("transport");
		String paymethod = request.getParameter("pay");
		
		String users_id = null;
		model.Users user = (model.Users) request.getSession().getAttribute("user");
		if (user != null) { users_id = user.getUsers_id();}
		
		String cname = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String notes = request.getParameter("notes");
		String receipt = request.getParameter("receipt");
		String taxname = request.getParameter("taxname");
		String taxnumber = request.getParameter("taxnumber");
		
		System.out.println(
				"users_id: "+users_id	//不一定會有，有登入才有
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
				);
		
		//如果有以下有一項為空值，代表為非法執行，直接導回首頁
		if (	shippingmethod == null || paymethod == null || cname == null || phone == null
				|| email == null || city == null || postcode == null || address == null
				|| notes == null || receipt == null || taxname == null || taxnumber == null
				) {
			// 跳轉至首頁
			response.sendRedirect("/magnetEC/index.jsp");
			return;
		}
		
		//依照規則再次驗證傳入的值
		if (	shippingmethod.isEmpty() || paymethod.isEmpty() || cname.isEmpty() || email.isEmpty()
				|| Pattern.matches("^[0][9][0-9]{8}$" , phone)
				|| Pattern.matches("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$", email)
				|| city.isEmpty()
				|| Pattern.matches("[0-9]{3,6}" , postcode)
				|| address.isEmpty() || receipt.isEmpty()
				|| ( "TriplicateInvoices".equals(receipt) && (taxname.isEmpty() || Pattern.matches("^[0-9]{8}$",taxnumber)) )
				) {
			response.getWriter().println("驗證成功");
			response.getWriter().println(user);
		} else {
			response.getWriter().println("驗證失敗");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
