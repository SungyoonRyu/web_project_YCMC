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
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
		<div id = "CategoryPostDiv">
			<div id ="CategoryPostinsideDiv">
		<table>
		<%
			String queryString = request.getQueryString();
			String boardCategory = queryString.substring(queryString.lastIndexOf("=")+1);
			BoardDAO boardDAO = new BoardDAO();
			BoardDTO categoryPost = null;
			ArrayList <BoardDTO> categoryList = boardDAO.boardCategoryList(boardCategory);
			Iterator<BoardDTO> iter = categoryList.iterator();
			if(categoryList.isEmpty()){
				out.println("<tr><th>관련 게시글이 아직 없습니다</th></tr>");
			}else{
			%>
			<tr>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
			</tr>
			<tr>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
			</tr>
			<tr>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
				<td><%if(iter.hasNext()) { categoryPost = iter.next(); %><a href="seePost.jsp?id=<%= categoryPost.getBoardID() %>"><div class="displayPost"><img src="images/imageboard/<%= categoryPost.getBoardID() + "1" %>.jpg"><p><%= categoryPost.getTitle()  %></p></div><% } %></a></td>
			</tr>
				
			<%} %>
			
		
		</table>
		</div>
		</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>