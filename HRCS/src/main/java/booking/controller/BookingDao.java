package booking.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import booking.Booking;
import booking.BookingDto;
import util.DBManager;

public class BookingDao {
	private BookingDao() {}
	
	private static BookingDao instance = new BookingDao();
	
	public static BookingDao getInstance() {
		return instance;
	}
	
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public void createBooking(BookingDto bookingDto) {
		this.conn = DBManager.getConnectionFromMySql();
		if(this.conn != null) {
			String sql = "INSERT INTO booking(book_code, vehicle_id, client_id, location_id, cost, reservation_date, return_date) VALUES (?,?,?,?,?,?,?)";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, bookingDto.getBook_code());
				this.pstmt.setString(2, bookingDto.getVehicle_id());
				this.pstmt.setString(3, bookingDto.getClient_id());
				this.pstmt.setString(4, bookingDto.getLocation_id());
				this.pstmt.setInt(5, bookingDto.getCost());
				this.pstmt.setTimestamp(6, bookingDto.getReservation_date());
				this.pstmt.setTimestamp(7, bookingDto.getReturn_date());
				this.pstmt.execute();
				System.out.println("booking 성공");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
	}
	
	public String getLastBookCode() {
		String book_code = "10000001";
		this.conn = DBManager.getConnectionFromMySql();
		if(this.conn != null) {
			String sql = "SELECT MAX(book_code) FROM booking";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();
				this.rs.next();
					String temp = this.rs.getString(1);
					if(temp != null) {
						book_code = Integer.parseInt(temp) +1 + "";
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return book_code;
	}
	
	public ArrayList<Booking> getAllBooking() {
		ArrayList<Booking> list = new ArrayList<>();
			this.conn = DBManager.getConnectionFromMySql();
			if(this.conn !=null) {
				String sql = "SELECT * FROM booking";
				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.rs = this.pstmt.executeQuery();
					while(this.rs.next()) {
						String book_code = this.rs.getString(1);
						String vehicle_id = this.rs.getString(2);
						String client_id = this.rs.getString(3);
						String location_id = this.rs.getString(4);
						int cost = this.rs.getInt(5);
						Timestamp reservation_date = this.rs.getTimestamp(6);
						Timestamp return_date = this.rs.getTimestamp(7);
						Timestamp reg_date = this.rs.getTimestamp(8);
						
						Booking booking = new Booking(book_code, vehicle_id, client_id, location_id, cost, reservation_date, return_date, reg_date);
						list.add(booking);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					DBManager.close(conn, pstmt, rs);
				}
			}
		
		return list;
	}
	
	
	public ArrayList<Booking> getBookingListById(String id) {
		ArrayList<Booking> list = new ArrayList<>();
			this.conn = DBManager.getConnectionFromMySql();
			if(this.conn !=null) {
				String sql = "SELECT * FROM booking WHERE client_id=?";
				try {
					this.pstmt = this.conn.prepareStatement(sql);
					this.pstmt.setString(1, id);
					this.rs = this.pstmt.executeQuery();
					while(this.rs.next()) {
						String book_code = this.rs.getString(1);
						String vehicle_id = this.rs.getString(2);
						String client_id = this.rs.getString(3);
						String location_id = this.rs.getString(4);
						int cost = this.rs.getInt(5);
						Timestamp reservation_date = this.rs.getTimestamp(6);
						Timestamp return_date = this.rs.getTimestamp(7);
						Timestamp reg_date = this.rs.getTimestamp(8);
						
						Booking booking = new Booking(book_code, vehicle_id, client_id, location_id, cost, reservation_date, return_date, reg_date);
						list.add(booking);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					DBManager.close(conn, pstmt, rs);
				}
			}
		
		return list;
	}
	
	
	public void deleteBooking(String book_code) {
		this.conn = DBManager.getConnectionFromMySql();
		if(this.conn != null) {
			String sql = "delete FROM booking WHERE book_code=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, book_code);
				this.pstmt.execute();
				System.out.println("예약취소 성공");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
			
		}
	}
	
	
	
}
