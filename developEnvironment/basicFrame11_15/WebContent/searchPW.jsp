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
			<a href="main.jsp" id="noheaderlogolink" class="searchPWBox"><img src="images/ovallogo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="searchPWBox">
			<div id="loginSectionInside" class="searchPWBox">
				<form>
					<ul>
						<li><label>아이디<input type="text"></label></li>
						<li><label>이름<input type="text"></label></li>
						<li><label>이메일<input type="text"></label></li>
						<fieldset class="sexSelectField">
								<legend>성별</legend>
								<ul>
									<li><label>남<input type="radio" name="sex" value="male"></label></li>
									<li><label>여<input type="radio" name="sex" value="woman"></label></li>
								</ul>
						</fieldset>
					</ul>
					<hr>
					<input type="submit" value="비밀번호 찾기">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>