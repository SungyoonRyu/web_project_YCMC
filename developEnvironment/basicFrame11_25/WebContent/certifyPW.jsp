<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-비밀번호 확인</title>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp" id="noheaderlogolink" class="certifyPasswordBox"><img src="images/ovallogo.png" id="logoimage"></a>
		</div>
		<div id="loginSection" class="certifyPasswordBox">
			<div id="loginSectionInside" class="certifyPasswordBox">
				<form>
					<ul>
						<li><label>비밀번호 확인</label> <input type="password" name ="certifyPassword"></li>
					</ul>
					<hr>
					<input type="submit" value="비밀번호 확인">
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>