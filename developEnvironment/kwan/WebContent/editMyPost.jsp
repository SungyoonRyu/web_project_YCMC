<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-나의게시글</title>
</head>
<body>
	<%
		BoardDAO DAO = new BoardDAO();
		BoardDTO DTO = DAO.boardInstance(request.getParameter("id"));
	%>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
			<div id="UploadBackDiv">
				<div id="UploadBackInsideDiv">
					<form method="post" action="PostEditing">
						<input type="hidden" name="boardID" value="<%= request.getParameter("id") %>">
						<table border="0">
							<tr>
								<td><label for="postTitle">제목</label></td>
								<td><input type="text" name="postTitle" value="<%= DTO.getTitle() %>" required></td>
							</tr>
							<tr>
								<td><label for="postCategory">카테고리</label></td>
								<td>
									<select name="postCategory" required>
										<option value="">카테고리를 선택하세요.</option>
										<option value="top" <% if(DTO.getBoardCategory().equals("top")) out.print("selected"); %>>상의</option>
										<option value="bottoms" <% if(DTO.getBoardCategory().equals("bottoms")) out.print("selected"); %>>하의</option>
										<option value="shoes" <% if(DTO.getBoardCategory().equals("shoes")) out.print("selected"); %>>신발</option>
										<option value="accessory" <% if(DTO.getBoardCategory().equals("accessory")) out.print("selected"); %>>악세사리</option>
										<option value="bag" <% if(DTO.getBoardCategory().equals("bag")) out.print("selected"); %>>가방</option>
										<option value="etc" <% if(DTO.getBoardCategory().equals("etc")) out.print("selected"); %>>기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td><label for="postContent">내용</label></td>
								<td><textarea name="postContent" required><%= DTO.getBoardContent() %></textarea></td>
							</tr>
					 	</table>
						<table border="0">
							<tr>
								<td><label for="rentalFromDate">대여 기간</label></td>
								<td><input type="date" value="<%= DTO.getRentalDate1().substring(0, 10) %>" name="rentalFromDate" required></td>
								<td><label style="font-size:13px;margin:5px;">부터</label>
								<td><input type="date" value="<%= DTO.getRentalDate2().substring(0, 10) %>" name="rentalToDate" required></td>
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
						<br><br>
						<input type="hidden" id="nowTime" name="today" value="">
						<input type="submit" value="수정하기">
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