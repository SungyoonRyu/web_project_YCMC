<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="board.*" %>
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
		BoardDAO DAO = new BoardDAO();
		BoardDTO DTO = null;
		ArrayList<BoardDTO> postList = DAO.boardList();
		Iterator<BoardDTO> iter = postList.iterator();
		%>
			<div id ="loginSection">
				<div id ="loginSectionInside">
					<p>
					1.회원 정보
						<ul>
							<li>ID:</li>
							<li>Nickname: </li>
							<li>Email: </li>
							<li>성별: </li>
						</ul>
					</p> 
					<p>2.비밀번호 변경<div><a href="changePW.jsp">비밀번호 변경</a></div></p> 
					<p>3.회원정보 변경<div><a href="">회원정보 변경</a></div></p>
					<p>
					<form>
							4.나의 게시글<br>
							<%						
							while(iter.hasNext()){
								DTO = iter.next();
								if(session.getAttribute("nickname").equals(DTO.getUserNickname())){
								out.println("<li>"+DTO.getTitle()+"</li>");%><br>
							<%}}%>
							<a href="">작성</a>
							<a href="">편집</a>
						
					</form>
					</p>
					<p>5.나의 게시물 공유 요청</p>
				
				</div>		
			</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>