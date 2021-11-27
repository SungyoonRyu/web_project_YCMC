<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="board.*" %>
	<%@ page import="user.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷 - 마이페이지</title>
</head>
<body>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
		<%
		UserDAO userDAO = new UserDAO();
		UserDTO userDTO = userDAO.userInstance((String)session.getAttribute("ID"));
		BoardDAO DAO = new BoardDAO();
		BoardDTO DTO = null;
		ArrayList<BoardDTO> postList = DAO.boardList();
		Iterator<BoardDTO> iter = postList.iterator();
		%>
			<div id ="loginSection" class="myProfile">
				<p>#마이페이지</p>
				<div id ="loginSectionInside" class="myProfile">
					<div id="myProfileMenu">
					<p>1. 회원 정보</p>
						<ul>
							<li><img src="images/profileimage/<%= session.getAttribute("ID") + "IMG" %>.jpg"></li>
							<li><p style="font-size:25px">ID: "<%= userDTO.getUserID() %>"</p></li>
							<li><p style="font-size:25px">Nickname: "<%=userDTO.getUserNickname() %>"</p></li>
							<li><p style="font-size:25px">Email: "<%= userDTO.getUserEmail()%>"</p></li>
							<li><p style="font-size:25px">Gender: "<%=userDTO.getUserGender() %>"</p></li>
						</ul>
					</div>	
					<div id="myProfileMenu2">
						<p>2. 비밀번호 변경<div class="changeButton"><a href="changePW.jsp">비밀번호 변경페이지로 바로가기</a></div></p> 
						<p>3. 회원정보 변경<div class="changeButton"><a href="editProfile.jsp">회원정보 변경페이지로 바로가기</a></div>
						<p>4. 프로필 사진 변경<div class="changeButton"><a href="editProfileImage.jsp">프로필 사진 변경페이지로 바로가기</a></div></p>
					</div>
					<div id="myProfileMenu3">
						<p>5. 나의 관희게시글</p><br>
						<div class="InsideDivBoard">
							<%						
								while(iter.hasNext()){
								DTO = iter.next();
								if(session.getAttribute("nickname").equals(DTO.getUserNickname())){
								out.println("<a href ="+"seePost.jsp?id="+DTO.getBoardID()+">"+DTO.getTitle()+"</a><br>");
								}
							}
							%>
						</div>
						<br><br>
						<p>6. 나의 게시물 공유 요청</p>
						<div class="InsideDivBoard"></div>
					</div>
					
					
				</div>		
			</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>