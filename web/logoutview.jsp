<%-- 
    Document   : logout
    Created on : Mar 18, 2020, 3:19:33 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("loginview.jsp");
        %>
    </body>
</html>
