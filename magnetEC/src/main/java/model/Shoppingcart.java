package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the shoppingcart database table.
 * 
 */
@Entity
@NamedQuery(name="Shoppingcart.findAll", query="SELECT s FROM Shoppingcart s")
public class Shoppingcart implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="cart_id")
	private int cartId;

	@Lob
	@Column(name="create_date")
	private String createDate;

	private String product_Id;

	@Column(name="single_buynum")
	private int singleBuynum;

	@Column(name="users_id")
	private String usersId;

	public Shoppingcart() {
	}

	public int getCartId() {
		return this.cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getProduct_Id() {
		return this.product_Id;
	}

	public void setProduct_Id(String product_Id) {
		this.product_Id = product_Id;
	}

	public int getSingleBuynum() {
		return this.singleBuynum;
	}

	public void setSingleBuynum(int singleBuynum) {
		this.singleBuynum = singleBuynum;
	}

	public String getUsersId() {
		return this.usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	
	public String toString() {
		return "cartId: " + cartId
				+"\tusersId: " + usersId
				+"\tproduct_Id: " + product_Id
				+"\tsingleBuynum: " + singleBuynum
				+"\tcreateDate: " + createDate ;
	}
}