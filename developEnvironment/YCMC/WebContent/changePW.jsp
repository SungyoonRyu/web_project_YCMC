<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	function passwordcheck(){
		var newPassword = $("#newPW1").val();
		var newPassword2 = $("#newPW2").val();
		if(newPassword!=newPassword2){
			$("#confirmOK").html("비밀번호 일치하지 않습니다.");
		}else{
			$("#confirmOK").html("비밀번호 일치합니다.");
		}
	}
</script>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp" id="noheaderlogolink" class="changePWBox"><img src="images/ovallogo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="changePWBox">
			<div id="loginSectionInside" class="changePWBox" >
				<form action="changePW" method="post">
					<ul>
						<li id ="confirmOld"></li>
						<li><label>현재 비밀번호 <input id="oldPassword" type="password" name="oldPassword" ></label> </li>
						<li><label>변경할 비밀번호 <input id ="newPW1" type="password" name="newPassword"></label> </li>
						<li><label>변경할 비밀번호 확인 </label><input id="newPW2" onkeyup="passwordcheck()" type="password"></li>
						
					</ul>
					<br><div id="confirmOK"></div><br>
					<hr>
					<input type="submit" value="비밀번호 변경">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>