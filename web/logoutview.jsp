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
        <script src='Sweet_JS/sweetalert2.js'></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("loginview.jsp");
        %>
        <script>
//            $(document).ready(function () {
//            Swal.fire({
//            title: 'Are you sure?',
//                    text: "You won't be able to revert this!",
//                    icon: 'warning',
//                    showCancelButton: true,
//                    confirmButtonColor: '#3085d6',
//                    cancelButtonColor: '#d33',
//                    confirmButtonText: 'Yes, delete it!'
//            }).then((result) => {
//            if (result.value) {
//
//            }
//
//            });
//            };
        </script>
    </body>
</html>
