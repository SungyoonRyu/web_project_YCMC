<%@ page language="java" contentType="text/html;charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ page import="user.UserDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="user" class="user.UserDTO" scope="page"/>
 <jsp:setProperty property="userID" name="user"/>
 <jsp:setProperty property="userPassword" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset ="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    	session.invalidate();
    	response.sendRedirect("main.jsp");
    %>
</body>
</html>