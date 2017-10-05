package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Advs;
import bean.Category;
import bean.Project;
import bean.Saying;
import library.LibraryConnectDb;

public class ModelAdvs {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelAdvs(){
		this.table = "advs";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Advs> getList() {
		ArrayList<Advs> alAdvs=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+" ORDER BY id_advs DESC";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Advs objAdvs = new Advs(rs.getInt("id_advs"), rs.getString("name"), rs.getString("link"), rs.getString("picture"));
				alAdvs.add(objAdvs);
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
		return alAdvs;
	}
	public ArrayList<Advs> getListlimit() {
		ArrayList<Advs> alAdvs=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+" ORDER BY id_advs DESC LIMIT 4";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Advs objAdvs = new Advs(rs.getInt("id_advs"), rs.getString("name"), rs.getString("link"), rs.getString("picture"));
				alAdvs.add(objAdvs);
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
		return alAdvs;
	}
	public Advs getItemByID(int idAdvs) {
		Advs item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_advs = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idAdvs);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new Advs(rs.getInt("id_advs"), rs.getString("name"), rs.getString("link"), rs.getString("picture"));
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
	
	
	public int editAdvs(Advs objAdvs) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET name = ? ,link = ?, picture = ? WHERE id_advs = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objAdvs.getName());
			pst.setString(2, objAdvs.getLink());
			pst.setString(3, objAdvs.getPicture());
			pst.setInt(4, objAdvs.getId_advs());
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
	public int delAdvs(int idAdvs) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_advs = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idAdvs);
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
	public int addSay(Advs objAdvs) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name,link,picture) VALUES(?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, objAdvs.getName());
			pst.setString(2, objAdvs.getLink());
			pst.setString(3, objAdvs.getPicture());
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
