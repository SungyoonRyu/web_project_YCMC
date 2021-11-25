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
<title>Insert title here</title>
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
			<div id ="loginSection">
				<div id ="loginSectionInside">
					<h2>1.회원 정보</h2>
						<ul>
							<li>ID:<%= userDTO.getUserID() %></li>
							<li>Nickname:<%=userDTO.getUserNickname() %></li>
							<li>Email:<%= userDTO.getUserEmail()%></li>
							<li>SEX:<%=userDTO.getUserGender() %></li>
						</ul>
					<p><h2>2. 비밀번호 변경</h2><div><a href="changePW.jsp">비밀번호 변경</a></div></p> 
					<p><h2>3. 회원정보 변경</h2><div><a href="">회원정보 변경</a></div></p>
					<p>
							<h2>4.나의 게시글</h2><br>
							<%						
							while(iter.hasNext()){
								DTO = iter.next();
								if(session.getAttribute("nickname").equals(DTO.getUserNickname())){
								out.println("<a href ="+"seePost.jsp?id="+DTO.getBoardID()+">"+DTO.getTitle()+"</a><br>");
								}
							}
							%>

							<a href="">작성</a>
							<a href="">편집</a>
					</p>
					<p><h2>5.나의 게시물 공유 요청</h2></p>
				
				</div>		
			</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>