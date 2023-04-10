<%@page import="users.User"%>
<%@page import="users.controller.UserDao"%>
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
	String log = (String) session.getAttribute("sessionId");
	if (!log.equals("admin")) {
		System.out.println("관리자계정만 이용가능");
		request.setAttribute("notAdmin", true);
		request.getRequestDispatcher("/").forward(request, response);
	}
	%>
	<%
	String id = request.getParameter("id");
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
							<a type="button" href="/admin_userM?delete_id=<%=id%>">회원삭제</a>
						</div>
						<div>
							<a type="button" href="admin_userM">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
					<h2>회원관리</h2>
					<br>
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
							User user = userDao.getUserById(id);
							%>
							<tr>
								<td><%=user.getId()%></td>
								<td><%=user.getPassword()%></td>
								<td><%=user.getName()%></td>
								<td><%=user.getReg_date()%></td>
							</tr>
						</tbody>
					</table>
					<br> <br>
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