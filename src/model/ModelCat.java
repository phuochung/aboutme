package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Category;
import library.LibraryConnectDb;

public class ModelCat {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelCat(){
		this.table = "category";
		libConn = new LibraryConnectDb();
	}
	
	public ArrayList<Category> getListCat() {
		ArrayList<Category> alCat=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Category objCat=new Category(rs.getInt("id_cat"), rs.getString("name"));
				alCat.add(objCat);
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
		return alCat;
	}

	public int delCat(int idCat) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_cat = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idCat);
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

	public int addCat(Category cat) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name) VALUES(?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, cat.getName());			
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

	public Category getNameCat(int idCat) {
		Category objCat = null;
		conn= libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_cat = "+idCat;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				objCat = new Category(rs.getInt("id_cat"), rs.getString("name"));
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
		return objCat;
	}

	public int editCat(Category objC) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="UPDATE "+table+" SET name = ? WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objC.getName());
			pst.setInt(2, objC.getId_cat());
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

	
	
}
