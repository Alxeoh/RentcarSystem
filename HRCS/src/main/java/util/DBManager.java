package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {
	public static Connection getConnectionFromMySql() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
		String username = "root";
		String password = "nGnU^8YH";

		String driver = "com.mysql.cj.jdbc.Driver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("db연동 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db연동 실패");
		}
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	
}
