package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Category;
import bean.CountView;
import library.LibraryConnectDb;

public class ModelCountView {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelCountView(){
		this.table = "countview";
		libConn = new LibraryConnectDb();
	}
	
	public CountView getCountView() {
		CountView couview = null;
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+" WHERE id_view = 1";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				couview = new CountView(rs.getInt("id_view"), rs.getInt("view"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return couview;
	}

	public void riseView(int view) {
		conn=libConn.getconnectMySQL();
		String sql="UPDATE "+table+" SET view = ? WHERE id_view = 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, view+1);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

	
	
}
