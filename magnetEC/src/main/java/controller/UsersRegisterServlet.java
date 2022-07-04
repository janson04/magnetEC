package controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;


@WebServlet("/users_register")
public class UsersRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UsersRegisterServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean addSuccess = false;
		
		request.setCharacterEncoding("UTF-8");
		
		//如果users_id已經存在資料庫，則回傳失敗
		String users_id = request.getParameter("users_id");
		System.out.println(users_id);
		if (new UsersDao().queryIsUserId(users_id)) {
			addSuccess = false;
		}else {
			String users_password = request.getParameter("users_password");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String city = request.getParameter("city");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String registerTime = LocalDateTime.now().toString();
			System.out.println(users_id
					+"\t"+name
					+"\t"+phone
					+"\t"+email
					+"\t"+city
					+"\t"+postcode
					+"\t"+address
					+"\t"+registerTime);
			
			addSuccess= new UsersDao().add(users_id, users_password, name,
					phone, email, city, postcode, address, registerTime);
		}
		
		if (addSuccess) {
			response.sendRedirect("users_register_ok.jsp");
		}else {
			response.sendRedirect("users_register.jsp");
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
