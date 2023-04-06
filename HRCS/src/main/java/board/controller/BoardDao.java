package board.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import board.Board;
import util.DBManager;

public class BoardDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private BoardDao() {}
	
	private static BoardDao instance =  new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	// c
	
	// r
	
	public ArrayList<Board> getAllBoard(){
		ArrayList<Board> list = new ArrayList<>();
		
		this.conn = DBManager.getConnectionFromMySql();
		if(this.conn != null) {
			String sql = "SELECT * FROM board";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				
				while(this.rs.next()) {
					int no = rs.getInt(1);
					String type = rs.getString(2);
					String id = rs.getString(3);
					String title = rs.getString(4);
					String contents = rs.getString(5);
					Timestamp m_date = rs.getTimestamp(6);
					Timestamp w_date = rs.getTimestamp(7);
					
					Board board = new Board(no, type, id, title, contents, m_date, w_date);
					list.add(board);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		}
		
		return list;
	}
	
	
	
	// u
	
	// d
	
	
	
	
}
