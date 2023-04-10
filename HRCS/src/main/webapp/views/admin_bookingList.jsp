<%@page import="java.text.DecimalFormat"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="booking.controller.BookingDao"%>
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
	DecimalFormat df = new DecimalFormat("#,###");
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
					<h2>렌트카 목록/수정</h2>
					<br>
					<table>
						<thead>
							<tr>
								<td>예약번호</td>
								<td>이용자 ID</td>
								<td>차종</td>
								<td>대여장소</td>
								<td>이용요금</td>
								<td>렌트일시</td>
								<td>반납일시</td>
								<td>예약일시</td>
							</tr>
						</thead>
						<%
						BookingDao bookingDao = BookingDao.getInstance();
						ArrayList<Booking> list = bookingDao.getAllBooking();
						if (list != null) {
							for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td><%=list.get(i).getBook_code()%></td>
									<td><%=list.get(i).getClient_id()%></td>
									<td><%=list.get(i).getVehicle_id()%></td>
									<td>
									<%if(list.get(i).getLocation_id().equals("seo1")){%>
									잠실<%}%><%else if(list.get(i).getLocation_id().equals("seo2")){%>
									명동<%}%><%else if(list.get(i).getLocation_id().equals("seo3")){%>
									강남<%}%><%else if(list.get(i).getLocation_id().equals("seo4")){%>
									서초<%}%><%else if(list.get(i).getLocation_id().equals("seo5")){%>
									강동<%}%>
									
									</td>
									
									<td><%String formatted = df.format(list.get(i).getCost()); %><%=formatted%>원</td>
									<td><%=list.get(i).getReservation_date()%></td>
									<td><%=list.get(i).getReturn_date()%></td>
									<td><%=list.get(i).getReg_date()%></td>
								</tr>
								<%
								}}
								%>
						</table>
				</div>
			</article>
		</div>
	</section>


</body>
<jsp:include page="/footer"></jsp:include>
</html>