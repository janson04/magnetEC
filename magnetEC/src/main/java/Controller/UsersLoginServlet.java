package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UsersDao;
import Model.Users;

@WebServlet("/login.do")
public class UsersLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UsersLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean islogin = false;
		String id = request.getParameter("inputID");
        String password = request.getParameter("inputPassword");
        if (id.equals("") || password.equals("")) {
        	Users u = new UsersDao().queryUsers(id);
        	if (u == null) {
        		islogin = false;
        		request.setAttribute("loginfail", "yes");
        		response.sendRedirect("users_login.jsp");
        	}
            response.sendRedirect("users_login.jsp");
        }else {
            request.getSession().setAttribute("login", id);
            request.getRequestDispatcher("/user.view").forward(request, response);
        }
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
