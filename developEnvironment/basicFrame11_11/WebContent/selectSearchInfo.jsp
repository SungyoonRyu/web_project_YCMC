<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<style type="text/css">
.buttonSearch {
width: 200px;
height: 50px;
color: rgb(74, 190, 202);
border: 3px solid rgb(74, 190, 202);
border-radius: 10px;
text-align: center;
display: inline-block;
margin: 20px auto;
}
#loginSection.selectSearch {
	width: 500px;
	height: 100px;
	padding: 30px;
}

#loginSectionInside.selectSearch {
	width: 500px;
	height: 100px;
}
</style>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp"><img src="images/logo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="selectSearch">
			<div id="loginSectionInside" class="selectSearch">
				<form>
					<a href="searchID.jsp"><div class="buttonSearch">아이디 찾기</div></a>
					<a href="searchPW.jsp"><div class="buttonSearch">비밀번호 찾기</div></a>
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>