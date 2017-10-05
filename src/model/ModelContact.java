package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import bean.Advs;
import bean.Category;
import bean.Contact;
import bean.Project;
import bean.Saying;
import library.LibraryConnectDb;

public class ModelContact {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelContact(){
		this.table = "contact";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Contact> getList() {
		ArrayList<Contact> alCon=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * FROM "+table+" ORDER BY id_contact DESC";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Contact objCon = new Contact(rs.getInt("id_contact"), rs.getString("name"), rs.getString("email"), rs.getString("phone"), rs.getString("message"));
				alCon.add(objCon);
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
		return alCon;
	}
	
	public int delCon(int idCon) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_contact = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idCon);
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
	public int sendCont(Contact contact) {
		int result = 0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name, phone, email , message) VALUES(?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, contact.getName());
			pst.setString(2, contact.getPhone());
			pst.setString(3, contact.getEmail());
			pst.setString(4, contact.getMessage());
			pst.executeUpdate();
			result = 1;
			//System.out.println("đến dây");
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
