package dao;

import model.Corder;

import static dao.MySQLDao.conn;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CorderDaoImpl implements CorderDao{
    public static void main(String[] args) {
    	/* --- add(String corder_id, String cname, String phone, String email, String city
    	 * , String postcode , String address, String notes, String shippingmethod, String paymethod
		 * , String receipt, String taxname, String taxnumber, int member, int sum ) :開始 ---
		*/
    	boolean addState = new CorderDaoImpl().add(
    			"OD-20220731001", null, "李小馬", "0912345678", null, "桃園市"
    			, "330", "幸福路", null, "宅配", "匯款"
    			, "二聯式", null, null, 1, 980);
    	System.out.println("CorderDaoImpl add: " + addState);
    	/* --- add(String corder_id, String cname, String phone, String email, String city
    	 * , String postcode , String address, String notes, String shippingmethod, String paymethod
		 * , String receipt, String taxname, String taxnumber, int member, int sum ) :結束 ---
		*/
    	
    	
    	//--- Corder queryCOID(String corder_id) :開始 ---
    	Corder co = new CorderDaoImpl().queryCOID("OD-20220731001");
    	System.out.println("queryCOID: " + co);
    	//--- Corder queryCOID(String corder_id) :結束 ---
    	
    	//--- List<Corder> fuzzySearchCOID(String fuzzy_corder_id) :開始 ---
    	List<Corder> lco = new CorderDaoImpl().fuzzySearchCOID("20220731");
    	for (Corder cod:lco) {
    		System.out.println("fuzzySearchCOID: " + cod.toString());
    	}
    	//--- List<Corder> fuzzySearchCOID(String fuzzy_corder_id) :結束 ---
    	
    	//--- List<Corder> queryUIDList(String users_id) :開始 ---
    	List<Corder> lco2 = new CorderDaoImpl().queryUIDList("janson08");
    	for (Corder cod:lco2) {
    		System.out.println("queryUIDList: " + cod.toString());
    		System.out.println("------");
    	}
    	//--- List<Corder> queryUIDList(String users_id) :結束 ---	
    	
    	//--- boolean delete(String corder_id) :開始 ---
    	boolean deleteState = new CorderDaoImpl().delete("OD-20220731001");
    	System.out.println("CorderDaoImpl delete: " + deleteState);
    	//--- boolean delete(String corder_id) :結束 ---
	}
    
    //新增資料
    @Override
    public boolean add(String corder_id, String users_id, String cname, String phone, String email, String city
    		, String postcode , String address, String notes, String shippingmethod, String paymethod
    		, String receipt, String taxname, String taxnumber, int member, int sum ) {
		boolean addSuccess = false;
		
		MySQLDao.start();
		if (MySQLDao.DB_ConnectionStatus) {
			String sqltext = "INSERT INTO corder(corder_id ,users_id ,cname ,phone ,email ,city ,postcode "
					+ ",address ,notes ,shippingmethod ,paymethod ,receipt ,taxname , taxnumber"
					+ ",member ,sum ,create_date) VALUES(?,?,?,?,? ,?,?,?,?,? ,?,?,?,?,? ,?,?)";
			try {
				PreparedStatement ps = conn.prepareStatement(sqltext);
				ps.setString(1, corder_id);
				ps.setString(2, users_id);
				ps.setString(3, cname);
				ps.setString(4, phone);
				ps.setString(5, email);
				ps.setString(6, city);
				ps.setString(7, postcode);
				ps.setString(8, address);
				ps.setString(9, notes);
				ps.setString(10, shippingmethod);
				ps.setString(11, paymethod);
				ps.setString(12, receipt);
				ps.setString(13, taxname);
				ps.setString(14, taxnumber);
				ps.setInt(15, member);
				ps.setInt(16, sum);
				LocalDateTime now = LocalDateTime.now();
				ps.setString(17, now.toString());

				if (ps.executeUpdate() > 0) {
					addSuccess = true;
				} else {
					addSuccess = false;
				}
			} catch (SQLException ex) {
				Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		MySQLDao.stop();
		return addSuccess;
    }
    
    //依據指定ID尋找，回傳ArrayList
    @Override
    public Corder queryCOID(String corder_id) {
		MySQLDao.start();
		Corder co = null;
		if (MySQLDao.DB_ConnectionStatus) {
			String sqltext = "SELECT * FROM corder WHERE corder_id='" + corder_id + "';";
			ResultSet rs = MySQLDao.executeQuery(sqltext);

			try {
				if (rs.next()) {
					co = new Corder();
					co.setCorder_id(rs.getString("corder_id"));
					co.setUsers_id(rs.getString("users_id"));
					co.setCname(rs.getString("cname"));
					co.setPhone(rs.getString("phone"));
					co.setEmail(rs.getString("email"));
					co.setCity(rs.getString("city"));
					co.setPostcode(rs.getString("postcode"));
					co.setAddress(rs.getString("address"));
					co.setNotes(rs.getString("notes"));
					co.setShippingmethod(rs.getString("shippingmethod"));
					co.setPaymethod(rs.getString("paymethod"));
					co.setReceipt(rs.getString("receipt"));
					co.setTaxname(rs.getString("taxname"));
					co.setTaxnumber(rs.getString("taxnumber"));
					co.setMember(rs.getInt("member"));
					co.setSum(rs.getInt("sum"));
					co.setCreate_date(rs.getString("create_date"));
				}
			} catch (SQLException ex) {
				Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		MySQLDao.stop();

		return co;
    }
    
    //模糊搜尋CID
	@Override
	public List<Corder> fuzzySearchCOID(String fuzzy_corder_id) {
		List<Corder> l = new ArrayList<>();
		
		MySQLDao.start();
		Corder co = null;
		if (MySQLDao.DB_ConnectionStatus) {
			String sqltext = "SELECT * FROM corder WHERE corder_id LIKE '%" + fuzzy_corder_id + "%';";
			ResultSet rs = MySQLDao.executeQuery(sqltext);

			try {
				while (rs.next()) {
					co = new Corder();
					co.setCorder_id(rs.getString("corder_id"));
					co.setUsers_id(rs.getString("users_id"));
					co.setCname(rs.getString("cname"));
					co.setPhone(rs.getString("phone"));
					co.setEmail(rs.getString("email"));
					co.setCity(rs.getString("city"));
					co.setPostcode(rs.getString("postcode"));
					co.setAddress(rs.getString("address"));
					co.setNotes(rs.getString("notes"));
					co.setShippingmethod(rs.getString("shippingmethod"));
					co.setPaymethod(rs.getString("paymethod"));
					co.setReceipt(rs.getString("receipt"));
					co.setTaxname(rs.getString("taxname"));
					co.setTaxnumber(rs.getString("taxnumber"));
					co.setMember(rs.getInt("member"));
					co.setSum(rs.getInt("sum"));
					co.setCreate_date(rs.getString("create_date"));
					
					l.add(co);
				}
			} catch (SQLException ex) {
				Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		MySQLDao.stop();

		return l;
	}
	
	//用UID搜尋全部訂單(排序特別用 create_date DESC 最新的訂單在第一筆也就是最上面)
	@Override
	public List<Corder> queryUIDList(String users_id) {
		List<Corder> l = new ArrayList<>();
		
		MySQLDao.start();
		Corder co = null;
		if (MySQLDao.DB_ConnectionStatus) {
			String sqltext = "SELECT * FROM corder WHERE users_id = '" + users_id + "' ORDER BY create_date DESC;";
			ResultSet rs = MySQLDao.executeQuery(sqltext);

			try {
				while (rs.next()) {
					co = new Corder();
					co.setCorder_id(rs.getString("corder_id"));
					co.setUsers_id(rs.getString("users_id"));
					co.setCname(rs.getString("cname"));
					co.setPhone(rs.getString("phone"));
					co.setEmail(rs.getString("email"));
					co.setCity(rs.getString("city"));
					co.setPostcode(rs.getString("postcode"));
					co.setAddress(rs.getString("address"));
					co.setNotes(rs.getString("notes"));
					co.setShippingmethod(rs.getString("shippingmethod"));
					co.setPaymethod(rs.getString("paymethod"));
					co.setReceipt(rs.getString("receipt"));
					co.setTaxname(rs.getString("taxname"));
					co.setTaxnumber(rs.getString("taxnumber"));
					co.setMember(rs.getInt("member"));
					co.setSum(rs.getInt("sum"));
					co.setCreate_date(rs.getString("create_date"));
					
					l.add(co);
				}
			} catch (SQLException ex) {
				Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		MySQLDao.stop();

		return l;
	}

    //刪除指定order_id的的資料
    @Override
    public boolean delete(String corder_id) {
		boolean deleteSuccess = false;
		
        MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext = "DELETE FROM corder WHERE corder_id= '"+ corder_id +"';";
            if ( MySQLDao.executeUpdate(sqltext) > 0) {
            	deleteSuccess = true;
            } else {
            	deleteSuccess = false;
            }
        }
        MySQLDao.stop();
		
		return deleteSuccess;
    }
}
