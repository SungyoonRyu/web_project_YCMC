<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-당신의 옷을 공유하세요</title>
</head>
<body>
	<div id="container">
		<div>
			<a href="main.jsp" id="noheaderlogolink" class="searchResult"><img
				src="images/ovallogo.png" id="loginLogo"></a>
		</div>
		<div id="loginSection" class="searchResult">
			<div id="loginSectionInside" class="searchResult">
				<br><br>
				<div class="ErrorMessage">
					<% if(request.getAttribute("resultType") == "none") { %>
						해당 정보가 없습니다.
					<% } else if(request.getAttribute("resultType") == "ID") { %>
						<%= request.getAttribute("resultString") %>
					<% } else if(request.getAttribute("resultType") == "Password") { %>
						<%= request.getAttribute("resultString") %>
					<% } else { %>
						<span style="font-weight:bold">ERROR : 관리자에게 말씀해 주세요!</span>
					<% } %>
				</div>
				<form>
					<hr>
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