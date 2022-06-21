package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class MySQLDao { 
    public static String DB_URL = "jdbc:mysql://locahost:3306/magnetec?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Taipei";
    public static boolean DB_ConnectionStatus=false;
 
    //資料庫的用戶名與密碼
    static final String USER = "root";
    static final String PASS = "1234";
    
    static Connection conn = null;
    static Statement stmt = null;
    public static ResultSet rs = null;
    
    public void MySQL() {
    }
   
    public static void start(){
            try{
            // 確認 JDBC 驅動
            Class.forName("com.mysql.cj.jdbc.Driver");
                    
            // 連接資料庫
            System.out.println("連接資料庫中...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            
            System.out.println("實體化Statement對象...");
            stmt = conn.createStatement();
            
            DB_ConnectionStatus = true;
        }catch(SQLException se){
            // 處理 JDBC 錯誤
            se.printStackTrace();
            DB_ConnectionStatus = false;
            JOptionPane.showMessageDialog(null,"請重新確認資料庫IP，或資料庫是否在線","資料庫連線失敗",JOptionPane.ERROR_MESSAGE);
        } catch (ClassNotFoundException ex) {
            DB_ConnectionStatus = false;
            JOptionPane.showMessageDialog(null,"請確認是否JDBC驅動還存在","找不到JDBC驅動",JOptionPane.ERROR_MESSAGE);
            Logger.getLogger(MySQLDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void stop() {
        try{
            if(stmt!=null) stmt.close();
        }catch(SQLException se2){
        }//什麼都不做
        try{
            if(conn!=null) conn.close();
        }catch(SQLException se){
            se.printStackTrace();
        }
        System.out.println("Goodbye MySQL");
    }
    
    public static ResultSet executeQuery(String sqlCommand){
        try {
            
//            sqlCommand = "SELECT * FROM `Order` WHERE order_id='OD-20220509001'";
            
            // 執行查詢指令(SELECT)
            rs = stmt.executeQuery(sqlCommand);     //回傳ResultSet
            
            //資料庫輸出範例
//            while(rs.next())  //此處有資料會回傳ture，沒資料會回傳false
//            {
//                String Cname = rs.getString("Cname");     //Cname是資料庫的欄位名稱
//                String member = rs.getString("Member");   //Member是資料庫的欄位名稱
//                String Sum = rs.getString("Sum");         //Sum是資料庫的欄位名稱
//                
//                // 輸出資料
//                System.out.print("客戶名稱: " + Cname);
//                System.out.print("\t會員等級: " + member);
//                System.out.print("\t訂單金額: " + Sum);
//                System.out.print("\n");
//            }
        } catch (SQLException ex) {
            Logger.getLogger(MySQLDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public static int executeUpdate(String sqlCommand){
        int rs = 0;
        try {
            
//            sqlCommand = "INSERT INTO `Order`( order_id, Cname, Member, Sum) VALUES(\'"+ order_id + "\',\'" + Cname + "\'," + Member + "," + Sum +");";
            // 執行插入/更新/刪除等指令(INSERT, UPDATE, DELETE)       
            rs = stmt.executeUpdate(sqlCommand);    //此處回傳的是執行成功的指令
            
            //寫入新值範例
//            System.out.println(sqlCommand);
//            if(stmt.executeUpdate(sqlCommand) > 0){
//                System.out.println("執行成功");
//            }else{
//                System.out.println("執行失敗");
//            }

        } catch (SQLException ex) {
            Logger.getLogger(MySQLDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public static void show_disconnection_message(){
        JOptionPane.showMessageDialog(null,"請重建連線","資料庫斷線",JOptionPane.ERROR_MESSAGE);
    }
    
}