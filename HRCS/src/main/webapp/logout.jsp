<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String log = (String)session.getAttribute("sessionId");
if(log != null && log.equals("로그인 상태가 아닙니다.")){
	System.out.println("이미 로그아웃 상태");
	request.setAttribute("alreadyLogout", true);
	request.getRequestDispatcher("login").forward(request, response);
} else  {
response.sendRedirect("../service?command=logout");
}
%>

</body>
</html>