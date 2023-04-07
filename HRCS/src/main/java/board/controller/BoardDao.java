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

	private BoardDao() {
	}

	private static BoardDao instance = new BoardDao();

	public static BoardDao getInstance() {
		return instance;
	}

	public int getCount() {
		int count = 0;
		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "SELECT COUNT(no) FROM board";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.rs = pstmt.executeQuery();

				this.rs.next();
				count = rs.getInt(1);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}
		return count;
	}

	// c

	public boolean CreateBoard(String type, String id, String title, String content) {
		boolean check = false;
		int no = getCount()+1;
		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "INSERT INTO board(no, type, client_id, title, contents) VALUES(?, ?, ?, ?, ?);";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setInt(1, no);
				this.pstmt.setString(2, type);
				this.pstmt.setString(3, id);
				this.pstmt.setString(4, title);
				this.pstmt.setString(5, content);
				
				this.pstmt.execute();
				check = true;
				System.out.println("게시글 작성완료");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
		return check;
	}

	// r

	public ArrayList<Board> getAllBoard() {
		ArrayList<Board> list = new ArrayList<>();

		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "SELECT * FROM board";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
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

	public Board getBoardByNo(int no) {
		Board board = null;
		this.conn = DBManager.getConnectionFromMySql();
		if (conn != null) {
			String sql = "SELECT * FROM board WHERE no=?";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setInt(1, no);
				this.rs = this.pstmt.executeQuery();

				this.rs.next();
				String type = this.rs.getString(2);
				String id = this.rs.getString(3);
				String title = this.rs.getString(4);
				String contents = this.rs.getString(5);
				Timestamp m_date = this.rs.getTimestamp(6);
				Timestamp w_date = this.rs.getTimestamp(7);

				board = new Board(no, type, id, title, contents, m_date, w_date);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}
		return board;

	}

	// u

	// d

	public boolean deleteContentsByNo(int no) {
		boolean check = false;
		this.conn = DBManager.getConnectionFromMySql();
		if (conn != null) {
			String sql = "DELETE FROM board WHERE no=?";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setInt(1, no);
				this.pstmt.execute();
				System.out.println("삭제성공");
				check = true;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}

		}
		return check;
	}

	public void sortNo() {
		ArrayList<Board> list = getAllBoard();

		this.conn = DBManager.getConnectionFromMySql();

		if (conn != null) {
			String Sql = "UPDATE board SET no=? where no=?";
			try {
				int cnt = 1;
				for (int i = 0; i < list.size(); i++) {
					this.pstmt = conn.prepareStatement(Sql);
					this.pstmt.setInt(1, cnt++);
					this.pstmt.setInt(2, list.get(i).getNo());
					this.pstmt.execute();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
	}

}
