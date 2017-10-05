package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Category;
import bean.Project;
import library.LibraryConnectDb;

public class ModelProject {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelProject(){
		this.table = "myproject";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Project> getList() {
		ArrayList<Project> alPro=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+"  ORDER BY id_myproject DESC";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Project objPro=new Project(rs.getInt("id_myproject"), rs.getString("name"), rs.getString("preview"), rs.getString("link"), rs.getString("picture"));
				alPro.add(objPro);
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
		return alPro;

	}
	public ArrayList<Project> getListLimit3() {
		ArrayList<Project> alPro=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+"  ORDER BY id_myproject DESC LIMIT 3";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Project objPro=new Project(rs.getInt("id_myproject"), rs.getString("name"), rs.getString("preview"), rs.getString("link"), rs.getString("picture"));
				alPro.add(objPro);
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
		return alPro;

	}
	public int countProject() {
		int a = 0;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				a++;
			}
			System.out.println(rs);
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
		
		return a;
	}
	
	
	public Project getItemByID(int idP) {
		Project item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_myproject = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idP);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new Project(rs.getInt("id_myproject"), rs.getString("name"), rs.getString("preview"), rs.getString("link"), rs.getString("picture"));
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
	public int editPro(Project objPro) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET name = ? ,preview = ?,link = ? ,picture = ? WHERE id_myproject = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objPro.getName());
			pst.setString(2, objPro.getPreview());
			pst.setString(3, objPro.getLink());
			pst.setString(4, objPro.getPicture());
			pst.setInt(5, objPro.getId_myproject());
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
	public int delPro(int idPro) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_myproject = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idPro);
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
	public int addPro(Project objPro) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name,preview,link,picture) VALUES(?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, objPro.getName());
			pst.setString(2, objPro.getPreview());
			pst.setString(3,objPro.getLink());
			pst.setString(4, objPro.getPicture());
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
