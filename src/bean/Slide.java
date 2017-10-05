package bean;

public class Slide {
	private int id_slidehome;
	private String name;
	private String preview;
	private String picture;
	private String link;
	public int getId_slidehome() {
		return id_slidehome;
	}
	public void setId_slidehome(int id_slidehome) {
		this.id_slidehome = id_slidehome;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Slide(int id_slidehome, String name, String preview, String picture, String link) {
		super();
		this.id_slidehome = id_slidehome;
		this.name = name;
		this.preview = preview;
		this.picture = picture;
		this.link = link;
	}
	

}
