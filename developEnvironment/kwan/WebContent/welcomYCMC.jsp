<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-환영합니다</title>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp" id="noheaderlogolink" class="welcome"><img
				src="images/ovallogo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="welcome">
			<div id="loginSectionInside" class="welcome">
				<br><br>
				<p>니옷내옷의 회원이 되신 것을<br> 축하드립니다!</p>
				<hr>
				<form>
					<input type="button" onclick="goSignIn()" value="로그인">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%>
		</footer>
	</div>
	<script type="text/javascript">
		function goSignIn() {
			location.href="doLogin.jsp";
		}
	</script>
</body>
</html>