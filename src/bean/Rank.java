package bean;

public class Rank {
	private int id_rank;
	private String name;
	public int getId_rank() {
		return id_rank;
	}
	public void setId_rank(int id_rank) {
		this.id_rank = id_rank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Rank(int id_rank, String name) {
		super();
		this.id_rank = id_rank;
		this.name = name;
	}
	

}
