package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LibraryConnectDb {
	private Connection conn;
	public LibraryConnectDb() {

	}
	public Connection getconnectMySQL() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectl2?useUnicode=true&characterEncoding=UTF-8", "root", "");
			//conn = DriverManager.getConnection("jdbc:mysql://node177244-aboutme.jelastic.servint.net/projectl2?useUnicode=true&characterEncoding=UTF-8", "root", "ZQFtek87678");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}

	public static void main(String[] args) {
		LibraryConnectDb lcdb = new LibraryConnectDb();
		//System.out.println(lcdb.getconnectMySQL());
	}

}
