<%@page import="vehicle.Vehicle"%>
<%@page import="java.util.ArrayList"%>
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
	String id = (String) session.getAttribute("sessionId");
	if (!id.equals("admin")) {
		System.out.println("관리자계정만 이용가능");
		request.setAttribute("notAdmin", true);
		request.getRequestDispatcher("/").forward(request, response);
	}
	%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>Menu:&nbsp</h2>
						<div>
							<a href="admin_carList">렌트카 목록/수정</a>
						</div>
						<div>
							<a href="admin_addCar">렌트카 등록</a>
						</div>
						<div>
							<a href="admin_userM">회원 관리</a>
						</div>
						<div>
							<a href="admin_bookingList">예약정보</a>
						</div>
					</div>
					<div>
						<div>
							<a type="button" href="/">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
				<h2>렌트카 목록/수정</h2><br>
					<table>
						<thead>
							<tr>
								<td>등록번호</td>
								<td>차량번호</td>
								<td>차종</td>
								<td>배차지역</td>
								<td>총 주행시간</td>
							</tr>
						</thead>
						<%
						VehicleDao vehicleDao = VehicleDao.getInstance();
						ArrayList<Vehicle> list = vehicleDao.getAllVehicle();
						for (int i = 0; i < list.size(); i++) {
						%>
						<tbody>
							<tr>
								<td><a
									href="admin_modifyCar?vehicle_id=<%=list.get(i).getId()%>"><%=list.get(i).getId()%></a></td>
								<td><%=list.get(i).getNumber()%></td>
								<td><%=list.get(i).getName()%></td>
								<td>
									<%
									if (list.get(i).getLocation().equals("seo1")) {
									%>잠실<%
									} else if (list.get(i).getLocation().equals("seo2")) {
									%>명동<%
									} else if (list.get(i).getLocation().equals("seo3")) {
									%>강남<%
									} else if (list.get(i).getLocation().equals("seo4")) {
									%>서초<%
									} else if (list.get(i).getLocation().equals("seo5")) {
									%>강동<%}%>
								</td>
								<td><%=list.get(i).getHourRate()%></td>
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