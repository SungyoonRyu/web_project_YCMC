<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-게시글 작성</title>
	
</head>
<body>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
			<form action="postingServlet" method="post" enctype="multipart/form-data">
				<table border="0">
					<tr>
						<td><label for="postTitle">제목</label></td>
						<td><input type="text" name="postTitle" size="15"></td>
					</tr>
					<tr>
						<td><label for="postContent">내용</label></td>
						<td><textarea name="postContent" cols="65" rows="4"></textarea></td>
					</tr>
					<tr>
						<td><label for="rentalFromDate">대여 기간</label></td>
						<td><input type="date" name="rentalFromDate"></td>
						<td></td>
						<td><input type="date" name="rentalToDate"></td>
					</tr>
					<tr>
						<td><label for="postContent">사진1</label></td>
						<td><input type="file" name="postFile1"></td>
					</tr>
					<tr>
						<td><label for="postContent">사진2</label></td>
						<td><input type="file" name="postFile2"></td>
					</tr>
					<tr>
						<td><label for="postContent">사진3</label></td>
						<td><input type="file" name="postFile3"></td>
					</tr>
				</table>
				
				<input type="hidden" id="nowTime" name="today" value="">
				<input type="submit" value="게시글 작성"/>
			</form>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
	<script type="text/javascript">
		var date = new Date();
		document.getElementById("nowTime").value = date.getTime();
	</script>
</body>
</html>