<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<%
			String boardID = request.getParameter("id");
			Connection conn;
			PreparedStatement pstmt;
			ResultSet rs = null;

			try{
				String dbURL ="jdbc:mariadb://localhost:3307/webdb?useSSL=false";
				String dbID ="root"; //db아이디 
				String dbPassword ="1234";//db비밀번호
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
				String SQL = "select * from board where boardID = '" + boardID + "'";
				pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			String title = null;
			String boardContent = null;
			
			if(rs.next()) {
				title=rs.getString("title");
				boardContent=rs.getString("boardContent");
			}
		%>
		<main>
			<div>${sessionScope.nickname}</div>
			<div><%= title %></div>
			<hr>
			<div>내용</div>
			<div><%= boardContent %></div>
			<hr>
			<div>상품 내용</div>
			<div></div>
			<hr>
			<div>거래 희망 지역</div>
			<div></div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>