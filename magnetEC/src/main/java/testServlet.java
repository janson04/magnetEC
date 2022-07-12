

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UsersService;

/**
 * Servlet implementation class testServlet
 */
@WebServlet("/testS")
public class testServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public testServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsersService.isLogin(request);
		response.getWriter().append("testServlet!");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
