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

<%Boolean addCar = (Boolean)request.getAttribute("addSuccess");
if(addCar != null && addCar){	
%>
<script>alert('차량등록 완료')</script>
<%} %>
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
							<a type="button" onclick="checkValues(document.getElementById('myForm'))">등록하기</a>
						</div>
						<div>
							<a type="button" href="/">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
					<h2>렌트카 등록</h2>
					<br>
					<article>
						<div>
							<form id="myForm" method="post" action="../service">
								<input type="hidden" name="command" value="add">
								<div>
									<input type="text" id="id" name="id" placeholder="등록번호를 입력하세요.">
								</div>
								<div>
									<input type="text" id="number" name="number"
										placeholder="차량번호를 입력하세요.">
								</div>
								<div>
									<input type="text" id="name" name="name"
										placeholder="차종을 입력하세요.">
								</div>
								<input type="hidden" id="hourRate" name="hourRate" value="0">
								<div>
									<input type="text" id="location" name="location"
										placeholder="배차지역을 입력하세요.">
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