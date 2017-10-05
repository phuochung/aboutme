package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Category;
import bean.Project;
import bean.Work;
import library.LibraryConnectDb;

public class ModelWorks {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelWorks(){
		this.table = "work";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Work> getList() {
		ArrayList<Work> alWork=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+"  ORDER BY id_work DESC";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Work objW=new Work(rs.getInt("id_work"), rs.getString("name"), rs.getString("preview"), rs.getString("picture"), rs.getString("date"));
				alWork.add(objW);
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
		return alWork;

	}
	public ArrayList<Work> getListPublic() {
		ArrayList<Work> alWork=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+"  ORDER BY id_work DESC LIMIT 5";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Work objW=new Work(rs.getInt("id_work"), rs.getString("name"), rs.getString("preview"), rs.getString("picture"), rs.getString("date"));
				alWork.add(objW);
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
		return alWork;

	}
	
	
	
	public Work getItemByID(int idW) {
		Work item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_work = ? LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idW);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new Work(rs.getInt("id_work"), rs.getString("name"), rs.getString("preview"), rs.getString("picture"), rs.getString("date"));
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
	public int addWork(Work objW) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name,preview,date,picture) VALUES(?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, objW.getName());
			pst.setString(2, objW.getPreview());
			pst.setString(3,objW.getDate());
			pst.setString(4, objW.getPicture());
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
	
	public int editWork(Work objW) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET name = ? ,preview = ?,date = ? ,picture = ? WHERE id_work = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objW.getName());
			pst.setString(2, objW.getPreview());
			pst.setString(3, objW.getDate());
			pst.setString(4, objW.getPicture());
			pst.setInt(5, objW.getId_work());
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
	public int delWork(int idWork) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_work= ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idWork);
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
