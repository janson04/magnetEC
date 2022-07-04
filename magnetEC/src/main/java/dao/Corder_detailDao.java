package dao;

import static dao.MySQLDao.conn;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Corder_detail;

public class Corder_detailDao implements Corder_detailDaoImpl {
    
    
    //新增資料
    @Override
    public void add(String corder_Id, String product_Id, String product_Name, int product_price, int single_buynum) {
        MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="INSERT INTO `Corder_detail`( corder_Id, product_Id, product_Name, product_price,single_buynum) VALUES(?,?,?,?,?)";
            try {
                PreparedStatement ps = conn.prepareStatement(sqltext);
                ps.setString(1,corder_Id);
                ps.setString(2, product_Id);
                ps.setString(3,product_Name);
                ps.setInt(4, product_price);
                ps.setInt(5, single_buynum);

                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(Corder_detailDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
    }
    
    //依據訂單ID尋找，回傳ArrayList
    @Override
    public List<Corder_detail> queryIDList(String corder_Id) {
        MySQLDao.start();
        List<Corder_detail> l = new ArrayList<>();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="SELECT * FROM `Corder_detail` WHERE corder_Id='" + corder_Id + "';";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            
            try {
                while(rs.next()){
                    l.add(new model.Corder_detail(
                            rs.getInt("id"),
                            rs.getString("corder_Id"),
                            rs.getString("product_Id"),
                            rs.getString("product_Name"),
                            rs.getInt("product_price"),
                            rs.getInt("single_buynum"))
                        );
                }
            } catch (SQLException ex) {
                Logger.getLogger(Corder_detailDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
        
        return l;
    }
    
    //刪除指定corder_Id的的資料
    @Override
    public void delete(String corder_Id) {
        MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext = "DELETE FROM `Corder_detail` WHERE corder_Id= '"+ corder_Id +"';";
            MySQLDao.executeUpdate(sqltext);
        }
        MySQLDao.stop();
    }
    
}
