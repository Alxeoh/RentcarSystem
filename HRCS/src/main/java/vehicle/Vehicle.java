package vehicle;

public class Vehicle {
	
	private String id;
	private String number;
	private String name;
	private String rentalable;
	private int hourRate;
	
	public Vehicle(String id, String number, String name, String rentalable, int hourRate) {
		this.id = id;
		this.number = number;
		this.name = name;
		this.rentalable = rentalable;
		this.hourRate = hourRate;
	}

	public Vehicle(VehicleDto vehicleDto) {
		this.id = vehicleDto.getId();
		this.number = vehicleDto.getNumber();
		this.name = vehicleDto.getName();
		this.rentalable = vehicleDto.getRentalable();
		this.hourRate = vehicleDto.getHourRate();
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

	public int getHourRate() {
		return this.hourRate;
	}
	
	public String getRentalable() {
		return this.rentalable;
	}
	
	

}
