package model;

public class Corder {
    private String corder_id;
    private String cname;
    private String phone;
    private String email;
    private String city;
    private String postcode;
    private String address;
    private String notes;
    private String shippingmethod;
    private String paymethod;
    private String receipt;
    private String taxname;
    private String taxnumber;
    private Integer member;
    private Integer sum;
    
	public Corder(String corder_id, String cname, String phone, String email, String city, String postcode,
			String address, String notes, String shippingmethod, String paymethod, String receipt, String taxname,
			String taxnumber, Integer member, Integer sum) {
		super();
		this.corder_id = corder_id;
		this.cname = cname;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.postcode = postcode;
		this.address = address;
		this.notes = notes;
		this.shippingmethod = shippingmethod;
		this.paymethod = paymethod;
		this.receipt = receipt;
		this.taxname = taxname;
		this.taxnumber = taxnumber;
		this.member = member;
		this.sum = sum;
	}
	public String getCorder_id() {
		return corder_id;
	}
	public void setCorder_id(String corder_id) {
		this.corder_id = corder_id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getShippingmethod() {
		return shippingmethod;
	}
	public void setShippingmethod(String shippingmethod) {
		this.shippingmethod = shippingmethod;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getTaxname() {
		return taxname;
	}
	public void setTaxname(String taxname) {
		this.taxname = taxname;
	}
	public String getTaxnumber() {
		return taxnumber;
	}
	public void setTaxnumber(String taxnumber) {
		this.taxnumber = taxnumber;
	}
	public Integer getMember() {
		return member;
	}
	public void setMember(Integer member) {
		this.member = member;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
    
}
