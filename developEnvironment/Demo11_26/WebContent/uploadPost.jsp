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
						<td><input type="text" name="postTitle" required></td>
					</tr>
					<tr>
						<td><label for="postCategory">내용</label></td>
						<td>
							<select name="postCategory" required>
								<option value="">카테고리를 선택하세요.</option>
								<option value="top">상의</option>
								<option value="bottoms">하의</option>
								<option value="shoes">신발</option>
								<option value="accessory">악세사리</option>
								<option value="bag">가방</option>
								<option value="etc">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label for="postContent">내용</label></td>
						<td><textarea name="postContent" required></textarea></td>
					</tr>
			 	</table>
				<table border="0">
					<tr>
						<td><label for="rentalFromDate">대여 기간</label></td>
						<td><input type="date" name="rentalFromDate" required></td>
						<td><label style="font-size:13px;margin:5px;">부터</label>
						<td><input type="date" name="rentalToDate" required></td>
						<td><label style="font-size:13px;margin:5px;">까지</label>
					</tr>
				</table>
				<br>
				<table border="0">	
					<tr>
						<td><label for="postContent">사진1(대표사진)</label></td>
						<td><input style="border:none;" type="file" name="postFile1" title=" " required></td>
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