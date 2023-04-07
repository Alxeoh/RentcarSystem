<%@page import="vehicle.Vehicle"%>
<%@page import="vehicle.controller.VehicleDao"%>
<%@page import="java.util.ArrayList"%>
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

	<section>
		<div>
			<article>
				<div>
					<a href="admin_carList">소형차</a>
				</div>
				<div>
					<a href="mCarList">중형차</a>
				</div>
				<div>
					<a href="vCarList">SUV</a>
				</div>
			</article>
			<article>
				<div>
					<h2>중형차 List</h2>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<td>등록번호</td>
								<td>차량번호</td>
								<td>차종</td>
								<td>예약가능여부</td>
							</tr>
						</thead>
						<%
						VehicleDao vehicleDao = VehicleDao.getInstance();
						ArrayList<Vehicle> list = vehicleDao.getVehicleType("M");
						for (int i = 0; i < list.size(); i++) {
						%>
						<tbody>
							<tr>
								<td><a
									href="carDetailS?vehicle_id=<%=list.get(i).getId()%>"><%=list.get(i).getId()%></a></td>
								<td><%=list.get(i).getNumber()%></td>
								<td><%=list.get(i).getName()%></td>
								<td>
									<%
									if (list.get(i).getRentalable().equals("1")) {
									%>예약가능<%
									} else {
									%>예약불가<%}%>
								</td>
							</tr>
						</tbody>
						<%
						}
						%>
					</table>
				</div>
			</article>
		</div>
	</section>

</body>
<jsp:include page="/footer"></jsp:include>
</html>