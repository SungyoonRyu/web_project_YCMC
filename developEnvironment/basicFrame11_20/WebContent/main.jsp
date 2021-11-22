<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
			<%
			BoardDAO DAO = new BoardDAO();
			BoardDTO aboutPost = null;
			ArrayList<BoardDTO> mainList = DAO.boardList();
			Iterator<BoardDTO> iter = mainList.iterator();
			%>
			<table>
				<tr>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
				</tr>
				<tr>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
				</tr>
				<tr>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
					<td><div><%if(iter.hasNext()) { aboutPost = iter.next(); %><a href="seePost.jsp?id=<%= aboutPost.getBoardID() %>"><%= aboutPost.getTitle()  %><% } %></a></div></td>
				</tr>
			</table>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>