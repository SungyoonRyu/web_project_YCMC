<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="images/icon.png">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-내정보찾기</title>
</head>
<body>
	<div id="container">
		<a href="main.jsp" id="noheaderlogolink" class="selectSearch"><img src="images/ovallogo.png" id="logoimage"></a>
		<br><br>
		<div id="loginSection" class="selectSearch">
			<p>#니옷내옷 회원정보 - 찾기 원하시는 정보를 선택해주세요!</p>
			<div id="loginSectionInside" class="selectSearch">
				<div>
					<a href="searchID.jsp"><div class="buttonSearch">아이디 찾기</div></a>
					<a href="searchPW.jsp"><div class="buttonSearch">비밀번호 찾기</div></a>
				</div>
			</div>
		</div>
		<br><br>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>