<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="images/icon.png">
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
						<li><label style="width:450px;">아이디<span>&nbsp&nbsp #아이디는 최대 10글자입니다</span></label>
						<input style="font-size:16px;" type="text" name="userID" placeholder="아이디를 입력하세요" maxlength="10" required></li>
						<li><label>비밀번호<span>&nbsp&nbsp #비밀번호는 최대 12글자입니다</span>
						<input style="font-size:16px;" type="password" name="userPassword" placeholder="비밀번호를 입력하세요" maxlength="12" required></label></li>
						<li><label>비밀번호 확인
						<input style="font-size:16px;" type="password" name="" placeholder="비밀번호를 다시 한 번 입력하세요" maxlength="12" required></label></li>
						<li><label>닉네임<span>&nbsp&nbsp #닉네임은 최대 8글자입니다</span>
						<input style="font-size:16px;" type="text" name="userNickname" placeholder="닉네임을 입력하세요" maxlength="8" required></label></li>
					</ul>
				</div>
				<div style="display:inline-block;vertical-align: top;">
					<ul>
						<li><label style="width:450px;">Email<input style="font-size:16px;" type="text" name="userEmail" placeholder="이메일을 입력하세요"></label></li>
						<li>
							<fieldset class="sexSelectField">
								<legend>성별</legend>
								<ul>
									<li><label><input type="radio" name="userGender" value="male" required>남성</label></li>
									<li><label><input type="radio" name="userGender" value="female" required>여성</label></li>
								</ul>
							</fieldset>
						</li>
					</ul>
				</div>
				<br/><br/><br/><br/><br/><br/>
					<hr>
					<div id="loginSectionInsideSignUpButton"><input type="submit" value="회원가입"></div>
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>