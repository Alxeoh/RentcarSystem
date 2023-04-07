package users.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import users.User;
import users.UserDto;
import util.DBManager;

public class UserDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserDao() {
	}

	public static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	UserDao userDao = UserDao.getInstance();

	// Create

	public boolean createUser(UserDto userDto) {
		boolean check = false;
		User user = new User(userDto);
		this.conn = DBManager.getConnectionFromMySql();

		if (this.conn != null) {
			String sql = "INSERT INTO client (client_id, client_pw, name)VALUES(?,?,?)";

			try {
				this.pstmt = this.conn.prepareStatement(sql);

				this.pstmt.setString(1, user.getId());
				this.pstmt.setString(2, user.getPassword());
				this.pstmt.setString(3, user.getName());

				this.pstmt.execute();
				System.out.println("회원가입 성공");
				check = true;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("회원가입 실패");
			} finally {
				DBManager.close(conn, pstmt);
			}
		}

		return check;
	}

	// 중복검사

	public boolean duplId(String id) {
		boolean check = true;
		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "SELECT * FROM client WHERE client_id = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					check = false;
				} else {
					check = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		}
		return check;
	}

	public User getUserById(String id) {
		User user = null;

		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "SELECT * FROM client WHERE client_id= ?";

			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs = this.pstmt.executeQuery();

				this.rs.next();
				String password = this.rs.getString(2);
				System.out.println("password : " + password);
				String name = this.rs.getString(3);
				System.out.println("name : " + name);
				Timestamp reservation_date = this.rs.getTimestamp(4);
				Timestamp return_date = this.rs.getTimestamp(5);
				Timestamp reg_date = this.rs.getTimestamp(6);

				user = new User(id, password, name, reservation_date, return_date, reg_date);
				System.out.println("User 찾기 성공");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("User 찾기 실패");
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}

		return user;
	}
	
	public ArrayList<User> getAllUser(){
		ArrayList<User> list = new ArrayList<>();
		User user = null;
		this.conn = DBManager.getConnectionFromMySql();
		
		if(this.conn != null) {
			String sql = "SELECT * FROM client";
			try {
				this.pstmt =conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				
				while(this.rs.next()) {
					String id = this.rs.getString(1);
					String pw = this.rs.getString(2);
					String name = this.rs.getString(3);
					Timestamp reservation_date = this.rs.getTimestamp(4);
					Timestamp return_date = this.rs.getTimestamp(5);
					Timestamp reg_date = this.rs.getTimestamp(6);
					user = new User(id, pw, name, reservation_date, return_date, reg_date);
					list.add(user);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			
		}
		
		
		return list;
	}
	
	//d
	
	public void deleteUserById(String id) {
		this.conn = DBManager.getConnectionFromMySql();
		
		if(this.conn != null) {
			String sql = "DELETE FROM client WHERE client_id=?";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.pstmt.execute();
				System.out.println("회원삭제완료");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
	}

}
