package service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import dao.UsersDao;
import model.Users;

@Path("/")
public class UsersService {
	
	@POST
    @Path("/checkUsersId")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String CheckUserId(@FormParam("users_id") String users_id) {
		boolean IsUsersid = false;
		if (users_id != null) {
			IsUsersid= new UsersDao().queryIsUserId(users_id);
		}
        System.out.println("users_id: "+users_id+"\tCheck: "+IsUsersid);
        return String.valueOf(IsUsersid);
    }
	
	@POST
	@Path("/checkOldPassword")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String CheckOldPassword(@FormParam("old_users_password") String old_users_password,
			@Context HttpServletRequest request) {
		boolean OldPasswordCheck = false;
		
		// 如果users_id已經存在資料庫，才會進行確認密碼是否正確
		Users user = (Users) request.getSession().getAttribute("user");
		String users_id = user.getUsers_id();
		System.out.println(users_id);
		if (!new UsersDao().queryIsUserId(users_id)) {
			// 沒有此帳號，就無法確認密碼，所以回傳失敗
			OldPasswordCheck = false;
		} else {
			if (old_users_password != null) {
				Users u = new UsersDao().queryUsers(users_id);
				if(u.getUsers_password().equals(old_users_password)) {
					OldPasswordCheck = true;
				}else {
					OldPasswordCheck = false;
				}
			}
		}
		System.out.println("UsersService CheckOldPassword: "+"users_id: "+users_id+"\told_users_password: "+old_users_password+"\tCheck: "+OldPasswordCheck);
		return String.valueOf(OldPasswordCheck);
	}
	
	
	public static void main(String[] args) {
		//測試: public static String calcMD5(String ss) --開始--
		System.out.println(System.currentTimeMillis());
		calSsidMd5("李易展",System.currentTimeMillis());
		//測試: public static String calcMD5(String ss) --結束--
	}
	
	public static final String KEY = ":cookie:janson04@gmail.com";	//金鑰
	public static boolean isLogin(HttpServletRequest request) {
		boolean islogin = false;
		
		HttpSession session = request.getSession();
		//如果Session有ssid代表已經登入過
        if(session.getAttribute("ssid") != null && session.getAttribute("user") != null) {
//        	System.out.println(session.getAttribute("ssid"));
        	System.out.println("UsersService.isLogin\nUser登入資訊: " + session.getAttribute("user"));
        	islogin = true;
        	return islogin;
        }
        
        /* 如果Session的ssid為空，代表Session尚未有登入資訊
         * 則改讀取Cookie做驗證，驗證通過一樣算已經登入，且再把ssid儲存至Session以便下次認證
        */
		String id = null;					//清空id資訊，要從Cookie內重新讀取
		long logTime = 0;					//清空logTime資訊，要從Cookie內重新讀取
		String ssid = null;					//清空ssid資訊，要從Cookie內重新讀取
        
		if(request.getCookies() != null) {
			for(Cookie cookie:request.getCookies()) {
				if(cookie.getName().equals("ID")) {
					id = cookie.getValue();
				}
				if(cookie.getName().equals("logTime")) {
					logTime = Long.parseLong(cookie.getValue());
				}
				if(cookie.getName().equals("ssid")) {
					ssid = cookie.getValue();
				}
			}
		}
		
		//如果id、ssid都不為空，且logTime不為0，則進行驗證，通過視為已經登入
		if(id != null && logTime != 0 && ssid != null ) {
			islogin = ssid.equals(service.UsersService.calSsidMd5(id + KEY , logTime));	//如果MD5計算出來一樣，視為登入
			if(islogin) {
				request.getSession().setAttribute("ssid", ssid);
				request.getSession().setAttribute("user", new dao.UsersDao().queryUsers(id) );
				System.out.println("Cookie已經登入過: ssid & user 設定Session完成");
			}else {
				request.getSession().removeAttribute("ssid");
				request.getSession().removeAttribute("user");
			}
		}
		
		return islogin;
	}
	
	//計算ssid的MD5
	public static String calSsidMd5(String ss, long CurrentTimeMillis) {
		String s = ss==null ? (""+CurrentTimeMillis) : (ss+CurrentTimeMillis);
		char hexDigits[]= {'0','1','2','3','4','5','6','7','8','9'
				,'a','b','c','d','e','f'};		//字典
		byte[] strTemp = s.getBytes();		//獲得位元組
		try {
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");	//獲得MD5
			mdTemp.update(strTemp);			//更新資料
			byte[] md =mdTemp.digest();		//加密
			int j = md.length;
			char str[] = new char[j*2];
			int k = 0;
			for (int i=0;i<j;i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];	/*
															  byte 8位
															  不帶符號 右移 四位(不管byte0的類型 位移處補0)
															  & 十六進制的f 即 高四位清空 取低四位的值
															  >>> 優先級高於 &
															*/
				str[k++] = hexDigits[byte0 & 0xf];
			}
			System.out.println("ssid: "+String.valueOf(str));
			return String.valueOf(str);		//加密後字串
		} catch (NoSuchAlgorithmException e) {
			System.out.println("calcMD5 Error :" + e.getMessage());
		}
		
		return ss;
	}
	
	
}
