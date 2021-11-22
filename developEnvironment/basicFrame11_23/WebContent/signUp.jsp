<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-회원가입</title>
</head>
<body>
	<div id="container">
		<a href="main.jsp" id="noheaderlogolink" class="signin"><img src="images/ovallogo.png" id="logoimage"></a>
		<div id="loginSection" class="signin">
			<div id="loginSectionInside" class="signin">
				<form method="post" action="signup">
				<div style="display:inline-block;padding-left: 12px;">
					<ul>
						<li><label style="width:450px;">아이디<input type="text" name="userID"></label></li>
						<li><label>비밀번호<input type="password" name="userPassword"></label></li>
						<li><label>비밀번호 확인<input type="password" ></label></li>
						<li><label>닉네임<input type="text" name="userNickname"></label></li>
					</ul>
				</div>
				<div style="display:inline-block;vertical-align: top;">
					<ul>
						<li><label style="width:450px;">Email<input type="text" name="userEmail"></label></li>
						<li>
							<fieldset class="sexSelectField">
								<legend>성별</legend>
								<ul>
									<li><label>남<input type="radio" name="userGender" value="male"></label></li>
									<li><label>여<input type="radio" name="userGender" value="female"></label></li>
								</ul>
							</fieldset>
						</li>
					</ul>
				</div>
				<br/><br/><br/><br/><br/><br/>
					<hr>
					<input type="submit" value="회원가입">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>