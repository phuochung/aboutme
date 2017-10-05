package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Slide;
import bean.User;
import library.LibStringMd5;
import library.LibraryConnectDb;

public class ModelUser {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelUser(){
		this.table = "user";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<User> getList() {
		ArrayList<User> alUser=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				User objU = new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("rank"));
				alUser.add(objU);
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
		return alUser;

	}
	
	
	public User getItemByID(int idUser) {
		User item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_user = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idUser);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("rank"));
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
	public int addUser(User objU) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (username,password,fullname,rank) VALUES(?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, objU.getUsername());
			pst.setString(2, objU.getPassword());
			pst.setString(3,objU.getFullname());
			pst.setString(4, objU.getRank());
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
	public User getUserByUserPass(String username, String password) {
		User User=null;
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+" WHERE username = ? && password = ?";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, LibStringMd5.LibStringMd5( password));
			rs=pst.executeQuery();
			if(rs.next()){
				User=new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("rank"));
			}
		} catch (SQLException e) {
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
		return User;
	}
	public int editUser(User objU) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET password = ? ,fullname = ?,rank = ?  WHERE username = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objU.getPassword());
			pst.setString(2, objU.getFullname());
			pst.setString(3, objU.getRank());
			pst.setString(4, objU.getUsername());
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
	public int delUser(int idU) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_user = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idU);
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
	public int getcountSoUserByRank(String rank) {
		conn=libConn.getconnectMySQL();
		String sql="SELECT COUNT(*) AS souser FROM "+table+" WHERE rank LIKE '%"+rank+"%'";
		int result=0;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				result=rs.getInt("souser");
			}
		} catch (SQLException e) {
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
		return result;
	}
	
}
