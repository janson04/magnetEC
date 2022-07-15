package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import model.Users;
import service.UsersService;

@WebServlet("/login.do")
public class UsersLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsersLoginServlet() {
		super();
	}

	// 透過MD5演算法的不可逆性，即使使用者知道了帳號與加密後字串，也不可能解密得到金鑰或密碼。
	// 只要保護好金鑰跟演算法，該機制就是安全的
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		String id = request.getParameter("inputID");
		String password = request.getParameter("inputPassword");
		long logTime = System.currentTimeMillis(); // 現在時間(毫秒為單位)
		String ssid = null;
		int timeout = 1 * 60 * 60; 		// 1小時有效，此為秒為單位
//        int timeout = 30*24*60*60;	//30天內有效，此為秒為單位
//        int timeout = -1;				//關閉瀏覽器則失效(-1)
		
		boolean loginVerificationOK = false;
		// 判斷是否已經登入過
		if (UsersService.isLogin(request)) {
			// 如早已有登入，且action是login，則跳轉至成功登入頁面
			if ("login".equals(action)) {
				response.sendRedirect("users_login_ok.jsp");
				return;
			}
			
			//如果logout則跳過此if，執行下一個if的logout動作
		} else {
			if (id != null && password != null) {
				if (id.equals("")) {
					request.setAttribute("loginfailMessage", "ID不能為空，請輸入ID");
					request.getRequestDispatcher("users_login.jsp").forward(request, response);
				} else {
					Users u = new UsersDao().queryUsers(id);
					
					if (u == null) {
						request.setAttribute("loginfailMessage", "沒有此User ID: " + id + "<br/>請確認輸入是否正確");
						request.getRequestDispatcher("users_login.jsp").forward(request, response);
						return;
					} else if(!u.getUsers_password().equals(password)) {					
						request.setAttribute("loginfailMessage", "密碼錯誤，請重新輸入");
						request.setAttribute("ID", id);
						request.getRequestDispatcher("users_login.jsp").forward(request, response);
						return;
					} else {
						//帳號密碼相符，登入成功
						request.removeAttribute("loginfailMessage");
						loginVerificationOK = true;
					}
				}
			}else {
				//如果id或password其中一值為null，有可能不是正常送出登出請求，導引至登入頁
				response.sendRedirect("users_login.jsp");
				return;
			}
		}
		
		
		if ("login".equals(action) && loginVerificationOK) {
			// 沒登入過，但帳號密碼正確(loginVerificationOK=true)，則設定相關Session與Cookie
			ssid = service.UsersService.calSsidMd5(id + service.UsersService.KEY, logTime);
			
			//設定Session的ssid值和user值，代表已經登入
			request.getSession().setAttribute("ssid", ssid);
			request.getSession().setAttribute("user", new dao.UsersDao().queryUsers(id) );
			System.out.println("成功登入: ssid & user 設定Session完成");
			
			Cookie IDCookie = new Cookie("ID", id); // 新增Cookie
			IDCookie.setMaxAge(timeout); 		// 設定Cookie的失效時間長度

			Cookie logTimeCookie = new Cookie("logTime", String.valueOf(logTime)); // 新增Cookie
			logTimeCookie.setMaxAge(timeout); 	// 設定Cookie的失效時間長度

			Cookie ssidCookie = new Cookie("ssid", ssid); // 新增Cookie
			ssidCookie.setMaxAge(timeout); 		// 設定Cookie的失效時間長度

			response.addCookie(IDCookie); 		// 輸出到用戶端
			response.addCookie(logTimeCookie); 	// 輸出到用戶端
			response.addCookie(ssidCookie); 	// 輸出到用戶端

			// 跳轉至成功登入頁面
			response.sendRedirect("users_login_ok.jsp");

			return;
		} else if ("logout".equals(action)) {
			//如果action是logout，直接登出
			
			//清出Session的ssid值/user值，代表已經登出
			request.getSession().removeAttribute("ssid");
			request.getSession().removeAttribute("user");
			
			Cookie IDCookie = new Cookie("ID", ""); // 新增Cookie
			IDCookie.setMaxAge(0); 				// 設定失效時間長度為0 => 刪除

			Cookie logTimeCookie = new Cookie("logTime", ""); // 新增Cookie
			logTimeCookie.setMaxAge(0); 		// 設定失效時間長度為0 => 刪除

			Cookie ssidCookie = new Cookie("ssid", ""); // 新增Cookie
			ssidCookie.setMaxAge(0); 			// 設定失效時間長度為0 => 刪除

			response.addCookie(IDCookie); 		// 輸出到用戶端
			response.addCookie(logTimeCookie); 	// 輸出到用戶端
			response.addCookie(ssidCookie); 	// 輸出到用戶端
			
			// 跳轉至成功登出頁面
			response.sendRedirect("users_logout_ok.jsp");
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
