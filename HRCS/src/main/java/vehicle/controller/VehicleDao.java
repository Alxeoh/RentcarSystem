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
		if(conn != null) {
			String sql = "INSERT INTO vehicle VALUES (?, ?, ?,?)";
			try {
				this.pstmt = conn.prepareStatement(sql);
				this.pstmt.setString(1, vehicle.getId());
				this.pstmt.setString(2, vehicle.getNumber());
				this.pstmt.setString(3, vehicle.getName());
				this.pstmt.setInt(4, vehicle.getHourRate());
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
					int hourRate = this.rs.getInt(4);
					Vehicle vehicle = new Vehicle(id, number, name, hourRate);
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
	
	
	// u
	
	public boolean modifyVehicle(VehicleDto vehicleDto) {
		boolean check = false;
	
		this.conn = DBManager.getConnectionFromMySql();
		if(this.conn != null ) {
			String sql = "UPDATE vehicle SET number =?, name =?, hour_rate=? Where vehicle_id =?";
			
			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, vehicleDto.getNumber());
				this.pstmt.setString(2, vehicleDto.getName());
				this.pstmt.setInt(3, vehicleDto.getHourRate());
				this.pstmt.setString(4, vehicleDto.getId());
				
				this.pstmt.execute();
				System.out.println("차량정보 수정완료");
				check = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
}
