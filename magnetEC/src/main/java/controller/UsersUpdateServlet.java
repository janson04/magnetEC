package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDaoImpl;
import model.Users;

@WebServlet("/users/users_update")
public class UsersUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsersUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean updateSuccess = false;

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 取出所有Parameter
		System.out.println("------開始取出Parameter------");

		// 返回包含名稱的字符串對象的Enumeration
		// 此request中包含的parameters。
		Enumeration paramNames = request.getParameterNames();

		// 如果enumeration包含更多的 elements，則讀取下一個(nextElement)繼續取出
		while (paramNames.hasMoreElements()) {
		     String paraName = (String)  paramNames.nextElement();
		     System.out.print(paraName + ": ");
		     String[] paramValues =  request.getParameterValues(paraName);
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
		              System.out.print(paramValues[i]+"\t");
		         }
		         System.out.println("");
		     }
		}
		System.out.println("------結束取出Parameter------");

		
		// 如果users_id已經存在資料庫，才會進行更新
		String action = request.getParameter("action");
		Users user = (Users) request.getSession().getAttribute("user");
		String users_id = user.getUsers_id();
		String old_password = user.getUsers_password();
		System.out.println(users_id);
		if (!new UsersDaoImpl().queryIsUserId(users_id)) {
			// 沒有此帳號，就無法更新，所以回傳失敗
			updateSuccess = false;
		} else {
			if("update".equals(action)) {
				Users u = new Users();
				u.setUsers_id(users_id);
//				u.setUsers_password(request.getParameter("users_password"));
				u.setName(request.getParameter("name"));
				u.setPhone(request.getParameter("phone"));
				u.setEmail(request.getParameter("email"));
				u.setCity(request.getParameter("city"));
				u.setPostcode(request.getParameter("postcode"));
				u.setAddress(request.getParameter("address"));
//				u.setRegisterTime(LocalDateTime.now().toString());
				
				System.out.println("要更新的資料: " + u.toString());
				
				updateSuccess = new UsersDaoImpl().updateUsersNotPasswordTime(u);
			}else if ("changepw".equals(action)) {
				String old_users_password = request.getParameter("old_users_password");
				String new_users_password = request.getParameter("users_password");
				if (old_password.equals(old_users_password)) {
					updateSuccess = new UsersDaoImpl().updateUsersPassword(
							users_id 
							,new_users_password);
				} else {
					System.out.println("UsersUpdateServlet: 舊密碼錯誤");
					updateSuccess = false;
				}
			}
		}

		if (updateSuccess) {
			//成功更新，所以也要更新Session的user
			request.getSession().setAttribute("user", new dao.UsersDaoImpl().queryUsers(users_id) );
			System.out.println("UsersUpdateServlet: 更新成功");
			
			if ("update".equals(action)) {
				response.sendRedirect("users_edit_ok.jsp");
			}else if ("changepw".equals(action)) {
				response.sendRedirect("users_changepw_ok.jsp");
			}
		} else {
//			response.sendRedirect("users_register.jsp");
			System.out.println("UsersUpdateServlet: 更新失敗");
		}

		response.getWriter().append("更新頁面未跳轉錯誤");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
