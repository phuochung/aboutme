package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Category;
import bean.Project;
import bean.Slide;
import library.LibraryConnectDb;

public class ModelSlide {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelSlide(){
		this.table = "slidehome";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Slide> getList() {
		ArrayList<Slide> alSlide=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+"  ORDER BY id_slidehome DESC";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Slide objSli=new Slide(rs.getInt("id_slidehome"), rs.getString("name"), rs.getString("preview"), rs.getString("picture"), rs.getString("link"));
				alSlide.add(objSli);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pst.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return alSlide;

	}
	
	
	public Slide getItemByID(int idSli) {
		Slide item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_slidehome = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idSli);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new Slide(rs.getInt("id_slidehome"), rs.getString("name"), rs.getString("preview"), rs.getString("picture"), rs.getString("link"));
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
	
	
	public int addSli(Slide objSli) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name,preview,link,picture) VALUES(?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, objSli.getName());
			pst.setString(2, objSli.getPreview());
			pst.setString(3,objSli.getLink());
			pst.setString(4, objSli.getPicture());
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
	public int editSli(Slide objSli) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET name = ? ,preview = ?,link = ? ,picture = ? WHERE id_slidehome = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objSli.getName());
			pst.setString(2, objSli.getPreview());
			pst.setString(3, objSli.getLink());
			pst.setString(4, objSli.getPicture());
			pst.setInt(5, objSli.getId_slidehome());
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
	public int delSli(int idSli) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_slidehome = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idSli);
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
