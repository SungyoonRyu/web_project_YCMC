<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp"><img src="images/logo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="loginBox">
			<div id="loginSectionInside" class="loginBox">
				<form>
					<ul>
						<li><label>ID</label> <input type="text"></li>
						<li><label>PASSWORD</label> <input type="password"></li>
					</ul>
					<input type="submit" value="비밀번호 찾기">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>