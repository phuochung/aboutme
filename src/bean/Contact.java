package bean;

public class Contact {
	private int id_contact;
	private String name;
	private String email;
	private String phone;
	private String message;
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Contact(int id_contact, String name, String email, String phone, String message) {
		super();
		this.id_contact = id_contact;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.message = message;
	}
	

}
