<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="comment.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title></title>
</head>
<body>
<table border="1" width="1080px">
				<%
					CommentDTO DTO = new CommentDTO();
					CommentDAO commentDAO = new CommentDAO();
					ArrayList<CommentDTO> arr = commentDAO.commentList(request.getParameter("id"));
					if(arr.isEmpty()){
						out.println("<tr><th>댓글이 아직 없습니다</th></tr>");
					}else{
						if(session.getAttribute("nickname")== null){
							for(int i =0; i<arr.size();i++){
								out.println("<tr>"+"<td>"+arr.get(i).getCommentUser()+"</td>");
								out.println("<td>"+arr.get(i).getCommentContent()+"</td>");
								out.println("<td>"+arr.get(i).getCommentDate()+"</td>");
								out.println("</tr>");
							}
						}else if(session.getAttribute("nickname")!=null){
							for(int i =0; i<arr.size();i++){
								
								if(session.getAttribute("nickname").equals(arr.get(i).getCommentUser())==true){
									out.println("<div class=''>");
									out.println("<tr>"+"<td id='commentUser"+i+"'>"+arr.get(i).getCommentUser()+"</td>");
									out.println("<td style='width:700px; font-size:23px;' id ='commentContent"+i+"'>"+arr.get(i).getCommentContent()+"</td>");
									out.println("<td id = 'CommentDate"+i+"'>"+arr.get(i).getCommentDate()+"</td>");
									out.println("<td><button id='delete"+i+"' onclick='delete_comment("+i+");'>삭제</button></td>");
									out.println("</tr>");
									out.println("</div>");
								}else if(session.getAttribute("nickname").equals(arr.get(i).getCommentUser())==false){
									out.println("<div class=''>");
									out.println("<tr>"+"<td>"+arr.get(i).getCommentUser()+"</td>");
									out.println("<td>"+arr.get(i).getCommentContent()+"</td>");
									out.println("<td colspan='2'>"+arr.get(i).getCommentDate()+"</td>");
									out.println("</tr>");
									out.println("</div>");
								}
							}
						}
						
					}
				%>
				</table>
			<div>
				<form action="insertComment" method="get">
					<div class = "comment_content">
						<input type="hidden" name="boardID" value=<%= request.getParameter("id")%>>
						<textarea name="comment_text" placeholder="게시자한테 하고 싶은 말을 입력해주세요"></textarea>
						<input type="submit" value="보내기">
					</div>
				</form>
			</div>
</body>
</html>