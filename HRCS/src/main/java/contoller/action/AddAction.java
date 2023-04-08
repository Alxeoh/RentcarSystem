package contoller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import vehicle.VehicleDto;
import vehicle.controller.VehicleDao;

public class AddAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("add액션 활성화");

		String id = request.getParameter("id");
		String number = request.getParameter("number");
		String name = request.getParameter("name");
		String rentalable = "1";
		int hourRate = Integer.parseInt(request.getParameter("hourRate"));
		String location = request.getParameter("location");

		VehicleDto vehicleDto = new VehicleDto(id, number, name, rentalable, hourRate, location);
		VehicleDao vehicleDao = VehicleDao.getInstance();

		if (vehicleDto != null) {
			vehicleDao.addVehicle(vehicleDto);
			request.setAttribute("addSuccess", true);
			request.getRequestDispatcher("admin_addCar").forward(request, response);
		}

	}

}
