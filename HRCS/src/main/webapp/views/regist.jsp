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
String log = (String)session.getAttribute("sessionId");
if(log != null && !log.equals("로그인 상태가 아닙니다.")){
	request.setAttribute("needLogout", true);
	request.getRequestDispatcher("/").forward(request, response);
%>
<%} %>
<%
 Boolean duplId = (Boolean)request.getAttribute("duplId");
if(duplId != null && duplId) {
%>
<script>alert("중복된 아이디입니다.");</script>
<%} %>
	<section>
        <h1>Join</h1>
        <form method="post" action="../service">
        <input type="hidden" name="command" value="regist">
            <div><input type="text" id="id" name="id" placeholder="아이디를 입력하세요." autofocus></div>
            <div><input type="password" id="password" name="password" placeholder="패스워드를 입력하세요."></div>
            <div><input type="text" id="name" name="name" placeholder="성함을 입력하세요."></div>
            <div><button type="button" onclick="checkValues(form)">회원가입</button></div>
            <div><button type="button" onclick="location.href='login'">로그인</button></div>
        </form>
    </section>
</body>
<script src="resources/validation2.js" ></script>
<jsp:include page="/footer"></jsp:include>
</html>