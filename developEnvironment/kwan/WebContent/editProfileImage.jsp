<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-나의정보</title>
</head>
<body>
	<div id="container">
		<a href="main.jsp" id="noheaderlogolink" class="signin"><img src="images/ovallogo.png" id="logoimage"></a>
		<div id="loginSection" class="editProfileimage">
			<p>#프로필 사진 변경</p>
			<div id="loginSectionInside" class="editProfileimage">
				<img src="images/profileimage/<%= session.getAttribute("ID") + "IMG" %>.jpg">
				<form method="post" action="profileImage" enctype="multipart/form-data">
					<input style="border:none;" type="file" name="profileIMG" title=" " required>
					<div id="uploadInfoMessage">#프로필 사진 변경에는 몇 분이 걸릴 수 있습니다</div>
					<br/><br/>
					<hr>
					<div id="loginSectionInsideSignUpButton"><input type="submit" value="변경하기"></div>
				</form>
			</div>
		</div>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>