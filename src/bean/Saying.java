package bean;

public class Saying {
	private int id_saying;
	private String content;
	private String author;
	private String picture;
	public int getId_saying() {
		return id_saying;
	}
	public void setId_saying(int id_saying) {
		this.id_saying = id_saying;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Saying(int id_saying, String content, String author, String picture) {
		super();
		this.id_saying = id_saying;
		this.content = content;
		this.author = author;
		this.picture = picture;
	}
	

}
