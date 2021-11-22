<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-당신의 옷을 공유하세요</title>
</head>
<body>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
		<div id="MainInfoDiv">
			<ul>
				<br>
				<li><label>#니옷내옷</label></li>
				<li><label>#우린 깐부잖아~?</label></li>
				<li><label>#당신의 옷이 오늘은 나의 옷?</label></li>
				<br>
				<br>
				<li><label style="font-size:14px;">애매한 사이즈의 옷... 버리긴 아까우실 때!!</label></li>
				<li><label style="font-size:14px;">급하게 옷이 필요한데... 돈 쓰기엔 아까우실 때!!</label></li>
				<br>
				<li style="text-align:left;"><label style="font-size:36px;">니옷내옷</label><label style="font-size:20px;">은 이런 분들이 주변 사용자들과<label style="font-size:36px">공유</label><label style="font-size:20px;">할 수 있도록 만들어진 공간입니다.</label></li>
				<br>
			</ul>
		</div>
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