<%-- 
    Document   : confirmview
    Created on : Mar 21, 2020, 7:20:47 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Page</title>
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <link rel="stylesheet" href="css/orionicons.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <link rel="stylesheet" href="css/custom.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <link rel="shortcut icon" href="img/favicon.png?3">
    </head>
    <body>
        <div class="page-holder w-100 d-flex flex-wrap">
            <div class="container py-4">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6 mb-4">
                        <div class="card card-body">
                            <form action="${pageContext.servletContext.contextPath}/userservlet?save" method="post">
                                <div class="form-group">       
                                    <label class="form-control-label text-uppercase">Username</label>
                                    <input type="text" readonly value="<%= request.getParameter("username")%>" name="username" id="username" class="form-control">
                                </div>

                                <div class="form-group" style="text-align: right;">
                                    <button data-target="#choose" data-toggle="modal" type="submit"class="btn btn-success">Confirm</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
