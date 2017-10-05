package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Infor;
import bean.Project;
import library.LibraryConnectDb;

public class ModelInfor {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelInfor(){
		this.table = "inforcontact";
		libConn = new LibraryConnectDb();
	}
	
	
	public Infor getItemByID(int idP) {
		Infor item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * FROM "+table+" WHERE id_infor = 1 LIMIT 1";
		try {
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				item = new Infor(rs.getInt("id_infor"), rs.getString("address"), rs.getInt("phone"), rs.getString("email"), rs.getString("skype"), rs.getString("wordpress"), rs.getString("facebook"), rs.getString("linkface"), 
						rs.getString("twitter"), rs.getString("linktwt"), rs.getString("googleplus"), rs.getString("linkggp"));
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
	
	public int editInf(Infor objInf) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET address = ? ,phone = ?,email = ? ,skype = ?,wordpress = ?,facebook = ? ,linkface = ?,twitter = ?,linktwt = ?,googleplus = ? ,linkggp = ? WHERE id_infor = 1 LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,objInf.getAddress());
			pst.setInt(2, objInf.getPhone());
			pst.setString(3, objInf.getEmail());
			pst.setString(4, objInf.getSkype());
			pst.setString(5,objInf.getWordpress());
			pst.setString(6, objInf.getFacebook());
			pst.setString(7, objInf.getLinkface());
			pst.setString(8,objInf.getTwitter());
			pst.setString(9, objInf.getLinktwt());
			pst.setString(10, objInf.getGoogleplus());
			pst.setString(11, objInf.getLinkggp());
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
