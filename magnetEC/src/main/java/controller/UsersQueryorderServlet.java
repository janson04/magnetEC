package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Corder;
import model.Corder_detail;
import model.Users;

@WebServlet("/users/users_queryorder")
public class UsersQueryorderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UsersQueryorderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 判斷是否已經登入，沒登入過跳轉至登入畫面
		if (! service.UsersService.isLogin(request)) {
			// 跳轉至登入頁面
			response.sendRedirect("users_login.jsp");
			return;
		}
		
		Users u = (Users) request.getSession().getAttribute("user");

		List<Corder> col = service.CorderService.getCorderListByUID(u.getUsers_id());
				
		for (Corder co:col) {
			//把原本日期格式為 2022-08-01T16:50:17.775363800 改為 2022-08-01
			int Tlocation = co.getCreate_date().indexOf("T");
			if(Tlocation>0) {
				String newDateType = co.getCreate_date().substring(0, Tlocation);
				co.setCreate_date(newDateType);
			}
			
			List<Corder_detail> codl = new dao.Corder_detailDaoImpl().queryIDList(co.getCorder_id());
			co.setCodlist(codl);
		}
		
		request.setAttribute("CorderLists", col);
		
		request.getRequestDispatcher("users_queryorder.jsp").forward(request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
