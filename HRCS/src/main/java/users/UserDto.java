package users;

import java.sql.Timestamp;

public class UserDto {
	private String id;
	private String password;
	private String name;
	private Timestamp reservation_date;
	private Timestamp return_date;
	private Timestamp reg_date;
	
	public UserDto(String id, String password, String name, Timestamp reservation_date, Timestamp return_date, Timestamp reg_date) {
		this.id = id;
		this.name = name;
		this.reservation_date = reservation_date;
		this.return_date = return_date;
		this.reg_date = reg_date;
	}
	
	public UserDto(String id, String password, String name, Timestamp reg_date) {
		this.id = id;
		this.name = name;
		this.reg_date = reg_date;
	}
	
	public UserDto(String id, String password, String name) {
		this.id = id;
		this.password = password;
		this.name = name;
	}
	
	public UserDto(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return this.id;
	}
	
	public String getPassword() {
		return this.password;
	}

	public String getName() {
		return this.name;
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

	public void setId(String id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setName(String name) {
		this.name = name;
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
