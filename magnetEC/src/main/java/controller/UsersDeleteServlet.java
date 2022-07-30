package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDaoImpl;
import model.Users;

/**
 * Servlet implementation class UsersDelete
 */
@WebServlet("/users/users_delete")
public class UsersDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsersDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean deleteSuccess = false;

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		// 如果users_id已經存在資料庫，才會進行刪除
		Users user = (Users) request.getSession().getAttribute("user");
		if (user != null) {
			String users_id = user.getUsers_id();

			if (!new UsersDaoImpl().queryIsUserId(users_id)) {
				// 沒有此帳號，就無法更新，所以回傳失敗
				deleteSuccess = false;
			} else {
				System.out.println("要刪除的ID: " + users_id);
				deleteSuccess = new UsersDaoImpl().deleteUsers(users_id);
			}

			if (deleteSuccess) {
				// 成功更新，所以也要更新Session的user
				request.getSession().removeAttribute("user");
				System.out.println("UsersDeleteServlet: 刪除成功");

				response.sendRedirect("login.do?action=delete");

			} else {
//			response.sendRedirect("users_register.jsp");
				System.out.println("UsersDeleteServlet: 刪除失敗");
			}
		}else {
			System.out.println("UsersDeleteServlet: 沒有ID可以刪除");
		}

		response.getWriter().append("會員刪除頁面未跳轉錯誤");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
