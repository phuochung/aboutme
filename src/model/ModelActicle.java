package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Acticle;
import library.LibraryConnectDb;

public class ModelActicle {
	private LibraryConnectDb libConn;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	private String table;
	public ModelActicle(){
		this.table = "acticle";
		libConn = new LibraryConnectDb();
	}
	public ArrayList<Acticle> getList() {
		ArrayList<Acticle> alATC=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat ";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Acticle objATC=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("id_cat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"), rs.getString("preview"), rs.getString("detail"), rs.getString("user"), rs.getInt("luotxem"));
				alATC.add(objATC);
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
		return alATC;
	}
	public ArrayList<Acticle> getListAll() {
		ArrayList<Acticle> alATC=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat WHERE a.is_active = 1 ORDER BY a.id_acticle DESC LIMIT 6";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Acticle objATC=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"));
				alATC.add(objATC);
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
		return alATC;

	}
	public ArrayList<Acticle> getListByIdCat(int idCat) {
		ArrayList<Acticle> alATC=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat WHERE a.is_active = 1 && a.id_cat = "+idCat+" ORDER BY a.id_acticle DESC LIMIT 6";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Acticle objATC=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"));
				alATC.add(objATC);
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
		return alATC;

	}
	public int addATC(Acticle item) {
		int result=0;
		conn=libConn.getconnectMySQL();
		String sql="INSERT INTO "+table+" (name,id_cat,is_active,picture,date,detail,user,preview,luotxem) VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, item.getNameATC());
			pst.setInt(2, item.getId_cat());
			pst.setInt(3,item.getIs_active());
			pst.setString(4, item.getPicture());
			pst.setString(5, item.getDate());
			pst.setString(6, item.getDetail());
			pst.setString(7, item.getUser());
			pst.setString(8, item.getPreview());
			pst.setInt(9, item.getLuotxem());
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
	public int countByIDCat(int id_cat) {
		conn = libConn.getconnectMySQL();
		String sql="SELECT COUNT(*) AS sotin FROM "+table+" WHERE id_cat ="+id_cat;
		int result=0;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				result=rs.getInt("sotin");
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
	public int countActicle() {
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
	public Acticle getItemByID(int idATC) {
		Acticle item = null;
		conn = libConn.getconnectMySQL();
		String sql = "SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat WHERE id_acticle ="+idATC;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				 item=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("id_cat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"), rs.getString("preview"), rs.getString("detail"), rs.getString("user"), rs.getInt("luotxem"));
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
	public int editATC(Acticle obj) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET name = ? ,preview = ?, picture = ?,detail = ?,id_cat = ? WHERE id_acticle = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1,obj.getNameATC());
			pst.setString(2, obj.getPreview());
			pst.setString(3, obj.getPicture());
			pst.setString(4, obj.getDetail());
			pst.setInt(5, obj.getId_cat());
			pst.setInt(6, obj.getId_acticle());
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
	public int delCat(int idATC) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="DELETE FROM "+table+" WHERE id_acticle = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, idATC);
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
	public ArrayList<Acticle> getListTMN(int idATC) {
		ArrayList<Acticle> alATC=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat WHERE a.is_active = 1 && a.id_acticle != "+idATC+" ORDER BY a.id_acticle DESC LIMIT 5";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Acticle objATC=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("id_cat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"), rs.getString("preview"), rs.getString("detail"), rs.getString("user"), rs.getInt("luotxem"));
				alATC.add(objATC);
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
		return alATC;
	}
	public ArrayList<Acticle> getListByIdCatNoLimit(int idCat) {
		ArrayList<Acticle> alATC=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat WHERE a.is_active = 1 && a.id_cat = "+idCat+" ORDER BY a.id_acticle DESC ";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Acticle objATC=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("id_cat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"), rs.getString("preview"), rs.getString("detail"), rs.getString("user"), rs.getInt("luotxem"));
				alATC.add(objATC);
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
		return alATC;
	}
	public int getCountNewByIdCat(int idCat) {
		conn=libConn.getconnectMySQL();
		String sql="SELECT COUNT(*) AS soTin FROM "+table+" WHERE id_cat = "+idCat;
		int result=0;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				result=rs.getInt("soTin");
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
	public ArrayList<Acticle> getListByIdCatOffRowC(int offset, int row_count, int idCat) {
		ArrayList<Acticle> alATC=new ArrayList<>();
		conn=libConn.getconnectMySQL();
		String sql="SELECT * ,c.name AS nameCat , a.name AS nameATC FROM "+table+" AS a INNER JOIN category AS c ON a.id_cat = c.id_cat WHERE a.is_active = 1 && a.id_cat = "+idCat+" ORDER BY a.id_acticle DESC LIMIT "+offset+","+row_count;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				Acticle objATC=new Acticle(rs.getInt("id_acticle"), rs.getString("nameATC"), rs.getString("nameCat"), rs.getInt("id_cat"), rs.getInt("is_active"), rs.getString("picture"), rs.getString("date"), rs.getString("preview"), rs.getString("detail"), rs.getString("user"), rs.getInt("luotxem"));
				alATC.add(objATC);
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
		return alATC;
	}
	public int editAtcAjax(Acticle objA) {
		conn=libConn.getconnectMySQL();
		int result=0;
		String sql="UPDATE "+table+" SET is_active = ?  WHERE id_acticle = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, objA.getIs_active());
			pst.setInt(2, objA.getId_acticle());
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
	public int getcountATCByUser(String fullname) {
		conn=libConn.getconnectMySQL();
		String sql="SELECT COUNT(*) AS sotin FROM "+table+" WHERE user LIKE '%"+fullname+"%'";
		int result=0;
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				result=rs.getInt("sotin");
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
	public void riseView(Acticle item, int idATC) {
		conn=libConn.getconnectMySQL();
		String sql="UPDATE "+table+" SET luotxem = ?  WHERE id_acticle = ? LIMIT 1";
		try {
			pst=conn.prepareStatement(sql);
			pst.setInt(1, item.getLuotxem()+1);
			pst.setInt(2, idATC);
			pst.executeUpdate();
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
		
	}
	public void delATCByFullname(String fullname) {
		conn=libConn.getconnectMySQL();
		String sql="DELETE FROM "+table+" WHERE user LIKE '%"+fullname+"%' ";
		try {
			pst=conn.prepareStatement(sql);
			pst.executeUpdate();
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
		
	}
	
}
