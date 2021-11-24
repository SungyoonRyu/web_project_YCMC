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
			<%
			BoardDAO DAO = new BoardDAO();
			BoardDTO aboutPost = null;
			ArrayList<BoardDTO> mainList = DAO.boardList();
			Iterator<BoardDTO> iter = mainList.iterator();
			%>
		<div id="MainInfoDiv">
			<ul>
				<br>
				<p>#니옷내옷</p>
				<p>#우린 깐부잖아~?</p>
				<p>#당신의 옷이 오늘은 나의 옷?</p>
				<br>
				<br>
				<p style="font-size:14px;">애매한 사이즈의 옷... 버리긴 아까우실 때!!</p>
				<p style="font-size:14px;">급하게 옷이 필요한데... 돈 쓰기엔 아까우실 때!!</p>
				<br>
				<p style="font-size:17px;"><span style="font-size:36px;font-weight:bold;">니옷내옷</span>은 이런 분들이 주변 사용자들과</p>
				<p style="font-size:17px;padding-left:150px;"><span style="font-size:36px;font-weight:bold;">공유</span>할 수 있도록 만들어진 공간입니다.</p>
			</ul>
		</div>
		<div id="MainFindTagDiv">
		<br><br><br>
		<label for="MainTagSearch">#내가 찾는 옷 태그로 쉽게 찾자!</label>
		<br><br>
		<form method="post" action="">
		<input type="text" name="MainTagSearch" placeholder="# 태그를 사용해서 검색해보세요!"
		style="height:40px; width:400px; font-size:23px;">
		</form>
		</div>
		<div id="MainPostDiv">
		<p style="padding-top:40px;">#최근 올라온 공유글</p>
		<div id="MainPostDivInside">
			<div class="PostCard">
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
			</div>
		</div>
		</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>