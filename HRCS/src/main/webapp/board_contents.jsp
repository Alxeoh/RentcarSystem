<%@page import="board.Board"%>
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
	<%
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.print(no);
	BoardDao boardDao = BoardDao.getInstance();
	Board board = boardDao.getBoardByNo(no);
	%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2><a href="board">List</a></h2>
					</div>
					<%String log = (String) session.getAttribute("sessionId"); 
					if(log != null && log.equals("admin")){
					%>
					<div>
						<a type="button" href="board?delete=<%=no%>">게시글삭제</a> 
					</div>
					<%}else { %>
						<%}
						if (log != null && !log.equals("로그인 상태가 아닙니다.")) {
						%>
						<div>
						<a type="button" href="board_write">게시글 작성</a>
						</div>
						<%
						}
						%>
				</div>
				<div style="font-size: 25px;" style="align-item: center">
					<%
					String contents = board.getContents();
					%>
					<%=contents%>
				</div>
			</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>