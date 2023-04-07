<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/grid.css">
<title>Insert title here</title>
</head>
<jsp:include page="/header"></jsp:include>
<body>

<%Boolean registSeccess =(Boolean) request.getAttribute("registSuccess");
if(registSeccess != null && registSeccess){
%>
<script>alert('회원가입 성공')</script>
<%} %>
<%Boolean alreadyLogout =(Boolean) request.getAttribute("alreadyLogout");
if(alreadyLogout != null && alreadyLogout){
%>
<script>alert('로그인 상태가 아닙니다.')</script>
<%} %>
<%
String log = (String)session.getAttribute("sessionId");
if( log != null  && !log.equals("로그인 상태가 아닙니다.")){
	System.out.println("이미 로그인상태");
	request.setAttribute("alreadyLogin", true);
	request.getRequestDispatcher("/").forward(request, response);
%>
<%}else {%>
<section>
        <h1>Log in</h1>
        <form method="post" action="../service">
        <input type="hidden" name="command" value="login">
            <div><input type="text" id="id" name="id" placeholder="아이디를 입력하세요." autofocus></div>
            <div><input type="password" id="password" name="password" placeholder="패스워드를 입력하세요."></div>
            <div><button type="button" onclick="checkValues(form)">로그인</button></div>
            <div><button type="button" onclick="location.href='regist'">회원가입</button></div>
        </form>
    </section>
</body>
<script src="resources/validation.js" ></script>
<jsp:include page="/footer"></jsp:include>
</html>
<%}%>


