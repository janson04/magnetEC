package dao;

import java.util.List;

import model.Product;

public interface ProductDao {
	//C 創建
    
	//R 讀取
	    List<Product> queryAllList();
	    List<Product> queryListforCategory(String category);
	    Product queryforProductId(String productId);
	    
	//U 更新
	    
	//D 刪除
}
