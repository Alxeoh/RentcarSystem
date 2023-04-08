package booking;

import java.sql.Timestamp;

public class BookingDto {

		
	private String book_code;
	private String vehicle_id;
	private String client_id;
	private String location_id;
	private int cost;
	private Timestamp reservation_date;
	private Timestamp return_date;
	private Timestamp reg_date;
	
	
	public BookingDto(String book_code, String vehicle_id, String client_id, String location_id, int cost,
			Timestamp reservation_date, Timestamp return_date, Timestamp reg_date) {
		this.book_code = book_code;
		this.vehicle_id = vehicle_id;
		this.client_id = client_id;
		this.location_id = location_id;
		this.cost = cost;
		this.reservation_date = reservation_date;
		this.return_date = return_date;
		this.reg_date = reg_date;
	}
	
	
	public BookingDto(String book_code, String vehicle_id, String client_id, String location_id, int cost,
			Timestamp reservation_date, Timestamp return_date) {
		this.book_code = book_code;
		this.vehicle_id = vehicle_id;
		this.client_id = client_id;
		this.location_id = location_id;
		this.cost = cost;
		this.reservation_date = reservation_date;
		this.return_date = return_date;
	}
	
	
	
	public String getBook_code() {
		return this.book_code;
	}
	public String getVehicle_id() {
		return this.vehicle_id;
	}
	public String getClient_id() {
		return this.client_id;
	}
	public String getLocation_id() {
		return this.location_id;
	}
	public int getCost() {
		return this.cost;
	}
	public Timestamp getReservation_date() {
		return this.reservation_date;
	}
	public Timestamp getReturn_date() {
		return this.return_date;
	}
	public Timestamp getReg_date() {
		return this.reg_date;
	}


	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}


	public void setVehicle_id(String vehicle_id) {
		this.vehicle_id = vehicle_id;
	}


	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}


	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}


	public void setReservation_date(Timestamp reservation_date) {
		this.reservation_date = reservation_date;
	}


	public void setReturn_date(Timestamp return_date) {
		this.return_date = return_date;
	}


	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
	
}
