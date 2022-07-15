package model;

public class Users {
    private String users_id;
    private String users_password;
    private String name;
    private String phone;
    private String email;
    private String city;
    private String postcode;
    private String address;
    private String registerTime;
    
    public Users(){
    };

	public Users(String users_id, String users_password, String name, String phone, String email,
			String city, String postcode, String address, String registerTime) {
		super();
		this.users_id = users_id;
		this.users_password = users_password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.postcode = postcode;
		this.address = address;
		this.registerTime = registerTime;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getUsers_password() {
		return users_password;
	}

	public void setUsers_password(String users_password) {
		this.users_password = users_password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	
	public String toString() {
		return users_id
				+"\t"+name
				+"\t"+phone
				+"\t"+email
				+"\t"+city
				+"\t"+postcode
				+"\t"+address
				+"\t"+registerTime;
	}
}