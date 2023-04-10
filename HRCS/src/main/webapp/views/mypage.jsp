<%@page import="java.text.DecimalFormat"%>
<%@page import="booking.Booking"%>
<%@page import="booking.controller.BookingDao"%>
<%@page import="booking.BookingDto"%>
<%@page import="users.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="users.controller.UserDao"%>
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
	Boolean rentalSuccess = (Boolean) request.getAttribute("rentalSuccess");
	if (rentalSuccess != null && rentalSuccess) {
	%>
	<script>
		alert('렌탈완료')
	</script>
	<%}%>
	<%
	Boolean rentalFail = (Boolean) request.getAttribute("rentalFail");
	if (rentalFail != null && rentalFail) {
	%>
	<script>
		alert('렌탈불가')
	</script>
	<%}%>
	<%
	String log = (String) session.getAttribute("sessionId");
	%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>Mypage</h2>
					</div>

					<div>
						<a type="button" href="/">뒤로가기</a>
					</div>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<th colspan="4">회원정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>회원ID</td>
								<td>회원PW</td>
								<td>회원이름</td>
								<td>가입일자</td>
							</tr>
							<%
							UserDao userDao = UserDao.getInstance();
							User user = userDao.getUserById(log);
							%>
							<tr>
								<td><%=user.getId()%></td>
								<td><%=user.getPassword()%></td>
								<td><%=user.getName()%></td>
								<td><%=user.getReg_date()%></td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<table>
						<thead>
							<tr>
								<th colspan="7">이용내역</th>
							</tr>
							<tr>
								<td>예약번호</td>
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
							ArrayList<Booking> list = bookingDao.getBookingListById(log);
							if (list != null) {
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><%=list.get(i).getBook_code()%></td>
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