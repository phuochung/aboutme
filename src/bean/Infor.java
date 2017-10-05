package bean;

public class Infor {
	private int id_infor;
	private String address;
	private int phone;
	private String email;
	private String skype;
	private String wordpress;
	private String facebook;
	private String linkface;
	private String twitter;
	private String linktwt;
	private String googleplus;
	private String linkggp;
	
	public int getId_infor() {
		return id_infor;
	}
	public void setId_infor(int id_infor) {
		this.id_infor = id_infor;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSkype() {
		return skype;
	}
	public void setSkype(String skype) {
		this.skype = skype;
	}
	public String getWordpress() {
		return wordpress;
	}
	public void setWordpress(String wordpress) {
		this.wordpress = wordpress;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getLinkface() {
		return linkface;
	}
	public void setLinkface(String linkface) {
		this.linkface = linkface;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getLinktwt() {
		return linktwt;
	}
	public void setLinktwt(String linktwt) {
		this.linktwt = linktwt;
	}
	public String getGoogleplus() {
		return googleplus;
	}
	public void setGoogleplus(String googleplus) {
		this.googleplus = googleplus;
	}
	public String getLinkggp() {
		return linkggp;
	}
	public void setLinkggp(String linkggp) {
		this.linkggp = linkggp;
	}
	public Infor(int id_infor, String address, int phone, String email, String skype, String wordpress,
			String facebook, String linkface, String twitter, String linktwt, String googleplus, String linkggp) {
		super();
		this.id_infor = id_infor;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.skype = skype;
		this.wordpress = wordpress;
		this.facebook = facebook;
		this.linkface = linkface;
		this.twitter = twitter;
		this.linktwt = linktwt;
		this.googleplus = googleplus;
		this.linkggp = linkggp;
	}
	

}
