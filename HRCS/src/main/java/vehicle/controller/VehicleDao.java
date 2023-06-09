package vehicle.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBManager;
import vehicle.Vehicle;
import vehicle.VehicleDto;

public class VehicleDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private VehicleDao() {
	}

	private static VehicleDao instance = new VehicleDao();

	public static VehicleDao getInstance() {
		return instance;
	}

	// c

	public boolean addVehicle(VehicleDto vehicleDto) {
		boolean check = false;
		Vehicle vehicle = new Vehicle(vehicleDto);
		this.conn = DBManager.getConnectionFromMySql();
		if (conn != null) {
			String sql = "INSERT INTO vehicle VALUES (?,?,?,?,?,?)";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setString(1, vehicle.getId());
				this.pstmt.setString(2, vehicle.getNumber());
				this.pstmt.setString(3, vehicle.getName());
				this.pstmt.setString(4, vehicle.getRentalable());
				this.pstmt.setInt(5, vehicle.getHourRate());
				this.pstmt.setString(6, vehicle.getLocation());
				this.pstmt.execute();
				System.out.println("차량등록 성공");
				check = true;
			} catch (SQLException e) {
				System.out.println("차량등록 실패");
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
		return check;
	}

	// r
	public ArrayList<Vehicle> getVehicleType(String type) {
		ArrayList<Vehicle> list = new ArrayList<>();

		this.conn = DBManager.getConnectionFromMySql();

		if (conn != null) {
			String sql = "SELECT * FROM vehicle WHERE vehicle_id LIKE ?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, type+"%");
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String id = this.rs.getString(1);
					String number = this.rs.getString(2);
					String name = this.rs.getString(3);
					String rentalable = this.rs.getString(4);
					int hourRate = this.rs.getInt(5);
					String location = this.rs.getString(6);
					Vehicle vehicle = new Vehicle(id, number, name, rentalable, hourRate, location);
					list.add(vehicle);
				}
				System.out.println("자동차 타입 리스트 출력 성공");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}

		return list;
	}
	
	
	public ArrayList<Vehicle> getVehicTypeleLocation(String type, String location) {
		ArrayList<Vehicle> list = new ArrayList<>();

		this.conn = DBManager.getConnectionFromMySql();

		if (conn != null) {
			String sql = "SELECT * FROM vehicle WHERE vehicle_id LIKE ? and location=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, type+"%");
				this.pstmt.setString(2, location);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String id = this.rs.getString(1);
					String number = this.rs.getString(2);
					String name = this.rs.getString(3);
					String rentalable = this.rs.getString(4);
					int hourRate = this.rs.getInt(5);
					String loc = this.rs.getString(6);
					Vehicle vehicle = new Vehicle(id, number, name, rentalable, hourRate, loc);
					list.add(vehicle);
				}
				System.out.println("자동차 타입 리스트 출력 성공");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}

		return list;
	}
	
	
	public ArrayList<Vehicle> getVehicleLocation(String location) {
		ArrayList<Vehicle> list = new ArrayList<>();

		this.conn = DBManager.getConnectionFromMySql();

		if (conn != null) {
			String sql = "SELECT * FROM vehicle WHERE location=?";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, location);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String id = this.rs.getString(1);
					String number = this.rs.getString(2);
					String name = this.rs.getString(3);
					String rentalable = this.rs.getString(4);
					int hourRate = this.rs.getInt(5);
					String loc = this.rs.getString(6);
					Vehicle vehicle = new Vehicle(id, number, name, rentalable, hourRate, loc);
					list.add(vehicle);
				}
				System.out.println("자동차 타입 리스트 출력 성공");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}

		return list;
	}
	

	public ArrayList<Vehicle> getAllVehicle() {
		ArrayList<Vehicle> list = new ArrayList<>();

		this.conn = DBManager.getConnectionFromMySql();

		if (conn != null) {
			String sql = "SELECT * FROM vehicle";
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.rs = this.pstmt.executeQuery();

				while (this.rs.next()) {
					String id = this.rs.getString(1);
					String number = this.rs.getString(2);
					String name = this.rs.getString(3);
					String rentalable = this.rs.getString(4);
					int hourRate = this.rs.getInt(5);
					String location = this.rs.getString(6);
					Vehicle vehicle = new Vehicle(id, number, name, rentalable, hourRate, location);
					list.add(vehicle);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}

		return list;
	}

	public Vehicle getVehicleById(String id) {
		Vehicle vehicle = null;

		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {

			String sql = "SELECT * FROM vehicle WHERE vehicle_id=?";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setString(1, id);
				this.rs = this.pstmt.executeQuery();

				this.rs.next();

				String vehicle_id = rs.getString(1);
				String number = rs.getString(2);
				String name = rs.getString(3);
				String rentalable = rs.getString(4);
				int hourRate = rs.getInt(5);
				String location = rs.getString(6);

				vehicle = new Vehicle(vehicle_id, number, name, rentalable, hourRate, location);

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}

		}

		return vehicle;
	}

	// u

	public boolean modifyVehicle(VehicleDto vehicleDto) {
		boolean check = false;

		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "UPDATE vehicle SET number =?, name =?, hour_rate=?, location=? Where vehicle_id =?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, vehicleDto.getNumber());
				this.pstmt.setString(2, vehicleDto.getName());
				this.pstmt.setInt(3, vehicleDto.getHourRate());
				this.pstmt.setString(4, vehicleDto.getLocation());

				this.pstmt.setString(5, vehicleDto.getId());

				this.pstmt.execute();
				System.out.println("차량정보 수정완료");
				check = true;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
		return check;
	}
	public boolean setRentalable(String vehicle_id) {
		boolean check = false;

		this.conn = DBManager.getConnectionFromMySql();
		if (this.conn != null) {
			String sql = "UPDATE vehicle SET rentalable='2' Where vehicle_id =?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, vehicle_id);

				this.pstmt.execute();
				System.out.println("렌탈중 변경완료");
				check = true;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
		return check;
	}

}
