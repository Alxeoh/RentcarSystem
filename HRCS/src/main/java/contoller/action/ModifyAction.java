package contoller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import vehicle.VehicleDto;
import vehicle.controller.VehicleDao;

public class ModifyAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("modifyd액션 활성화");
		
		String id = request.getParameter("id");
		String number = request.getParameter("number");
		String name = request.getParameter("name");
		int hourRate = Integer.parseInt(request.getParameter("hourRate"));
		
		VehicleDto vehicleDto = new VehicleDto(id, number, name, hourRate);
		VehicleDao vehicleDao = VehicleDao.getInstance();
		
		if(vehicleDto != null ) {
			vehicleDao.modifyVehicle(vehicleDto);
			response.sendRedirect("admin_carList");
		}
		
	}

}
