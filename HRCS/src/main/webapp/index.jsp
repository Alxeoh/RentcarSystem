<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/grid.css?after">
<title>RentCar Service</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<%
	Boolean needLogout = (Boolean) request.getAttribute("needLogout");
	if (needLogout != null && needLogout) {
	%>
	<script>
		alert("로그아웃 후 사용가능합니다.");
	</script>
	<%
	}
	%>
	<%
	DBManager.getConnectionFromMySql();
	Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess");
	if (loginSuccess != null && loginSuccess) {
	%>
	<script>
		alert('로그인 성공')
	</script>
	<%
	} else {
	%>
	<%
	Boolean alreadyLogin = (Boolean) request.getAttribute("alreadyLogin");
	if (alreadyLogin != null && alreadyLogin) {
	%>
	<script>
		alert("이미 로그인 상태입니다.");
	</script>
	<%
	}
	%>
	<%
	Boolean adminCheck = (Boolean) request.getAttribute("notAdmin");
	if (adminCheck != null && adminCheck) {
	%>
	<script>
		alert("관리자계정만 이용가능.");
	</script>
	<%
	}
	}
	%>
	<%
	String id = null;
	String log = (String) session.getAttribute("sessionId");
	%>

	<section>
			<img src="resources/메인페이지.png">
	</section>


</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>