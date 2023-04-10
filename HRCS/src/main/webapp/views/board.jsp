<%@page import="board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.controller.BoardDao"%>
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
<%Boolean modify = (Boolean)request.getAttribute("boardmodify");
if(modify != null && modify){
%>
<script>alert('게시글 수정완료');</script>
<%} %>

	<%
Boolean writeSuccess = (Boolean)request.getAttribute("writeSuccess");
if(writeSuccess != null && writeSuccess) {
	%>
	<script>alert("게시글 업로드완료");</script>
	<%} %>
	<% 
	
    BoardDao boardDao = BoardDao.getInstance();
String deleteParam = request.getParameter("delete");
if (deleteParam != null && !deleteParam.isEmpty()) {
    int deleteNo = Integer.parseInt(deleteParam);
    boardDao.deleteContentsByNo(deleteNo);
    boardDao.sortNo();
%>
	<script>alert('게시글이 삭제되었습니다.');
		location.href="board";
</script>
	<%} else {%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>Community</h2>
					</div>
					<div>
							<%
String log = (String)session.getAttribute("sessionId");
if( log != null  && !log.equals("로그인 상태가 아닙니다.")){
%>
						<div>
							<a href="board?myContent=<%= log%>">My게시글 보기</a>
						</div>
						<div>
							<a href="board">전체보기</a>
						</div>
						<div>
							<a href="board_write">게시글 작성</a>
						</div>
						<%} %>
						<div>
							<a href="/">뒤로가기</a>
						</div>
					</div>
				</div>
				<div>
					<table>
						<thead>
							<tr>
								<td>목차</td>
								<td>게시글 타입</td>
								<td>작성자 ID</td>
								<td>제목</td>
								<td>수정일</td>
								<td>작성일</td>
							</tr>
						</thead>
						<%
						String myContent = request.getParameter("myContent");
						ArrayList<Board> list = boardDao.getAllBoard();
						if(myContent != null){
							list = boardDao.getMyBoard(myContent);
						}
						for (int i = 0; i < list.size(); i++) {
						%>
						<tbody>
							<tr>
								<td><%=list.get(i).getNo()%></td>
								<td>
									<%if(list.get(i).getType().equals("1")){
								 %> <%= "일반글"%> <% } else { %> <%="공지사항"%> <%} %>
								</td>
								<td><%=list.get(i).getId()%></td>
								<td><a href="board_contents?id=<%= list.get(i).getId()%>&no=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a></td>
								<td><%=list.get(i).getM_date()%></td>
								<td><%=list.get(i).getW_date()%></td>
							</tr>
						</tbody>
						<%
						}}
						%>
					</table>
				</div>
			</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>