package bean;

public class Advs {
	private int id_advs;
	private String name;
	private String link;
	private String picture;
	public int getId_advs() {
		return id_advs;
	}
	public void setId_advs(int id_advs) {
		this.id_advs = id_advs;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Advs(int id_advs, String name, String link, String picture) {
		super();
		this.id_advs = id_advs;
		this.name = name;
		this.link = link;
		this.picture = picture;
	}
	

}
