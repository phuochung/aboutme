package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Rank;
import library.LibraryConnectDb;

public class ModelRank {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelRank(){
		this.table = "rank";
		libConn = new LibraryConnectDb();
	}
	
	public ArrayList<Rank> getList() {
		ArrayList<Rank> alRank=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Rank item = new Rank(rs.getInt("id_rank"), rs.getString("name"));
				alRank.add(item);
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
		return alRank;
	}

}
