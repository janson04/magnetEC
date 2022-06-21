package Model;

public class Users {
    private String id;
    private String users_name;
    private String users_password;
    private String name;
    private String photo;
    private String email;
    private String postcode;
    private String address;
    
    public Users(){
    };

    public Users(String id, String users_name, String users_password, String name, String photo, String email,
			String postcode, String address) {
		super();
		this.id = id;
		this.users_name = users_name;
		this.users_password = users_password;
		this.name = name;
		this.photo = photo;
		this.email = email;
		this.postcode = postcode;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsers_name() {
		return users_name;
	}

	public void setUsers_name(String users_name) {
		this.users_name = users_name;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
    
}