<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/post.css">
<title>니옷내옷-당신의 옷을 공유하세요</title>
</head>
<body>
	<div id="titlePostcontainer">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
		<div id ="#titlePostDiv">
			<div>
		<table id ="TitlePostListTable">
		<%
			int num =0; 
			BoardDAO boardDAO = new BoardDAO();
			ArrayList <BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");
			Iterator<BoardDTO> iter = boardList.iterator();
			BoardDTO titlePost = null;
				if(boardList.isEmpty()){
					out.println("<tr><th>관련 게시글이 아직 없습니다</th></tr>");
				}else{ %>
					<tr>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
				</tr>
				<tr>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
				</tr>
				<tr>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
					<td><%if(iter.hasNext()) { titlePost = iter.next(); %><a href="seePost.jsp?id=<%= titlePost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= titlePost.getBoardID() + "1" %>.jpg"><p><%= titlePost.getTitle()  %></p></div><% } %></a></td>
				</tr>
				<% } %>
		</table>
			</div>
		</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>