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
		<div id="headerLoginMenu">
            <% if(session.getAttribute("nickname") != null) { %>
                <div class="LoginProfileDiv">
                    <img src="images/profileimage/default.jpg"> 
                    <span><%= session.getAttribute("nickname") %>님 반갑습니다</span>
                </div>
                <div class="loginButton"><a href="uploadPost.jsp">게시글 작성</a></div>
                <div class="loginButton"><a href="certifyPW.jsp">마이페이지</a></div>
                <div class="loginButton"><a href="loginaction.jsp">로그아웃</a></div>
            <% } else { %>
                <div class="dologinButton"><a href="doLogin.jsp">로그인</a></div>
            <% } %>
        </div>
		<div id="logoimage"><a href="main.jsp"><img src="images/logo.png"></a></div>
		<div id="headerMenu">
			<ul>
				<li><a class="menuLink" href="#">상 의</a></li>
				<li><a class="menuLink" href="#">하 의</a></li>
				<li><a class="menuLink" href="#">아우터</a></li> 				
				<li><a class="menuLink" href="#">신 발</a></li>
				<li><a class="menuLink" href="#">액세사리</a></li>
				<li><a class="menuLink" href="#">가 방</a></li>
			</ul>	
		</div>
	</div>
</body>
</html>