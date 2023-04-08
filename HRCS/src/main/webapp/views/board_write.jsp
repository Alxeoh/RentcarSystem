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
	<section>
		<div>
			<article>
				<div>
					<div>
						<h2>
							<a href="board">게시글 작성</a>
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
							<a href="#" onclick="submitForm()">올리기</a>
						</div>
					</div>
				</div>
				<div>
					<form id="myForm" method="post" action="../service">
						<input type="hidden" name="command" value="write">
						<textarea style="text-align: top; height: fit-content;" id="title"
							name="title" placeholder="제목을 작성하세요." autofocus></textarea>
						<textarea style="text-align: top;" name="content"
							placeholder="게시글을 작성하세요." autofocus></textarea>
					</form>
				</div>
			</article>
		</div>
	</section>
</body>
<jsp:include page="/footer"></jsp:include>
</html>