<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="image.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-게시글</title>
<script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=true">
</script>
<script type="text/javascript">
	window.onload = function() {
		navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
	}
	function successCallback(wp_position) {
		var wplatlng = new google.maps.LatLng(wp_position.coords.latitude, wp_position.coords.longitude);
		var wpOptions = {zoom:15, center:wplatlng, mapTypeId:google.maps.MapTypeId.ROADMAP};
		var wpmap = new google.maps.Map(document.getElementById("map"), wpOptions);
	}
	function errorCallback(wp_position_error) {
		document.getElementById("map").innerHTML = wp_position_error.code + ":" + wp_position_error.message;
	}
</script>
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
			
			ImageDAO images = new ImageDAO();
			ArrayList<String> filenames = images.fileNum(boardID);
			Iterator<String> iter = filenames.iterator();
		%>
		<main>
			<div>${sessionScope.nickname}</div>
			<div><%= title %></div>
			<div><% if(iter.hasNext()) { %><img src="images/imageboard/<%= iter.next().toString() %>.jpg"><% } %></div>
			<div><% if(iter.hasNext()) { %><img src="images/imageboard/<%= iter.next().toString() %>.jpg"><% } %></div>
			<div><% if(iter.hasNext()) { %><img src="images/imageboard/<%= iter.next().toString() %>.jpg"><% } %></div>
			<hr>
			<div>내용</div>
			<div><%= boardContent %></div>
			<hr>
			<div>상품 내용</div>
			<div></div>
			<hr>
			<div>거래 희망 지역</div>
			<div>
				<div id="map" style="width:700px; height:500px;"></div>
			</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>