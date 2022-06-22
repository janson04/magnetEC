package Dao;

import java.util.List;
import Model.Product;

public interface ProductDaoImpl {
	//C 創建
    
	//R 讀取
	    List<Product> queryAllList();
	    List<Product> queryListforCategory(String category);
	    Product queryforProductId(String productId);
	    
	//U 更新
	    
	//D 刪除
}
