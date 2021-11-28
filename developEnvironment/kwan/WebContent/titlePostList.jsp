<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-당신의 옷을 공유하세요</title>
</head>
<body>
	<div id="container">
		<header> <%@ include file="header.jsp"%> </header>
		<main>
		<table border="1" width="450">
		<%
			BoardDAO boardDAO = new BoardDAO();
			ArrayList <BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");
			try{
				if(boardList.isEmpty()){
					out.println("<tr><th>관련 게시글이 아직 없습니다</th></tr>");
				}else{
					out.println("<tr>");
					for(int i =0; i<boardList.size();i++){
						out.println("<td>");
						out.println("<a href='seePost.jsp?title="+boardList.get(i).getBoardID()+"'>");
						out.println("<div class='displayPost'>"+"<img src='images/imageboard/"+boardList.get(i).getBoardID()+"1.jpg'>");
						out.println("<p>"+boardList.get(i).getTitle()+"</p>");
						out.println("</div></a>");
						out.println("</td>");
					}
					out.println("</tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		%>
		</table>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>