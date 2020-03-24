<%-- 
    Document   : header
    Created on : Mar 11, 2020, 4:41:37 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src='Sweet_JS/sweetalert2.js'></script><script src="sweetalert2.all.min.js"></script>
        <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
        <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js" ></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <link rel="stylesheet" href="css/orionicons.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="shortcut icon" href="img/favicon.png?3">
    </head>
    <style>

    </style>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a><a href="index.html" class="navbar-brand font-weight-bold text-uppercase text-base">Dashboard</a>
                <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
                    <li class="nav-item dropdown mr-3"><a id="notifications" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle text-gray-400 px-1"><i class="fa fa-bell"></i><span class="notification-icon"></span></a>
                        <div aria-labelledby="notifications" class="dropdown-menu"><a href="#" class="dropdown-item">
                                <div class="d-flex align-items-center">
                                    <div class="icon icon-sm bg-violet text-white"><i class="fab fa-instagram"></i></div>
                                    <div class="text ml-2">
                                        <p class="mb-0">You have 2 followers</p>
                                    </div>
                                </div></a><a href="#" class="dropdown-item"> 
                                <div class="d-flex align-items-center">
                                    <div class="icon icon-sm bg-green text-white"><i class="fas fa-envelope"></i></div>
                                    <div class="text ml-2">
                                        <p class="mb-0">You have 6 new messages</p>
                                    </div>
                                </div></a>
                            <div class="dropdown-divider"></div><a href="#" class="dropdown-item text-center"><small class="font-weight-bold headings-font-family text-uppercase">View all notifications</small></a>
                        </div>
                    </li>
                    <li class="nav-item dropdown ml-auto"><a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/avatar-6.jpg" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
                        <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family"><%= session.getAttribute("currentSessionUser")%></strong><small>System Analyst</small></a>
                            <div class="dropdown-divider"></div>
                            <a href="profileview.jsp" class="dropdown-item">Profile</a>
                            <a href="#" class="dropdown-item">Settings</a>
                            <a href="#" class="dropdown-item">Activity log</a>
                            <div class="dropdown-divider"></div><a href="logoutview.jsp" class="dropdown-item" onclick="cnfrm()">Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
        <div class="d-flex align-items-stretch">
            <div id="sidebar" class="sidebar py-3">
                <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN</div>
                <ul class="sidebar-menu list-unstyled">
                    <li class="sidebar-list-item"><a href="mainview.jsp" class="sidebar-link text-muted active"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
                    <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Manage</span></a>
                        <div id="pages" class="collapse">
                            <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                                <li class="sidebar-list-item"><a href="jobview.jsp" class="sidebar-link text-muted pl-lg-5">Job</a></li>
                                <li class="sidebar-list-item"><a href="regionview.jsp" class="sidebar-link text-muted pl-lg-5">Region</a></li>
                                <li class="sidebar-list-item"><a href="countryview.jsp" class="sidebar-link text-muted pl-lg-5">Country</a></li>
                                <li class="sidebar-list-item"><a href="locationview.jsp" class="sidebar-link text-muted pl-lg-5">Location</a></li>
                                <li class="sidebar-list-item"><a href="departmentview.jsp" class="sidebar-link text-muted pl-lg-5">Department</a></li>
                                <li class="sidebar-list-item"><a href="employeeview.jsp" class="sidebar-link text-muted pl-lg-5">Employee</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#report" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>Report</span></a>
                        <div id="report" class="collapse">
                            <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                                <li class="sidebar-list-item"><a href="${pageContext.servletContext.contextPath}/report?job"  target="_blank" class="sidebar-link text-muted pl-lg-5">Job</a></li>
                                <li class="sidebar-list-item"><a href="${pageContext.servletContext.contextPath}/report?region"  target="_blank" class="sidebar-link text-muted pl-lg-5">Region</a></li>
                                <li class="sidebar-list-item"><a href="${pageContext.servletContext.contextPath}/report?country"  target="_blank" class="sidebar-link text-muted pl-lg-5">Country</a></li>
                                <li class="sidebar-list-item"><a href="${pageContext.servletContext.contextPath}/report?location"  target="_blank" class="sidebar-link text-muted pl-lg-5">Location</a></li>
                                <li class="sidebar-list-item"><a href="${pageContext.servletContext.contextPath}/report?department"   target="_blank" class="sidebar-link text-muted pl-lg-5">Department</a></li>
                                <li class="sidebar-list-item"><a href="${pageContext.servletContext.contextPath}/report?employee"  target="_blank" class="sidebar-link text-muted pl-lg-5">Employee</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-list-item"><a href="" class="sidebar-link text-muted" type="submit" onclick="deleteAlert(event)" id="logout"  ><i class="o-exit-1 mr-3 text-gray" ></i><span >Logout</span></a></li>
                </ul>

            </div>
    </body>
    <script>
        $(function () {
            $("#logout").on("click", function () {
                $swal({
                    title: "sure want to logout ?",
                    text: "",
                    type: "question",
                    showCancelButton: true,
                    confirmButtonColor: "#34E076",
                    confirmButtonText: 'Yes, i am!',
                    cancelButtonText: 'No thanks'
                }
                ).then(function (result) {
                    setTimeout(function () {
                        window.location = 'logoutview.jsp';
                    }, 30);
                });

            });
        });
        function deleteAlert(event) {
            event.preventDefault();
            $("#delete").submit(swal({
                title: "sure want to delete ?",
                text: "",
                type: "question",
                showCancelButton: true,
                confirmButtonColor: "#34E076",
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, keep it'
            }
            ).then(function (result) {
                setTimeout(function () {
                    var formz = document.getElementById("delete");
                    formz.submit();
                }, 30);
            }));
        }
    </script>
</html>