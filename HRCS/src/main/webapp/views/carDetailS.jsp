<%@page import="vehicle.Vehicle"%>
<%@page import="vehicle.controller.VehicleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin_form.css?after">
<title>Insert title here</title>
</head>
<jsp:include page="/header"></jsp:include>
<body>
	<%
	String vehicle_id = request.getParameter("vehicle_id");
	VehicleDao vehicleDao = VehicleDao.getInstance();
	Vehicle vehicle = vehicleDao.getVehicleById(vehicle_id);
	%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>
							<a href="shortTerm">ShortTerm Reservation</a>
						</h2>
					</div>

					<div>
						<div>
							<a type="button" href="shortTerm">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<td colspan="4" rowspan="4" style="text-align: center;"><img
									style="max-height: 500px;"
									src="/resources/carImg/<%=vehicle.getName()%>.jpeg"></td>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>등록번호</td>
								<td>차량번호</td>
								<td>차종</td>
								<td>예약가능여부</td>
							</tr>
							<tr>
								<td><%=vehicle.getId()%></td>
								<td><%=vehicle.getNumber()%></td>
								<td><%=vehicle.getName()%></td>
								<td>
									<%
									if (vehicle.getRentalable().equals("1")) {
									%>가능<%} else {%>불가능<%}%>
								</td>
							</tr>
							<tr>
								<td>예약시작 시간</td>
								<td colspan="3"><select id="reservationTime">
										<%
										for (int i = 0; i < 24; i++) {
										%>
										<option value="<%=i%>"><%=i%>시
										</option>
										<%
										}
										%>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>