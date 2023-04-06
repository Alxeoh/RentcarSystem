package vehicle;

public class VehicleDto {

	
	private String id;
	private String number;
	private String name;
	private int hourRate;
	
	public VehicleDto(String id, String number, String name, int hourRate) {
		this.id = id;
		this.number = number;
		this.name = name;
		this.hourRate = hourRate;
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

	public void setId(String id) {
		this.id = id;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setHourRate(int hourRate) {
		this.hourRate = hourRate;
	}
	
	
}
