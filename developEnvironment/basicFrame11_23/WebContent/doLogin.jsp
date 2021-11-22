<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-로그인</title>
<style>
#noIDorPW {
	text-align: center;
	margin: 0px;
	width:500px;
	height:21px;
	color: #f29201;
}
</style>
</head>
<body>
	<div id="container">
		<a href="main.jsp" id="noheaderlogolink" class="loginlogolink"><img src="images/ovallogo.png" id="logoimage"></a>
		<div id="loginSection" class="loginBox">
			<div id="loginSectionInside" class="loginBox">
				<form method="post" action="login">
					<ul>
						<li><label>ID<input type="text" name="userID" placeholder="아이디를 입력하세요."></label></li>
						<li><label>PASSWORD<input type="password" name="userPassword" placeholder="비밀번호를 입력하세요."></label></li>
					</ul>
					<p id="noIDorPW"><% if(request.getAttribute("resultLogin") != null) { out.print("아이디 혹은 비밀번호가 올바르지 않습니다."); } %></p><br/><br/>
					<p style="text-align:center;"><a href="selectSearchInfo.jsp">아이디, 비밀번호가 기억나지 않나요?</a></p>
					<br/><br/><br/>
					<hr>
					<input type="button" class="loginBox" onclick="goSignIn()" value="회원가입">
					<input type="submit" class="loginBox" value="Login">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
	<script type="text/javascript">
		function goSignIn() {
			location.href="signUp.jsp";
		}
	</script>
</body>
</html>