package service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import model.Corder_detail;
import model.Product;

//購物車
public class ShoppingCartService {
    //key：商品編號 value:商品條目
    private Map<String,Corder_detail> shoppingMap = new HashMap<String,Corder_detail>();
    
    //購買商品數量+1
    public void addProduct(Product p){
    	if (p != null) {
	        String productId=p.getProductId();
	        if(shoppingMap.containsKey(productId)){
	            Corder_detail od=shoppingMap.get(productId);
	            od.setSingle_buynum(od.getSingle_buynum()+1);
	        }else{
	            Corder_detail od=new Corder_detail(p);
	            od.setSingle_buynum(1);
	            shoppingMap.put(productId, od);
	        }
    	} else {
    		System.out.println("ShoppingCartService addProduct: Product 為 null 無法新增");
    	}
    }
    
    //購買商品+"指定數量"
    public void addProduct(Product p,int buynum){
        if (p != null) {
        	if (buynum>0){  //驗證加的數量>0才會新增
        		String productId=p.getProductId();
        		if(shoppingMap.containsKey(productId)){
        			Corder_detail od=shoppingMap.get(productId);
        			
        			//檢查增加的數量是否會大於該Product的庫存，最多只能到最大庫存
        			if(od.getSingle_buynum()+buynum > p.getStock() ) {
        				od.setSingle_buynum(p.getStock());
        			} else {
        				od.setSingle_buynum(od.getSingle_buynum()+buynum);
        			}
        		}else{
        			Corder_detail od=new Corder_detail(p);
        			
        			//檢查增加的數量是否會大於該Product的庫存，最多只能到最大庫存
        			if( buynum > p.getStock() ) {
        				od.setSingle_buynum(p.getStock());
        			}else {
        				od.setSingle_buynum(buynum);
        			}
        			shoppingMap.put(productId, od);
        		}
        	}
        } else {
        	System.out.println("ShoppingCartService addProduct: Product 為 null 無法新增");
        }
    }
    
    
    //刪除商品
    public boolean deleteProduct(String productId){
        if(shoppingMap.containsKey(productId)){
            shoppingMap.remove(productId);
            return true;
        }
        return false;
    }

    public Map<String, Corder_detail> getShoppingMap() {
        return shoppingMap;
    }
    
    //修改商品購買數量
    public boolean modifyProduct(String productId,int count){
        if(shoppingMap.containsKey(productId)){
            if(count>=1){
                Corder_detail od = shoppingMap.get(productId);
                od.setSingle_buynum(count);
                return true;
            }else if(count==0){//刪除該商品
                deleteProduct(productId);
                return true;
            }	
        }
        return false;
    }
    
    //清空購物車
    public void clearCart(){
        shoppingMap.clear();
    }
    
    //Show訂單資訊
    public void showAll(){
    	Collection<Corder_detail> productBuyItems = shoppingMap.values();
    	Iterator<Corder_detail> iterator = productBuyItems.iterator();
    	while(iterator.hasNext()){
    		Corder_detail od = iterator.next();
//            Product product = od.getProduct();
    		System.out.println("商品編號："+ od.getProduct_Id() +",商品名稱："
    				+od.getProduct_Name()+",單價："+od.getProduct_price()+",數量："+od.getSingle_buynum()
    				+",小計："+ (od.getProduct_price()*od.getSingle_buynum()));
    	}
    }
    
    //商品單價*數量總金額 (未包含活動跟會員等級)
    public int totalAllMoney(){
        int total=0;
        Collection<Corder_detail> productBuyItems = shoppingMap.values();
        Iterator<Corder_detail> iterator = productBuyItems.iterator();
        while(iterator.hasNext()){
            Corder_detail od = iterator.next();
            double money = od.getProduct_price() * od.getSingle_buynum();
            total+=money;
        }
        return total;
    }
    
    //運費計算
    public static int transportfee(String transport, long subtotal) {
    	
    	int transportThreshold = 1000;		//設定運費優惠門檻
    	
    	//如果為空，預設為宅配(delivery)
    	if (transport == null) {
    		transport = "delivery";
    	}
    	
    	//判斷運費為何
   		switch (transport) {
               case "delivery":
               case "宅配":
					System.out.println("運送方式: delivery(宅配)");
					if (subtotal >= transportThreshold ) {
						return 0;
					}else{
						return 60;
					}

               case "cashondelivery":
               case "貨到付款":
            	   System.out.println("運送方式: cashondelivery(貨到付款)");
                   	if (subtotal >= transportThreshold ) {
                   		return 50;
                   	}else{
                   		return 80;
                   	}

               default:
                   System.out.println("非宅配或是貨到付款");
                   return 10000000;
           }
   		
    }
    
    //購物車商品總數量
    public int shoppingMapSize() {
    	int num = 0;
    	for(Corder_detail co : shoppingMap.values()) {
    		num += co.getSingle_buynum();
    	}
    	return num;
    }
}
