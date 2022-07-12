package dao;

import static dao.MySQLDao.conn;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Users;


public class UsersDao implements UsersDaoImpl{
    public static void main(String[] args) {
    	//add() 測試
//    	new UsersDao().add("ID","a12345678","測試名稱","0935123456","","","","","");
	}
    
    
    //R 讀取
    @Override
    public List<Users> queryAllList() {
    	// TODO : 修改
        MySQLDao.start();
        List<Users> l = new ArrayList<>();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="SELECT * FROM `users`";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            
            try {
                while(rs.next()){
                    l.add(new model.Users(
                    		rs.getString("users_id"),
                            rs.getString("users_name"),
                            rs.getString("users_password"),
                            rs.getString("name"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("city"),
                            rs.getString("postcode"),
                            rs.getString("address"),
                            rs.getString("registerTime"))
                    );
                }
            } catch (SQLException ex) {
                Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
        
        return l;
    }
    
    //藉由users_id找出整筆Users
    @Override
    public Users queryUsers(String users_id) {
        MySQLDao.start();
        Users u=null;
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="SELECT * FROM `users` WHERE users_id=\'"+users_id+"\'";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            try {
                if (rs != null){                	
                	if (rs.next()) {
                		u=new Users();
                    	u.setUsers_id(rs.getString("users_id"));
                        u.setUsers_password(rs.getString("users_password"));
                        u.setName(rs.getString("name"));
                        u.setPhoto(rs.getString("phone"));
                        u.setEmail(rs.getString("email"));
                        u.setCity(rs.getString("city"));
                        u.setPostcode(rs.getString("postcode"));
                        u.setAddress(rs.getString("address"));
                        u.setRegisterTime(rs.getString("registerTime"));
                	}
                }
            } catch (SQLException ex) {
                System.out.println("UsersDao queryUsers Error: "+ex.getMessage());
            }
        }
        MySQLDao.stop();
        return u;
    }
    
    //查找帳號是否存在
    @Override
    public boolean queryIsUserId(String users_id) {
        MySQLDao.start();
        boolean IsUsersid=false;
        List<Users> l = new ArrayList<>();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="SELECT * FROM `users` WHERE users_id=\'"+users_id+"\'";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            try {
            	IsUsersid = rs.next();
            } catch (SQLException ex) {
                Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
        return IsUsersid;
    }

    //新增帳號
    @Override
    public boolean add(String users_id,String users_password,String name, String phone
    		,String email,String city,String postcode,String address
    		,String registerTime)
    {
    	boolean addSuccess=false;
        MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
        	int runline = 0;
        	String sqltext="INSERT INTO users(users_id ,users_password ,name ,phone "
        			+ ",email ,city ,postcode ,address ,registerTime) "
        			+ "VALUES(?,?,?,?,?,?,?,?,?)";
            try {
                PreparedStatement ps = conn.prepareStatement(sqltext);
                
                ps.setString(1, users_id);
                ps.setString(2, users_password);
                ps.setString(3, name);
                ps.setString(4, phone);
                ps.setString(5, email);
                ps.setString(6, city);
                ps.setString(7, postcode);
                ps.setString(8, address);
                ps.setString(9, registerTime);

                runline = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(Corder_detailDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(runline > 0){
                System.out.println("新增帳號成功");
                addSuccess = true;
            }else{
                System.out.println("新增帳號失敗");
                addSuccess = false;
            }
        }
        MySQLDao.stop();
        return addSuccess;
    }  

}
