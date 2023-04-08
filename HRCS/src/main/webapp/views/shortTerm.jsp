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
<%
	Boolean alreadyRent = (Boolean) request.getAttribute("alreadyRent");
	if (alreadyRent != null && alreadyRent) {
	%>
	<script>
		alert('이미 대여중인 차량을 예약하실 수 없습니다.')
	</script>
	<%}%>
	<%
	Boolean lack = (Boolean) request.getAttribute("lack");
	if (lack != null && lack) {
	%>
	<script>
		alert('최소대여시간은 1시간으로 1시간 미만 대여는 불가능합니다.')
	</script>
	<%}%>
	<%
VehicleDao vehicleDao = VehicleDao.getInstance();
String type = request.getParameter("type"); // 파라미터 값 가져오기
String location = request.getParameter("location");
%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>Type:&nbsp</h2>
						<div>
							<a type="button" href="shortTerm?type=S">소형차</a>
						</div>
						<div>
							<a type="button" href="shortTerm?type=M">중형차</a>
						</div>
						<div>
							<a type="button" href="shortTerm?type=V">SUV</a>
						</div>
					</div>
					<div>
						<h2>Location:&nbsp</h2>
						<div>
							<%
							if (type != null) {
							%>
							<a type="button" href="shortTerm?type=<%=type%>&location=seo1">잠실</a>
							<%
							} else {
							%>
							<a type="button" href="shortTerm?location=seo1">잠실</a>
							<%
							}
							%>
						</div>
						<div>
							<%
							if (type != null) {
							%>
							<a type="button" href="shortTerm?type=<%=type%>&location=seo2">명동</a>
							<%
							} else {
							%>
							<a type="button" href="shortTerm?location=seo2">명동</a>
							<%
							}
							%>
						</div>
						<div>
							<%
							if (type != null) {
							%>
							<a type="button" href="shortTerm?type=<%=type%>&location=seo3">강남</a>
							<%
							} else {
							%>
							<a type="button" href="shortTerm?location=seo3">강남</a>
							<%
							}
							%>
						</div>
						<div>
							<%
							if (type != null) {
							%>
							<a type="button" href="shortTerm?type=<%=type%>&location=seo4">서초</a>
							<%
							} else {
							%>
							<a type="button" href="shortTerm?location=seo4">서초</a>
							<%
							}
							%>
						</div>
						<div>
							<%
							if (type != null) {
							%>
							<a type="button" href="shortTerm?type=<%=type%>&location=seo5">강동</a>
							<%
							} else {
							%>
							<a type="button" href="shortTerm?location=seo5">강동</a>
							<%
							}
							%>
						</div>
						<div>
							<a type="button" href="/">뒤로가기</a>
						</div>
					</div>
					<div>
						<h2>List:&nbsp</h2>
						<div>
							<a type="button" href="longTerm">전체보기</a>
						</div>
					</div>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<td>등록번호</td>
								<td>차량번호</td>
								<td>차종</td>
								<td>배차지역</td>
								<td>예약가능여부</td>
							</tr>
						</thead>
						<%
						ArrayList<Vehicle> list = vehicleDao.getAllVehicle();
						if (type != null && location == null) {
							list = vehicleDao.getVehicleType(type);
						} else if (type == null && location != null) {
							list = vehicleDao.getVehicleLocation(location);
						} else if (type != null && location != null) {
							list = vehicleDao.getVehicTypeleLocation(type, location);
						}

						for (int i = 0; i < list.size(); i++) {
						%>

						<tbody>
							<tr>
								<td><a type="button"
									href="carDetailS?vehicle_id=<%=list.get(i).getId()%>"><%=list.get(i).getId()%></a></td>
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