package dao;

import static dao.MySQLDao.conn;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Shoppingcart;

public class ShoppingcartDaoImpl implements ShoppingcartDao {
	public static void main(String[] args) {
		// --- boolean add(String usersId, String product_Id, int singleBuynum) :開始 ---
		boolean addState = new ShoppingcartDaoImpl().add("zoo2", "ND-DS000001" , 10);
		System.out.println("新增成功? " + addState);
		// --- boolean add(String usersId, String product_Id, int singleBuynum) :結束 ---

		// --- Shoppingcart queryUIDPIDList(String usersId, String product_Id) :開始 ---
//		Shoppingcart sc = new ShoppingcartDaoImpl().queryUIDPID("zoo2", "ND-DS000001");
//		System.out.println("queryUIDPIDList: " + sc);
//		
//		Shoppingcart sc2 = new ShoppingcartDaoImpl().queryUIDPID("zoo2", "ND-DS000005");
//		System.out.println(sc2);
		// --- Shoppingcart queryUIDPIDList(String usersId, String product_Id) :結束 ---

		// --- List<Shoppingcart> queryUIDList(String usersId) :開始 ---
//		List<Shoppingcart> lsc = new ShoppingcartDaoImpl().queryUIDList("zoo2");
//		for (Shoppingcart sc:lsc) {
//			System.out.println(sc);
//		}
		// --- List<Shoppingcart> queryUIDList(String usersId) :結束 ---

		// --- boolean update(String usersId, String product_Id, int singleBuynum) :開始 ---
//		boolean updateState = new ShoppingcartDaoImpl().update("zoo2", "ND-DS000001", 25);
//		System.out.println("更新成功? " + updateState);
		// --- boolean update(String usersId, String product_Id, int singleBuynum) :結束 ---
		
		// --- boolean delete(String usersId) :開始 ---
//		boolean deleteState = new ShoppingcartDaoImpl().delete("zoo2");
//		System.out.println("刪除成功? " + deleteState);
		// --- boolean delete(String usersId) :結束 ---
	}

	@Override
	public boolean add(String usersId, String product_Id, int singleBuynum) {
		boolean addSuccess = false;
		
		Shoppingcart sc = queryUIDPID(usersId, product_Id);
		
		MySQLDao.start();
		if (MySQLDao.DB_ConnectionStatus) {
			if (sc == null) {
				String sqltext = "INSERT INTO shoppingcart( users_id, product_Id, single_buynum, create_date) VALUES(?,?,?,?)";
				try {
					PreparedStatement ps = conn.prepareStatement(sqltext);
					ps.setString(1, usersId);
					ps.setString(2, product_Id);
					ps.setInt(3, singleBuynum);
					LocalDateTime now = LocalDateTime.now();
					ps.setString(4, now.toString());

					if (ps.executeUpdate() > 0) {
						addSuccess = true;
					} else {
						addSuccess = false;
					}
				} catch (SQLException ex) {
					Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
				}
			} else {
				//如果有此product_Id則改為指定數量
				addSuccess = update(usersId, product_Id, singleBuynum);
			}

		}
		MySQLDao.stop();
		return addSuccess;
	}

	@Override
	public List<Shoppingcart> queryUIDList(String usersId) {
		MySQLDao.start();
		List<Shoppingcart> l = new ArrayList<>();
		if (MySQLDao.DB_ConnectionStatus) {
			String sqltext = "SELECT * FROM shoppingcart WHERE users_id='" + usersId + "';";
			ResultSet rs = MySQLDao.executeQuery(sqltext);

			try {
				while (rs.next()) {
					Shoppingcart sc = new Shoppingcart();
					sc.setCartId(rs.getInt("cart_id"));
					sc.setUsersId(rs.getString("users_id"));
					sc.setProduct_Id(rs.getString("product_Id"));
					sc.setSingleBuynum(rs.getInt("single_buynum"));
					sc.setCreateDate(rs.getString("create_date"));

					l.add(sc);
				}
			} catch (SQLException ex) {
				Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		MySQLDao.stop();

		return l;
	}

	@Override
	public Shoppingcart queryUIDPID(String usersId, String product_Id) {
		MySQLDao.start();
		Shoppingcart sc = null;
		if (MySQLDao.DB_ConnectionStatus) {
			String sqltext = "SELECT * FROM shoppingcart WHERE users_id='" + usersId + "' AND product_Id='" + product_Id
					+ "';";
			ResultSet rs = MySQLDao.executeQuery(sqltext);

			try {
				if (rs.next()) {
					sc = new Shoppingcart();
					sc.setCartId(rs.getInt("cart_id"));
					sc.setUsersId(rs.getString("users_id"));
					sc.setProduct_Id(rs.getString("product_Id"));
					sc.setSingleBuynum(rs.getInt("single_buynum"));
					sc.setCreateDate(rs.getString("create_date"));
				}
			} catch (SQLException ex) {
				Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		MySQLDao.stop();

		return sc;
	}

	@Override
	public boolean update(String usersId, String product_Id, int singleBuynum) {
		boolean updateSuccess = false;
		Shoppingcart sc = queryUIDPID(usersId, product_Id);
		if (sc != null) {
			MySQLDao.start();
			if (MySQLDao.DB_ConnectionStatus) {
				String sqltext = "UPDATE shoppingcart SET single_buynum = ? , create_date = ? WHERE cart_id = ?";
				try {
					PreparedStatement ps = conn.prepareStatement(sqltext);
					ps.setInt(1, singleBuynum);

					LocalDateTime now = LocalDateTime.now();
					ps.setString(2, now.toString());

					ps.setInt(3, sc.getCartId());

					if (ps.executeUpdate() > 0) {
						updateSuccess = true;
					} else {
						updateSuccess = false;
					}
				} catch (SQLException ex) {
					Logger.getLogger(Corder_detailDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
			MySQLDao.stop();
		}
		
		return updateSuccess;
	}

	@Override
	public boolean deleteUIDPID(String usersId, String product_Id) {
		boolean deleteSuccess = false;
		
        MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext = "DELETE FROM shoppingcart WHERE users_id= '"+ usersId +"' AND product_Id= '" + product_Id + "';";
            if ( MySQLDao.executeUpdate(sqltext) > 0) {
            	deleteSuccess = true;
            } else {
            	deleteSuccess = false;
            }
        }
        MySQLDao.stop();
		
		return deleteSuccess;
	}
	
	@Override
	public boolean deleteUIDAll(String usersId) {
		boolean deleteSuccess = false;
		
        MySQLDao.start();
        if (MySQLDao.DB_ConnectionStatus) {
            String sqltext = "DELETE FROM shoppingcart WHERE users_id= '"+ usersId +"';";
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
