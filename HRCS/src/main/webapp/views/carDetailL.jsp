<%@page import="vehicle.Vehicle"%>
<%@page import="vehicle.controller.VehicleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin_form.css?after">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									maxDate : 90,
									minDate : 0,
									onClose : function(selectedDate) {
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}
								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yy-mm-dd",
									maxDate : 90,
									onClose : function(selectedDate) {
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}
								});
			});
</script>
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
						<h2>LongTerm Reservation</h2>

					</div>
					<div>
						<%
						String log = (String) session.getAttribute("sessionId");
						if (log != null && !log.equals("로그인 상태가 아닙니다.")) {
						%>
						<div>
							<a type="button"
								onclick="checkValues(document.getElementById('myForm'))">예약하기</a>
						</div>
						<%}%>
						<div>
							<a type="button" href="longTerm">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
					<form id="myForm" method="post" action="../service">
						<input type="hidden" name="command" value="reservation"> <input
							type="hidden" name="type" value="L"> <input type="hidden"
							id="vehicle_id" name="vehicle_id" value="<%=vehicle_id%>">
						<input type="hidden" id="location_id" name="location_id"
							value="<%=vehicle.getLocation()%>">
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
									<td>예약일 설정</td>
									<td><input type="text" id="startDate" name="startDate"></td>
									<td>반납일 설정</td>
									<td><input type="text" id="endDate" name="endDate"></td>
								</tr>
								<tr>
									<td>예약시간 설정</td>
									<td><select id="startTime" name="startTime" required>
											<%
											for (int i = 0; i < 24; i++) {
												if (i == 0) {
											%>
											<option value="" disabled>예약시간 선택</option>
											<%
											}
											%>
											<option value="<%=i%>:00"><%=i%>시
											</option>
											<%
											}
											%>
									</select></td>
									<td>반납시간 설정</td>
									<td><select id="endTime" name="endTime" required>
											<%
											for (int i = 0; i < 24; i++) {
												if (i == 0) {
											%>
											<option value="" disabled>예약시간 선택</option>
											<%
											}
											%>
											<option value="<%=i%>:00"><%=i%>시
											</option>
											<%
											}
											%>
									</select></td>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
			</article>
		</div>
	</section>
</body>
<script src="resources/validation5.js"></script>
<jsp:include page="/footer"></jsp:include>
</html>