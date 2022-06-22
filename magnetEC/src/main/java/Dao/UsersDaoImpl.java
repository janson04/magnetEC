package Dao;

import Model.Users;
import java.util.List;


public interface UsersDaoImpl {

//C 創建
    void add(String username,String password, String name);
    
//R 讀取
    List<Users> queryAllList();
    Users queryUsers(String username);
    boolean queryIsUsername(String username);
    
//U 更新
    
//D 刪除
}
