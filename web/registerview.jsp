<%-- 
    Document   : registerview
    Created on : Mar 19, 2020, 11:12:40 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <link rel="stylesheet" href="css/orionicons.css">
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js" ></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="shortcut icon" href="img/favicon.png?3">
        <style>
            input.empty {
                box-shadow: 0 0.125rem 0.8rem rgba(240, 52, 52, 0.5);
            }
        </style>
    </head>
    <body class="container">
        <div class="row" style="padding-top: 25px;">
            <div class="col-3"></div>
            <div class="col-6 px-lg-4">
                <h1 class="text-base text-primary text-uppercase mb-4">HR - Management</h1>
                <h2 class="mb-4">User Account</h2>
                <form id="loginForm" name="myForm" required action="${pageContext.servletContext.contextPath}/userservlet?verify" method="POST" class="mt-4">
                    <div class="form-group mb-4">
                        <input type="text" id="firstname" required name="firstname" pattern="\S+.*" placeholder="Firstname" class="form-control border-0 shadow form-control-lg validate">
                    </div>
                    <div class="form-group mb-4">
                        <input type="text" id="lastname" required name="lastname" pattern="\S+.*" placeholder="Lastname" class="form-control border-0 shadow form-control-lg validate">
                    </div>
                    <div class="form-group mb-4">
                        <input type="email" id="username" required name="username" placeholder="Email address" class="form-control border-0 shadow form-control-lg validate">
                    </div>
                    <div class="form-group mb-4">
                        <input type="password" onchange='check_pass();' id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" name="password" placeholder="Password" class="form-control border-0 shadow form-control-lg text-violet validate">
                        <span style="float: right; padding-right: 30px; margin-top: -30px; position: relative; z-index: 2; color: #D3D3D3;" toggle="#password" id="toggle-password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                    </div>
                    <div class="form-group mb-4">
                        <input type="password" onchange='check_pass();' id="confirm" name="confirm" placeholder="Confirm Password" class="form-control border-0 shadow form-control-lg text-violet validate">
                    </div>
                    <div class="form-group mb-4">
                        <div class="g-recaptcha validate" id="recaptcha" data-type="image" data-sitekey="6LdsNOMUAAAAABqKLZtM-SiNdA4hJQMEhE1Ik4C6"></div>
                    </div>
                    <button type="submit" name="submit" onclick="myFunction()" id="submit" disabled id="submit" class="btn btn-primary shadow px-5">Save</button>
                    <div style="text-align: right">
                        <p>Already have an account? <a style="text-decoration: none;" href="loginview.jsp">Login</a></p>
                    </div>
                </form>
            </div>
            <div class="col-3"></div>
        </div>
    </body>
    <script>
        function myFunction() {
            var nama = ["firstname", "lastname", "username"];
                    nama.forEach(test);
        }
        function test(name) {
            var element = document.getElementById(name);
            if (document.getElementById(name).value === "") {
                element.classList.remove("shadow");
                element.classList.add("empty");
            } else {
                element.classList.add("shadow");
                element.classList.remove("empty");
            }
        }
    </script>
    <script>
        $('#toggle-password').on('mousedown', function () {
            $(this).toggleClass("fa-eye fa-eye");
            var input = $($(this).attr("toggle"));
            input.attr("type", "text");
        }).on('mouseup', function () {
            var input = $($(this).attr("toggle"));
            input.attr("type", "password");
        });
        function check_pass() {
            if (document.getElementById('password').value === document.getElementById('confirm').value) {
                document.getElementById('submit').disabled = false;
            } else {
                document.getElementById('submit').disabled = true;
            }
        }
    </script>
</html>
