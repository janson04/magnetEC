package Model;

//訂單明細，還未是訂單時，是購物車的單筆項目
public class Corder_detail {
    private Integer id; 		//AI
    private String corder_Id;
    private String product_Id;
    private String product_Name;
    private Integer product_price;
    private Integer single_buynum;
    
    //只帶入Product的建構式
    public Corder_detail(Product p){
        this.product_Id = p.getProductId();
        this.product_Name = p.getProductName();
        this.product_price = p.getPrice();
    }
    
    //沒有id的建構式
    public Corder_detail(String corder_Id, String product_Id, String product_Name, Integer product_price,
			Integer single_buynum) {
		super();
		this.corder_Id = corder_Id;
		this.product_Id = product_Id;
		this.product_Name = product_Name;
		this.product_price = product_price;
		this.single_buynum = single_buynum;
	}
    
    //全部field的建構式
	public Corder_detail(Integer id, String corder_Id, String product_Id, String product_Name, Integer product_price,
			Integer single_buynum) {
		super();
		this.id = id;
		this.corder_Id = corder_Id;
		this.product_Id = product_Id;
		this.product_Name = product_Name;
		this.product_price = product_price;
		this.single_buynum = single_buynum;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCorder_Id() {
		return corder_Id;
	}

	public void setCorder_Id(String corder_Id) {
		this.corder_Id = corder_Id;
	}

	public String getProduct_Id() {
		return product_Id;
	}

	public void setProduct_Id(String product_Id) {
		this.product_Id = product_Id;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
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
