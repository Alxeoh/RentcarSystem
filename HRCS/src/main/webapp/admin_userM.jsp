<%@page import="users.User"%>
<%@page import="users.controller.UserDao"%>
<%@page import="vehicle.Vehicle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vehicle.controller.VehicleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/header"></jsp:include>
<body>
<%
UserDao userDao = UserDao.getInstance();
String delete_id = request.getParameter("delete_id");
if(delete_id != null && !delete_id.isEmpty()){
	userDao.deleteUserById(delete_id);
%>
<Script>alert('회원삭제 완료')</Script>
<%} 
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
				<div>
					<h2>List</h2>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<td>등록번호</td>
								<td>차량번호</td>
								<td>차종</td>
								<td>총 주행시간</td>
							</tr>
							</thead>
							<%
							ArrayList<User> list = userDao.getAllUser();
							for (int i = 0; i < list.size(); i++) {
							%>
							<tbody>
								<tr>
									<td><a href="admin_userDetail?id=<%=list.get(i).getId()%>"><%=list.get(i).getId()%></a></td>
									<td><%=list.get(i).getPassword()%></td>
									<td><%=list.get(i).getName()%></td>
									<td><%=list.get(i).getReg_date()%></td>
								</tr>
							</tbody>
							<%
							}
							%>
						</table>
					</div>
				</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>