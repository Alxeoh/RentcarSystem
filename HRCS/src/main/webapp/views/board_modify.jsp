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
	String content = request.getParameter("content");
	System.out.print(content);
	String title = request.getParameter("title");
	System.out.print(title);
	int no = Integer.parseInt(request.getParameter("no"));
	%>
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>
							<a href="board">게시글 수정</a>
						</h2>
					</div>
					<div>
						<div>
							<a type="button" href="board">뒤로가기</a>
						</div>
						<script>
							function submitForm() {
								document.getElementById("myForm").submit();
							}
						</script>
						<div>
							<a href="#" onclick="submitForm()">수정하기</a>
						</div>
					</div>
				</div>
				<div>
					<form id="myForm" method="post" action="../service">
						<input type="hidden" name="command" value="board_modify">
						<textarea style="text-align: top; height: fit-content;" id="title"
							name="title" autofocus></textarea>
						<textarea style="text-align: top;" id="content" name="content" autofocus> </textarea>
						<input type="hidden" name="no" value="<%= no%>">
					</form>
					<script>
		const contentTextArea = document.getElementById("content");
		const titleTextArea = document.getElementById("title");
		contentTextArea.value = "<%=request.getParameter("content")%>";
		titleTextArea.value = "<%=request.getParameter("title")%>";
					</script>
				</div>
			</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>