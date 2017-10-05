package bean;

public class Work {
	private int id_work;
	private String name;
	private String preview;
	private String picture;
	private String date;
	public int getId_work() {
		return id_work;
	}
	public void setId_work(int id_work) {
		this.id_work = id_work;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
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
	public Work(int id_work, String name, String preview, String picture, String date) {
		super();
		this.id_work = id_work;
		this.name = name;
		this.preview = preview;
		this.picture = picture;
		this.date = date;
	}
	

}
