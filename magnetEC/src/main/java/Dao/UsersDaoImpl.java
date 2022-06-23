package Dao;

import Model.Users;
import java.util.List;


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
    
//D 刪除
}
