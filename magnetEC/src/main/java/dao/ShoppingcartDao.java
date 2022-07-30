package dao;

import java.util.List;

import model.Shoppingcart;

public interface ShoppingcartDao {
	//C 創建
	boolean add(String usersId, String product_Id, int singleBuynum);
	    
	//R 讀取
	List<Shoppingcart> queryUIDList(String usersId);
	Shoppingcart queryUIDPID(String usersId , String product_Id);
	
	//U 更新
	boolean update(String usersId, String product_Id, int singleBuynum);
	
	//D 刪除
	boolean deleteUIDPID(String usersId ,String product_Id);
	boolean deleteUIDAll(String usersId);
}
