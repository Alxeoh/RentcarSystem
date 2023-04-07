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
	String id = (String) session.getAttribute("sessionId");
	if (!id.equals("admin")) {
		System.out.println("관리자계정만 이용가능");
		request.setAttribute("notAdmin", true);
		request.getRequestDispatcher("/").forward(request, response);
	}
	%>
	<%
	String vehicle_id = request.getParameter("vehicle_id");
	%>
	<section>
		<div>
			<article>
				<div>
					<a href="admin_carList">렌트카 목록/수정</a>
				</div>
				<div>
					<a href="admin_addCar">렌트카 등록</a>
				</div>
				<div>
					<a href="admin_userM">회원 관리</a>
				</div>
			</article>
			<article>
				<div>
					<h2>차량정보 수정</h2>
				</div>
				<div>
					<form method="post" action="../service">
						<input type="hidden" name="command" value="modify">
						<div>
							<input type="text" id="id" name="id" value="<%=vehicle_id%>"
								readonly>
						</div>
						<div>
							<input type="text" id="number" name="number"
								placeholder="차량번호를 입력하세요.">
						</div>
						<div>
							<input type="text" id="name" name="name" placeholder="차종을 입력하세요.">
						</div>
						<div>
							<input type="number" id="hourRate" name="hourRate" value="0"
								readonly>
						</div>
						<div>
							<input type="text" id="location" name="location"
								placeholder="배차지역을 입력하세요.">
						</div>
						<div>
							<button type="button" onclick="checkValues(form)">수정</button>
						</div>
						<div>
							<button type="button" onclick="location.href='admin_carList'">뒤로가기</button>
						</div>
					</form>
				</div>
			</article>
		</div>
	</section>
</body>
<script src="resources/validation3.js"></script>
<jsp:include page="/footer"></jsp:include>
</html>