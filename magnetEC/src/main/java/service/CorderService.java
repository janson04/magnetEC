package service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import dao.CorderDaoImpl;

public class CorderService {
    //尋找一個新的沒重複的OrderID
    public static String orderNewID(){       
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd"); //時間格式
        String nowdata = dtf.format(LocalDateTime.now());  //依照上面時間格式回傳現在時間
        
        int idnum=1;
        String order_id="";
        
        boolean idnumOK = false;
        while(! idnumOK){
            order_id = "OD-" +  nowdata + String.format("%03d",idnum);
            
            if (new CorderDaoImpl().queryCOID(order_id) != null){
                idnumOK = false;
                idnum += 1;
            } else {
                idnumOK = true;
            }
        }
            
        return order_id;
    }
    
    /*
    //把訂單資料輸出至資料庫
    public void outputToDB(boolean isNew){
        String Cname = od.getCname();
        int Member = od.getMember();
        int Sum = od.getSum();
        String sqltext;

        //如果為舊訂單，先把舊訂單先刪除光
        if (!isNew){
            //刪除Order_detail內的資料(有關聯到Order所以一定要先刪除)
            new Dao.Order_detailDao().delete(od.getOrder_id());

            //刪除Order內的資料
           CorderDaoImpl.OrderDao().delete(od.getOrder_id());
        }  

        //處理Table Order的新增或修改
       CorderDaoImpl.OrderDao().add(od.getOrder_id(),Cname,Member,Sum);


        //把新的資料新增至資料庫
        Map<Integer, Order_detail> sm = getShoppingCart().getShoppingMap();
        
        Collection<Order_detail> odColl = sm.values();
        Iterator<Order_detail> iterator = odColl.iterator();

        while(iterator.hasNext()){
            Order_detail odsigle = iterator.next();

            if (odsigle.getProduct_id()>0){
                System.out.println("商品編號："+odsigle.getProduct_id()+",商品名稱："
                +odsigle.getProduct_name()+",單價："+odsigle.getProduct_price()+",數量："+odsigle.getSingle_buynum()
                +",小計："+odsigle.getProduct_price()*odsigle.getSingle_buynum());
                
                new Dao.Order_detailDao().add(od.getOrder_id(), odsigle.getProduct_id(), odsigle.getProduct_name(), odsigle.getProduct_category(), odsigle.getProduct_price(), odsigle.getSingle_buynum());
            }
        }
    }
    */
}
