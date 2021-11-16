<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/headerstyle.css">
</head>
<body>
	<div id="header">
		<div>
		<div> <% if(session.getAttribute("nickname") != null) { out.print(session.getAttribute("nickname") + " welcome"); } %>
		</div>
			<a href="doLogin.jsp">로그인 영역</a>
			<a href="loginaction.jsp">로그아웃</a>
		</div>
		<div id="logoimage"><a href="main.jsp"><img src="images/logo.png"></a></div>
		<div id="navi">
			nav 영역
		</div>
	</div>
</body>
</html>