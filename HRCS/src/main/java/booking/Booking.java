package booking;

import java.sql.Timestamp;

public class Booking {
	private String book_code;
	private String vehicle_id;
	private String client_id;
	private String location_id;
	private int cost;
	private Timestamp reservation_date;
	private Timestamp return_date;
	private Timestamp reg_date;
	
	
	public Booking(String book_code, String vehicle_id, String client_id, String location_id, int cost,
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
	
	
	public Booking(BookingDto bookingDto) {
		this.book_code = bookingDto.getBook_code();
		this.vehicle_id = bookingDto.getVehicle_id();
		this.client_id = bookingDto.getClient_id();
		this.location_id = bookingDto.getLocation_id();
		this.cost = bookingDto.getCost();
		this.reservation_date = bookingDto.getReservation_date();
		this.return_date = bookingDto.getReturn_date();
		this.reg_date = bookingDto.getReg_date();
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
	
	
	
}
