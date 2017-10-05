package bean;

public class Acticle {
	private int id_acticle;
	private String nameATC;
	private String nameCat;
	private int id_cat;
	private int is_active;
	private String picture;
	private String date;
	private String preview;
	private String detail;
	private String user;
	private int luotxem;
	
	public int getLuotxem() {
		return luotxem;
	}
	public void setLuotxem(int luotxem) {
		this.luotxem = luotxem;
	}
	public int getId_acticle() {
		return id_acticle;
	}
	public void setId_acticle(int id_acticle) {
		this.id_acticle = id_acticle;
	}
	
	public String getNameATC() {
		return nameATC;
	}
	public void setNameATC(String nameATC) {
		this.nameATC = nameATC;
	}
	public String getNameCat() {
		return nameCat;
	}
	public void setNameCat(String nameCat) {
		this.nameCat = nameCat;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Acticle() {
		super();
	}
	public Acticle(int id_acticle, String nameATC, String nameCat, int is_active, String picture, String date) {
		super();
		this.id_acticle = id_acticle;
		this.nameATC = nameATC;
		this.nameCat = nameCat;
		this.is_active = is_active;
		this.picture = picture;
		this.date = date;
	}
	public Acticle(int id_acticle, String nameATC, int id_cat, int is_active, String picture, String date,
			String preview, String detail, String user, int luotxem) {
		super();
		this.id_acticle = id_acticle;
		this.nameATC = nameATC;
		this.id_cat = id_cat;
		this.is_active = is_active;
		this.picture = picture;
		this.date = date;
		this.preview = preview;
		this.detail = detail;
		this.user = user;
		this.luotxem = luotxem;
	}
	public Acticle(int id_acticle, String nameATC, String nameCat, int id_cat, int is_active, String picture,
			String date, String preview, String detail, String user, int luotxem) {
		super();
		this.id_acticle = id_acticle;
		this.nameATC = nameATC;
		this.nameCat = nameCat;
		this.id_cat = id_cat;
		this.is_active = is_active;
		this.picture = picture;
		this.date = date;
		this.preview = preview;
		this.detail = detail;
		this.user = user;
		this.luotxem = luotxem;
	}
	
	
	
	
}
