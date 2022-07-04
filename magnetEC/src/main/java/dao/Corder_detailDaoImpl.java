package dao;

import java.util.List;

import model.Corder_detail;

interface Corder_detailDaoImpl {
    
	//C 創建
	void add(String corder_Id, String product_Id, String product_Name, int product_price, int single_buynum);
	    
	//R 讀取
	    List<Corder_detail> queryIDList(String order_id);
	    
	//U 更新
	    
	//D 刪除
	    void delete(String order_id);
	}