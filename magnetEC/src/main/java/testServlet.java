
import java.io.IOException;
import java.util.Enumeration;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersService.isLogin(request);

		
		// 取出所有Parameter
		System.out.println("------開始取出Parameter------");
		
		// 返回包含名稱的字符串對象的Enumeration
		// 此request中包含的parameters。
		Enumeration paramNames = request.getParameterNames();
		// Tests if this enumeration contains more elements.
		while (paramNames.hasMoreElements()) {
			String paraName = (String) paramNames.nextElement();
			System.out.print(paraName + ": ");
			String[] paramValues = request.getParameterValues(paraName);
			// 當此參數只有一個時
			if (paramValues.length == 1) {
				String paramValue = paramValues[0];
				if (paramValue.length() == 0) {
					System.out.println("no value");
				} else {
					System.out.println(paramValue);
				}
			} else {
				// 當此參數有好幾個值時
				for (int i = 0; i < paramValues.length; i++) {
					System.out.print(paramValues[i]);
				}
				System.out.println("");
			}
		}
		System.out.println("------結束取出Parameter------");

		response.getWriter().append("testServlet!");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
