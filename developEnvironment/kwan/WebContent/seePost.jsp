<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="image.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="images/icon.png">
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="deletecomment.js"type="text/javascript"></script>
<title>니옷내옷-게시글</title>
</head>
<body>
	<div id="container" style="height:2500px;">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
		<%
			BoardDAO DAO = new BoardDAO();
			BoardDTO PostDTO = DAO.boardInstance(request.getParameter("id"));
			
			ImageDAO imageDAO = new ImageDAO();
			ArrayList<String> imagefiles = imageDAO.fileNum(PostDTO.getBoardID());
			Iterator IMGiter = imagefiles.iterator();
		%>
		<div id="seePostBackDiv">
			<div id="firstDiv">
				<div id="seePostLabelDiv">
					<img src="images/profileimage/default.jpg"></img>
					<div class="labelAlign">
						<p><%= PostDTO.getUserNickname() %>님의 게시글</p>
						<p><%= PostDTO.getTitle() %></p>
						<a href="editMyPost.jsp?id=<%= PostDTO.getBoardID() %>">수정</a>
						<a href="#">삭제</a>
					</div>	
				</div>
				<div id="slider">
					<input type="radio" name="slider" id="slide1" checked>
    				<input type="radio" name="slider" id="slide2">
    				<input type="radio" name="slider" id="slide3">
    				<div id="slides">
						<div id="imageOverflow">
							<div class="inner">
								<div class="slide slide_1">
									<div class="slide-conetent">
										<% if(IMGiter.hasNext()){ %><img src="images/imageboard/<%= IMGiter.next() %>.jpg"><% } %>
									</div>
								</div>
								<div class="slide slide_2">
									<div class="slide-conetent">
										<% if(IMGiter.hasNext()){ %><img src="images/imageboard/<%= IMGiter.next() %>.jpg"><% } %>
									</div>
								</div>
								<div class="slide slide_3">
									<div class="slide-conetent">
										<% if(IMGiter.hasNext()){ %><img src="images/imageboard/<%= IMGiter.next() %>.jpg"><% } %>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="controls">
					<label for="slide1"></label>
     				<label for="slide2"></label>
      				<label for="slide3"></label>
				</div>
				<div id="bullets">
					<label for="slide1"></label>
     				
      				<label for="slide3"></label>
				</div>
			</div>
			<hr class="seeposthr">
			<div id="secondDiv">
				<div id="sendMessage">
					<label>작성자에게 쪽지보내기</label>
				</div>
				<form>
					<textarea></textarea>
					<input type="submit" value="전송하기">
				</form>
			</div>
			<hr class="seeposthr">
			<div id="thirdDiv">
				<p>상품정보</p>
				<table class="infoTable">
					<tbody>
						<tr>
							<th>상품등록일</th>
							<td colspan="2"><%= PostDTO.getBoardDate() %></td>
						</tr>
						<tr>
							<th>대여 횟수</th>
							<td colspan="2"><%= PostDTO.getRentalCount() %></td>
						</tr>
						<tr>
							<th>대여 기간</th>
							<td><%= PostDTO.getRentalDate1().substring(0, 10) %>부터</td>
							<td><%= PostDTO.getRentalDate2().substring(0, 10) %>까지</td>	
						</tr>
					</tbody>
				</table>
			</div>
			<hr class="seeposthr">
			<div id="fourthDiv">
				<p>황민 님의 옷 정보</p>
				<div id="clothInformation">
					<%= PostDTO.getBoardContent() %>
				</div>
			</div>
			<hr class="seeposthr">
			<div id="fifthDiv">
				<%@ include file="comment.jsp"%>
			</div>
		</div>	
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>