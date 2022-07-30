package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Product;

public class ProductDaoImpl implements ProductDao {
	public static void main(String[] args) {
		//queryAllList() --測試開始--
//		List<Product> l1 = new ProductDao().queryAllList();
//		for (Product p:l1) {
//			System.out.println(p.toString());
//		}
		//queryAllList() --測試結束--
		
		
		//queryListforCategory(String category) --測試開始--
//		List<Product> l2 = new ProductDao().queryListforCategory("ND");
//		for (Product p:l2) {
//			System.out.println(p.toString());
//		}
		//queryListforCategory(String category) --測試結束--
		
		//queryforProductId(String productId) --測試開始--
//		Product p1 = new ProductDao().queryforProductId("ND-DS000004");
//		System.out.println(p1.toString());
		//queryforProductId(String productId) --測試結束--
	}
	
	@Override
	public List<Product> queryAllList() {
		MySQLDao.start();
        List<Product> l = new ArrayList<>();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="SELECT * FROM `product`";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            
            try {
                while(rs.next()){
                	Product p = new Product();
                	p.setProductId(rs.getString("productId"));
                	p.setProductName(rs.getString("productName"));
                	p.setCategory(rs.getString("category"));
                	p.setPrice(rs.getInt("price"));
                	p.setStock(rs.getInt("stock"));
                	p.setImgurl(rs.getString("imgurl"));
                	p.setIntroduction(rs.getString("introduction"));
                	p.setIntroHtml(rs.getString("introHtml"));
                	
                    l.add(p);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
        
        return l;
	}

	@Override
	public List<Product> queryListforCategory(String category) {
		MySQLDao.start();
        List<Product> l = new ArrayList<>();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="select * from product where category='" + category+"'";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            
            try {
                while(rs.next()){
                	Product p = new Product();
                	p.setProductId(rs.getString("productId"));
                	p.setProductName(rs.getString("productName"));
                	p.setCategory(rs.getString("category"));
                	p.setPrice(rs.getInt("price"));
                	p.setStock(rs.getInt("stock"));
                	p.setImgurl(rs.getString("imgurl"));
                	p.setIntroduction(rs.getString("introduction"));
                	p.setIntroHtml(rs.getString("introHtml"));
                	
                    l.add(p);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
        
        return l;
	}

	@Override
	public Product queryforProductId(String productId) {
		Product p = null;
		
		MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext="select * from product where productId='" + productId+"'";
            ResultSet rs = MySQLDao.executeQuery(sqltext);
            
            try {
                while(rs.next()){
                	p = new Product();
                	p.setProductId(rs.getString("productId"));
                	p.setProductName(rs.getString("productName"));
                	p.setCategory(rs.getString("category"));
                	p.setPrice(rs.getInt("price"));
                	p.setStock(rs.getInt("stock"));
                	p.setImgurl(rs.getString("imgurl"));
                	p.setIntroduction(rs.getString("introduction"));
                	p.setIntroHtml(rs.getString("introHtml"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        MySQLDao.stop();
        
        return p;
	}

}
