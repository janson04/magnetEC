package service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import dao.CorderDaoImpl;
import model.Corder;

public class CorderService {
    //尋找一個新的沒重複的OrderID
    public static String orderNewID(){       
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd"); //時間格式
        String nowdata = dtf.format(LocalDateTime.now());  //依照上面時間格式回傳現在時間
        
        int Cordersize = new CorderDaoImpl().fuzzySearchCOID(nowdata).size();
        int idnum = Cordersize + 1;
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
    
    public static List<Corder> getCorderListByUID(String users_id) {
    	List<Corder> l = new CorderDaoImpl().queryUIDList(users_id);
    	for (Corder cod:l) {
    		System.out.println("CorderService getCorderListByUID: " + cod.toString());
    		System.out.println("------");
    	}
		return l;
    }
    
}
