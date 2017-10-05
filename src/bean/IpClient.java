package bean;

public class IpClient {
	private int id_acticle;
	private String ipadress;
	public int getId_acticle() {
		return id_acticle;
	}
	public void setId_acticle(int id_acticle) {
		this.id_acticle = id_acticle;
	}
	public String getIpadress() {
		return ipadress;
	}
	public void setIpadress(String ipadress) {
		this.ipadress = ipadress;
	}
	public IpClient(int id_acticle, String ipadress) {
		super();
		this.id_acticle = id_acticle;
		this.ipadress = ipadress;
	}
	
	

}
