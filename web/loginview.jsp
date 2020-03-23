<%-- 
    Document   : loginview
    Created on : Mar 11, 2020, 4:04:40 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="tools.BCrypt"%>
<%@page import="models.Useraccount" %>
<%@page import="dao.GenericDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.colVis.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <link rel="stylesheet" href="css/orionicons.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="shortcut icon" href="img/favicon.png?3">
    </head>
    <body>
        <div class="page-holder d-flex align-items-center">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
                        <div class="pr-lg-5"><img src="img/illustration.svg" alt="" class="img-fluid"></div>
                    </div>
                    <div class="col-lg-5 px-lg-4">
                        <h1 class="text-base text-primary text-uppercase mb-4">HR - Management Dashboard</h1>
                        <h2 class="mb-4">Welcome back!</h2>
                        <p class="text-muted">Please enter your data correctly</p>
                        <form id="loginForm" action="${pageContext.servletContext.contextPath}/userservlet?login" method="POST" class="mt-4">
                            <div class="form-group mb-4">
                                <input type="email" name="username" placeholder="Email address" class="form-control border-0 shadow form-control-lg">
                            </div>
                            <div class="form-group mb-4">
                                <input type="password" name="password" placeholder="Password" class="form-control border-0 shadow form-control-lg text-violet">
                            </div>
                            <div class="form-group mb-4">
                                <div style="text-align: right">
                                    <a data-target="#forgot" data-toggle="modal" type="button" class="btn" style="text-decoration: none; color: #007bff;">Forgot Password</a>
                                </div>
                                <div style="text-align: left">
                                    <p>Don't Have an Account? <a style="text-decoration: none;" href="registerview.jsp">Register</a></p>
                                </div>
                            </div>
                            <button type="submit" name="submit" id="submit" class="btn btn-primary shadow px-5">Log in</button>
                        </form>
                    </div>
                </div>
                <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a class="external text-gray-400">Bootstrapious</a> & Ryan Dhea Pratama</p>
            </div>
        </div>
        <!-- The Modal Forgot Password -->
        <form action="${pageContext.servletContext.contextPath}/userservlet?sendForgot" method="post" class="modal fade" id="forgot" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h4 class="modal-title w-100 font-weight-bold">Insert Your Email!</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mx-1">
                        <div class="md-form mb-1">
                            <input type="email" name="username" class="form-control validate">

                            <div style="text-align: right; padding-top: 20px;">
                                <button class="btn btn-success" type="submit">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/popper.js/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/chart.js/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>
