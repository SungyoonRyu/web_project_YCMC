<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="comment.*" %>
<%@ page import="image.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>니옷내옷-게시글</title>
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
				String dbPassword ="root1234";//db비밀번호
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
		%>
		<main>
			<div>${sessionScope.nickname}</div>
			<div><%= title %></div>
			<div><img src="images/imageboard/<%= filenames.get(0).toString() %>.jpg"></div>
			<hr>
			<div>내용</div>
			<div><%= boardContent %></div>
			<hr>
			<div>상품 내용</div>
			<div></div>
			<hr>
			<div>거래 희망 지역</div>
			<div>
			<form action="deleteComment" method="post">
			<table border="1" width="450">
				<%
					CommentDTO DTO = new CommentDTO();
					CommentDAO commentDAO = new CommentDAO();
					ArrayList<CommentDTO> arr = commentDAO.commentList(boardID);
					if(arr.isEmpty()){
						out.println("<tr><th>댓글이 아직 없습니다</th></tr>");
					}else{
						for(int i =0; i<arr.size();i++){
							
							if(session.getAttribute("nickname").equals(arr.get(i).getCommentUser())==true){
								out.println("<tr>"+"<td>"+arr.get(i).getCommentUser()+"</td>");
								out.println("<td>"+arr.get(i).getCommentContent()+"</td>");
								out.println("<td>"+arr.get(i).getCommentDate()+"</td>");
								out.println("<td><input type='submit' value='삭제'></td>");
								out.println("</tr>");
								DTO = arr.get(i);
							}else if(session.getAttribute("nickname").equals(arr.get(i).getCommentUser())==false){
								out.println("<tr>"+"<td>"+arr.get(i).getCommentUser()+"</td>");
								out.println("<td>"+arr.get(i).getCommentContent()+"</td>");
								out.println("<td>"+arr.get(i).getCommentDate()+"</td>");
								out.println("</tr>");
							}
							}
					}
				%>
			</table>
			</form>
				<form action="insertComment" method="get">
					<div class = "comment_content">
						<input type="hidden" name="boardID" value=<%= boardID%>>
						<textarea name="comment_text" placeholder="게시자한테 하고 싶은 말을 입력해주세요"></textarea>
						<input type="submit" value="보내기">
					</div>
				</form>
			</div>
		</main>
		<footer> <%@ include file="footer.jsp"%> </footer>
	</div>
</body>
</html>