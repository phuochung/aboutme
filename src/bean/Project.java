package bean;

public class Project {
	private int id_myproject;
	private String name;
	private String preview;
	private String link;
	private String picture;
	public int getId_myproject() {
		return id_myproject;
	}
	public void setId_myproject(int id_myproject) {
		this.id_myproject = id_myproject;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Project(int id_myproject, String name, String preview, String link, String picture) {
		super();
		this.id_myproject = id_myproject;
		this.name = name;
		this.preview = preview;
		this.link = link;
		this.picture = picture;
	}
	

}
