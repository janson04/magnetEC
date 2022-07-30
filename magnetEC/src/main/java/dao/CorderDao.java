package dao;

import model.Corder;

import java.util.List;

public interface CorderDao {
    
    
//C 創建
	boolean add(String corder_id, String cname, String phone, String email, String city, String postcode
    		, String address, String notes, String shippingmethod, String paymethod
    		, String receipt, String taxname, String taxnumber, int member,int sum );
    
//R 讀取
    Corder queryCOID(String corder_id);
    
//U 更新
    
//D 刪除
    boolean delete(String order_id);
}
