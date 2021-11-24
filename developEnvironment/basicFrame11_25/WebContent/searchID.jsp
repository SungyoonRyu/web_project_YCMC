<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-아이디찾기</title>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp" id="noheaderlogolink" class="searchIDBox"><img src="images/ovallogo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="searchIDBox">
			<div id="loginSectionInside" class="searchIDBox">
				<form method="post" action="ID_search">
					<ul>
						<li><label>닉네임<input type="text" name="userNickname"></label></li>
						<li><label>이메일<input type="text" name="userEmail"></label></li>
						<fieldset class="sexSelectField">
								<legend>성별</legend>
								<ul>
									<li><label><input type="radio" name="userGender" value="male">남성</label></li>
									<li><label><input type="radio" name="userGender" value="woman">여성</label></li>
								</ul>
						</fieldset>
					</ul>
					<hr>
					<input type="submit" value="아이디 찾기">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>