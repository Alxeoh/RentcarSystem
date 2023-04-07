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
if(!id.equals("admin")){
	System.out.println("관리자계정만 이용가능");
	request.setAttribute("notAdmin", true);
	request.getRequestDispatcher("/").forward(request, response);
}
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
                
            </article>
        </div>
    </section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>