package bean;

public class CountView {
	private int id_view;
	private int view;
	public int getId_view() {
		return id_view;
	}
	public void setId_view(int id_view) {
		this.id_view = id_view;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public CountView(int id_view, int view) {
		super();
		this.id_view = id_view;
		this.view = view;
	}
	

}
