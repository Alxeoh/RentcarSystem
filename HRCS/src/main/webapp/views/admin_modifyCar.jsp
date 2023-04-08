<%@page import="vehicle.controller.VehicleDao"%>
<%@page import="vehicle.Vehicle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/admin_form.css">
<title>Insert title here</title>
</head>
<jsp:include page="/header"></jsp:include>
<body>
	<%
	VehicleDao vehicleDao = VehicleDao.getInstance();
	String id = (String) session.getAttribute("sessionId");
	if (!id.equals("admin")) {
		System.out.println("관리자계정만 이용가능");
		request.setAttribute("notAdmin", true);
		request.getRequestDispatcher("/").forward(request, response);
	}
	%>
	<%
	String vehicle_id = request.getParameter("vehicle_id");
	Vehicle vehicle = vehicleDao.getVehicleById(vehicle_id);
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
					</div>
					<div>
					<script>
							function submitForm() {
								document.getElementById("myForm").submit();
							}
						</script>
						<div>
							<a href="#" onclick="submitForm()">수정하기</a>
						</div>
						<div>
							<a type="button" href="/">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
					<h2>차량 정보수정</h2>
					<br>
					<article>
						<div>
							<form id="myForm" method="post" action="../service">
								<input type="hidden" name="command" value="car_modify">
								<div>
									<input type="text" id="id" name="id" value="<%=vehicle_id%>"
										readonly>
								</div>
								<div>
									<input type="text" id="number" name="number"
										placeholder="변경할 차량번호를 입력하세요.">
								</div>
								<div>
									<input type="text" id="name" name="name"
										placeholder="변경할 차종을 입력하세요.">
								</div>
								<div>
									<input type="text" id="location" name="location"
										placeholder="변경할 배차지역을 입력하세요.">
								</div>
							</form>
						</div>
					</article>
				</div>
			</article>
		</div>
	</section>
</body>
<script src="resources/validation3.js"></script>
<jsp:include page="/footer"></jsp:include>
</html>