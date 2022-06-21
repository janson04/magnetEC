package Model;

public class Corder_detail {
    private Integer id; 		//AI
    private String corder_id;
    private Integer product_id;
    private String product_name;
    private Integer product_price;
    private Integer single_buynum;
    
    public Corder_detail(String corder_id, Integer product_id, String product_name, Integer product_price,
			Integer single_buynum) {
		super();
		this.corder_id = corder_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.single_buynum = single_buynum;
	}
    
	public Corder_detail(Integer id, String corder_id, Integer product_id, String product_name, Integer product_price,
			Integer single_buynum) {
		super();
		this.id = id;
		this.corder_id = corder_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.single_buynum = single_buynum;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCorder_id() {
		return corder_id;
	}
	public void setCorder_id(String corder_id) {
		this.corder_id = corder_id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public Integer getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}
	public Integer getSingle_buynum() {
		return single_buynum;
	}
	public void setSingle_buynum(Integer single_buynum) {
		this.single_buynum = single_buynum;
	}
}
