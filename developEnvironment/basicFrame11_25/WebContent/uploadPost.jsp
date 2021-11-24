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
			<div id="UploadBackDiv">
				<div id="UploadBackInsideDiv">
				<form action="postingServlet" method="post" enctype="multipart/form-data">
				<table border="0">
					<tr>
						<td><label for="postTitle">제목</label></td>
						<td><input type="text" name="postTitle"></td>
					</tr>
					<tr>
						<td><label for="postContent">내용</label></td>
						<td><textarea name="postContent"></textarea></td>
					</tr>
			 	</table>
				<table border="0">
					<tr>
						<td><label for="rentalFromDate">대여 기간</label></td>
						<td><input type="date" name="rentalFromDate"></td>
						<td><label style="font-size:13px;margin:5px;">부터</label>
						<td><input type="date" name="rentalToDate"></td>
						<td><label style="font-size:13px;margin:5px;">까지</label>
					</tr>
				</table>
				<br>
				<table border="0">	
					<tr>
						<td><label for="postContent">사진1</label></td>
						<td><input style="border:none;" type="file" name="postFile1" title=" "></td>
					</tr>
					<tr>
						<td><label for="postContent">사진2</label></td>
						<td><input style="border:none;" type="file" name="postFile2"></td>
					</tr>
					<tr>
						<td><label for="postContent">사진3</label></td>
						<td><input style="border:none;" type="file" name="postFile3"></td>
					</tr>
				</table>
				</table>
				<br>
				<input type="hidden" id="nowTime" name="today" value="">
				<input type="submit" value="게시글 작성">
				</form>
				</div>
			</div>
		</main>
		<br><br><br>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
	<script type="text/javascript">
		var date = new Date();
		document.getElementById("nowTime").value = date.getTime();
	</script>
</body>
</html>