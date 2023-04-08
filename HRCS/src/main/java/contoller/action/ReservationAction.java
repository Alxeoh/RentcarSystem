
package contoller.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import booking.BookingDto;
import booking.controller.BookingDao;
import controller.Action;
import vehicle.Vehicle;
import vehicle.controller.VehicleDao;

public class ReservationAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("reservation액션 활성화");
		String rs_date = request.getParameter("startDate");
		String re_date = request.getParameter("endDate");
		String rs_time = request.getParameter("startTime");
		String re_time = request.getParameter("endTime");
		if(rs_time==null) {
			rs_time = "00:00";
		}
		if(re_time==null) {
			re_time = "00:00";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm");
		int hours = 0;
		Timestamp reservation = null;
		Timestamp re_turn = null;
		try {
			// 예약일과 예약시간을 timestamp로 변환합니다.
			Timestamp startTimestamp = new Timestamp(sdf.parse(rs_date + " " + rs_time + ":00").getTime());

			// 반납일과 반납시간을 timestamp로 변환합니다.
			Timestamp endTimestamp = new Timestamp(sdf.parse(re_date + " " + re_time + ":00").getTime());
			long diffInMillis = endTimestamp.getTime() - startTimestamp.getTime();

			reservation = startTimestamp;
			re_turn = endTimestamp;

			// millisecond를 시간으로 변환합니다.
			hours = (int) (diffInMillis / (60 * 60 * 1000));
		} catch (Exception e) {
			e.printStackTrace();
		}

		BookingDao bookingDao = BookingDao.getInstance();
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String book_code = bookingDao.getLastBookCode();
		String vehicle_id = request.getParameter("vehicle_id");
		String[] temp = vehicle_id.split("");
		int cost = 0;
		if (temp[0].equals("S")) {
			cost = 5000 * hours;
		} else if (temp[0].equals("M")) {
			cost = 7000 * hours;
		} else if (temp[0].equals("V")) {
			cost = 11000 * hours;
		}

		String client_id = (String) session.getAttribute("sessionId");
		String location_id = request.getParameter("location_id");

		System.out.println("book_code: " + book_code);
		System.out.println("vehicle_id: " + vehicle_id);
		System.out.println("client_id: " + client_id);
		System.out.println("location_id: " + location_id);
		System.out.println("cost: " + cost);
		System.out.println("reservation: " + reservation);
		System.out.println("re_turn: " + re_turn);
		VehicleDao vehicleDao = VehicleDao.getInstance();
		Vehicle vehicle = vehicleDao.getVehicleById(vehicle_id);
		BookingDto bookingDto = new BookingDto(book_code, vehicle_id, client_id, location_id, cost, reservation,
				re_turn);
		System.out.println(vehicle.getRentalable());
		
		
		if(vehicle.getRentalable().equals("2")) {
			request.setAttribute("alreadyRent", true);
			request.getRequestDispatcher("shortTerm").forward(request, response);
		} else if(cost == 0) {
			request.setAttribute("lack", true);
			request.getRequestDispatcher("shortTerm").forward(request, response);
		}else {
			bookingDao.createBooking(bookingDto);
			vehicleDao.setRentalable(vehicle_id); 
			request.setAttribute("rentalSuccess", true);
			request.getRequestDispatcher("mypage").forward(request, response);
		}
	}

}
