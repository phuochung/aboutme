package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Category;
import bean.Project;
import bean.Saying;
import library.LibraryConnectDb;

public class ModelSaying {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelSaying(){
		this.table = "saying";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Saying> getList() {
		ArrayList<Saying> alSay=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+" ORDER BY id_saying DESC";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Saying objSay = new Saying(rs.getInt("id_saying"),rs.getString("content"), rs.getString("author"), rs.getString("picture"));
				alSay.add(objSay);
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
		return alSay;
	}
	public Saying getItemByID(int idSay) {
		Saying item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_saying = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idSay);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new Saying(rs.getInt("id_saying"), rs.getString("content"), rs.getString("author"), rs.getString("picture"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return item;
	}
	public int editSay(Saying objSay) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET content = ? ,author = ?, picture = ? WHERE id_saying = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objSay.getContent());
			pst.setString(2, objSay.getAuthor());
			pst.setString(3, objSay.getPicture());
			pst.setInt(4, objSay.getId_saying());
			pst.executeUpdate();
			result=1;
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
		return result;
	}
	public int delSay(int idSay) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_saying = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idSay);
			pst.executeUpdate();
			result=1;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int addSay(Saying objSay) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (content,author,picture) VALUES(?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, objSay.getContent());
			pst.setString(2, objSay.getAuthor());
			pst.setString(3, objSay.getPicture());
			pst.executeUpdate();
			result=1;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	
}
