package model;

public class Product {
    private String productId;      	// 商品編號
    private String productName; 	// 商品名稱
    private String category;    	// 商品分類
    private int price;          	// 單價
    private int stock;				// 庫存量-20220620新增
    private String imgurl;			// 商品照片-20220620新增
    private String introduction;	// 商品介紹-20220620新增
    private String introHtml;		// HTML詳細介紹-20220620新增
    
    
    public Product() {
    }
    
    public Product(String productId, String productName, String category, int price, int stock, String imgurl,
			String introduction, String introHtml) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.category = category;
		this.price = price;
		this.stock = stock;
		this.imgurl = imgurl;
		this.introduction = introduction;
		this.introHtml = introHtml;
	}
    
    public void setAll(String productId, String productName, String category, int price, int stock, String imgurl,
			String introduction, String introHtml) {
		this.productId = productId;
		this.productName = productName;
		this.category = category;
		this.price = price;
		this.stock = stock;
		this.imgurl = imgurl;
		this.introduction = introduction;
		this.introHtml = introHtml;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getIntroHtml() {
		return introHtml;
	}

	public void setIntroHtml(String introHtml) {
		this.introHtml = introHtml;
	}
	
	public String toString() {
        return "Product [productId=" + productId + 
        		", productName=" + productName + 
        		", category=" + category + 
        		", price=" + price +
        		", stock=" + stock +
        		", imgurl=" + imgurl +
        		", introHtml=" + introHtml +
                "]";
    }
}
