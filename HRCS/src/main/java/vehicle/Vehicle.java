package vehicle;

public class Vehicle {

	private String id;
	private String number;
	private String name;
	private String rentalable;
	private int hourRate;
	private String location;

	public Vehicle(String id, String number, String name, String rentalable, int hourRate, String location) {
		this.id = id;
		this.number = number;
		this.name = name;
		this.rentalable = rentalable;
		this.hourRate = hourRate;
		this.location = location;
	}

	public Vehicle(VehicleDto vehicleDto) {
		this.id = vehicleDto.getId();
		this.number = vehicleDto.getNumber();
		this.name = vehicleDto.getName();
		this.rentalable = vehicleDto.getRentalable();
		this.hourRate = vehicleDto.getHourRate();
		this.location = vehicleDto.getLocation();
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

	public String getLocation() {
		return this.location;
	}

}
