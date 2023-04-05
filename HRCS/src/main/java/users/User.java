package users;

import java.sql.Timestamp;

public class User {
	private String id;
	private String password;
	private String name;
	private Timestamp reservation_date;
	private Timestamp return_date;
	private Timestamp reg_date;
	
	public User(String id, String password, String name, Timestamp reservation_date, Timestamp return_date, Timestamp reg_date) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.reservation_date = reservation_date;
		this.return_date = return_date;
		this.reg_date = reg_date;
	}
	
	public User(String id, String password, String name, Timestamp reg_date) {
		this.id = id;
		this.name = name;
		this.reg_date = reg_date;
	}
	
	public User(String id, String password, String name) {
		this.id = id;
		this.password = password;
		this.name = name;
	}

	public User(UserDto userDto) {
		this.id = userDto.getId();
		this.password = userDto.getPassword();
		this.name = userDto.getName();
		this.reservation_date = userDto.getReservation_date();
		this.return_date = userDto.getReturn_date();
		this.reg_date = userDto.getReg_date();
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
	
	
	

}
