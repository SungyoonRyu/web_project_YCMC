<%@ page language="java" contentType="text/html;charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@ page import="User.userDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="user" class="User.userDTO" scope="page"/>
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
        userDAO userDAO = new userDAO();
        int loginOk = userDAO.login(user.getUserID(),user.getUserPassword());
        PrintWriter script = response.getWriter();
        if(loginOk == 1){
            script.println("<script>");
            script.println("alert('로그인 성공')");
            script.println("</script>");

        }
        else if(loginOk == 0){
            script.println("<script>");
            script.println("alert('비밀번호 없음)");
            script.println("</script>");

        }
        else if(loginOk ==-2){
            script.println("<script>");
            script.println("alert('db오류')");
            script.println("</script>");
            response.sendRedirect("doLogin.jsp");
        }
        else if(loginOk == -1){
            script.println("<script>");
            script.println("alert('아이디가 없음')");
            script.println("</script>");

        }
    %>
</body>
</html>