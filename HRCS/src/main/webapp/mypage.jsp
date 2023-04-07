<%@page import="users.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="users.controller.UserDao"%>
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
	<%
	String log = (String) session.getAttribute("sessionId");
	%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>Mypage</h2>
					</div>

					<div>
						<a type="button" href="/">뒤로가기</a>
					</div>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<th colspan="4">회원정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>회원ID</td>
								<td>회원PW</td>
								<td>회원이름</td>
								<td>가입일자</td>
							</tr>
							<%
							UserDao userDao = UserDao.getInstance();
							User user = userDao.getUserById(log);
							%>
							<tr>
								<td><%=user.getId()%></td>
								<td><%=user.getPassword()%></td>
								<td><%=user.getName()%></td>
								<td><%=user.getReg_date()%></td>
							</tr>
						</tbody>
					</table>
					<br><br>
					<table>
						<thead>
							<tr>
								<th colspan="5">이용내역</th>
							</tr>
							<tr>
								<td>차량번호</td>
								<td>차종</td>
								<td>렌탈일</td>
								<td>반납일</td>
								<td>이용요금</td>
							</tr>
						</thead>
					</table>
				</div>
			</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>