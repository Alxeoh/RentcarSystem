package vehicle;

public class VehicleDto {

	
	private String id;
	private String number;
	private String name;
	private String rentalable;
	private int hourRate;
	private String location;
	
	public VehicleDto(String id, String number, String name, String rentalable, int hourRate, String location) {
		this.id = id;
		this.number = number;
		this.name = name;
		this.hourRate = hourRate;
		this.rentalable = rentalable;
		this.location = location;
	}
	
	public VehicleDto(String id, String number, String name, int hourRate, String location) {
		this.id = id;
		this.number = number;
		this.name = name;
		this.hourRate = hourRate;
		this.location = location;
	}

	public String getId() {
		return this.id;
	}

	public String getNumber() {
		return this.number;
	}

	public String getName() {
		return this.name;
	}
	
	public String getRentalable() {
		return this.rentalable;
	}

	public int getHourRate() {
		return this.hourRate;
	}
	
	public String getLocation() {
		return this.location;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void setRentalable(String rentalable) {
		this.rentalable = rentalable;
	}

	public void setHourRate(int hourRate) {
		this.hourRate = hourRate;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
