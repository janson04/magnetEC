package dao;

import java.util.List;

import model.Users;


public interface UsersDaoImpl {

//C 創建
	boolean add(String users_id,String users_password,String name, String photo
    		,String email,String city,String postcode,String address
    		,String registerTime);
    
//R 讀取
    List<Users> queryAllList();
    Users queryUsers(String users_id);
    boolean queryIsUserId(String users_id);
    
//U 更新
	boolean updateUsersNotPasswordTime(Users user);
	boolean updateUsersPassword(String users_id ,String password);
    
//D 刪除
	boolean deleteUsers(String users_id);
	
}
