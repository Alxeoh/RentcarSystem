<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/grid.css">
<title>Insert title here</title>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<header>
	<h1><a href="/">RentCar Service Ver 1.0</a></h1>
	</header>
	<nav>
	<div>
	<a href="shortTerm">단기렌트</a>
	<a href="longTerm">장기렌트</a>
	<a href="board">커뮤니티</a>
	
	<%
	String id = (String)session.getAttribute("sessionId");
	if(id==null){
		id = "로그인 상태가 아닙니다.";
	}
	if(!id.equals("로그인 상태가 아닙니다.")){%>
	<a href="mypage">마이페이지</a>
	<%
	if(id.equals("admin")){
	%>
	<a href="admin">관리자모드</a>
	<% }}%>
	</div>
	<div>
	<%if(id.equals("로그인 상태가 아닙니다.")){%>
	<a type="button" href="login">로그인</a>
	<%} else {%>
	<a type="button" href="logout">로그아웃</a>
	<%} %>
	<a type="button" href="regist">회원가입</a>
	</div>
	</nav>
</body>

</html>