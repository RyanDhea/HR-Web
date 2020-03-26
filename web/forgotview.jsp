<%-- 
    Document   : forgot.jsp
    Created on : Mar 19, 2020, 1:02:20 PM
    Author     : VINTHERA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Page</title>
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
                            <form action="${pageContext.servletContext.contextPath}/userservlet?savePassword" method="post">
                                <div class="form-group">
                                    <label class="form-control-label text-uppercase">Password</label>
                                    <input type="password" placeholder="Enter password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" name="password" id="password" class="form-control">
                                    <span style="float: right; padding-right: 30px; margin-top: -25px; position: relative; z-index: 2; color: #D3D3D3;" toggle="#password" id="toggle-password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label text-uppercase">Confirm Password</label>
                                    <input type="password" name="confirm_password" id="confirm_password" placeholder="Enter Confirm Password" class="form-control">
                                    <span id="message"></span>
                                </div>
                                <div class="form-group" style="text-align: right;">       
                                    <button data-target="#choose" data-toggle="modal" type="submit"class="btn btn-warning">Set Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
                </section>
            </div>
        </div>
    </body>
    <script>
        $('#password, #confirm_password').on('keyup', function () {
            if ($('#password').val() === $('#confirm_password').val()) {
                $('#message').html('Matching').css('color', 'green');
            } else if ($('#password').val() || $('#password').val() === "") {
                $('#message').html('');
            } else {
                $('#message').html('Not Matching!').css('color', 'red');
            }
        });
        $('#toggle-password').on('mousedown', function () {
            $(this).toggleClass("fa-eye fa-eye");
            var input = $($(this).attr("toggle"));
            input.attr("type", "text");
        }).on('mouseup', function () {
            var input = $($(this).attr("toggle"));
            input.attr("type", "password");
        });
    </script>
</html>
