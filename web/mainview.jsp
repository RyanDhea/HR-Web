<%-- 
    Document   : mainview
    Created on : Mar 18, 2020, 12:25:48 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>HR - Management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="robots" content="all,follow">
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
        <link rel="stylesheet" href="css/orionicons.css">
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <link rel="stylesheet" href="css/custom.css">
        <link rel="shortcut icon" href="img/favicon.png?3">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src='Sweet_JS/sweetalert2.js'></script><script src="sweetalert2.all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js"></script>
    </head>

    <body>
        <% String name = (String) session.getAttribute("currentSessionUser");
            if (name == null) {
                response.sendRedirect("loginview.jsp");
            }%>
        <!--<a id="alert" class="alert"></a>-->
        <!--        <script>
                    $(document).ready(function () {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'User  Login Success',
                            showConfirmButton: false,
                            timer: 1500
                        })
                    });
                </script>-->

        <div class="page-holder w-100 d-flex flex-wrap">
            <div class="container-fluid px-xl-5">
                <section class="py-5">
                    <div class="row">
                        <div class="col-xl-3 col-lg-6 mb-4 mb-xl-0"></div>
                        <div class="col-xl-6 col-lg-6 mb-4 mb-xl-0">
                            <div class="bg-white shadow roundy p-4 h-100 d-flex align-items-center justify-content-between">
                                <div class="flex-grow-1 d-flex align-items-center">
                                    <div class="dot mr-3 bg-blue"></div>
                                    <div class="text">
                                        <h6 class="mb-0">Bootcamp 34</h6><span class="text-gray">Miami</span>
                                    </div>
                                </div>
                                <div class="icon text-white bg-blue"><i class="far fa-clipboard"></i></div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 mb-4 mb-xl-0"></div>
                    </div>
                </section>
                <section class="py-5">
                    <div class="row">
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-2.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Juang Nasution</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">Business Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-6.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Ryan Dhea Pratama</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">System Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-1.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Junaidi Sarifullah</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">System Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-4.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Andreas Whildant</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">System Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-5.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Ghina Sari Dewi</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">System Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-2.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Jody Dwi Antono</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">System Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                        <div class="col-lg-12"><a href="#" class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style">
                                <div class="row">
                                    <div class="col-lg-3 d-flex align-items-center flex-column flex-lg-row text-center text-md-left"><strong class="h5 mb-0">06<sup class="smaller text-gray font-weight-normal">Feb</sup></strong><img src="img/avatar-2.jpg" alt="..." style="max-width: 3rem" class="rounded-circle mx-3 my-2 my-lg-0">
                                        <h6 class="mb-0">Amry Ramadhan Prasetya</h6>
                                    </div>
                                    <div class="col-lg-9 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                        <div class="bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">System Analyst</div>
                                        <p class="mb-0 mt-3 mt-lg-0">PT. Mitra Integrasi Informatika</p>
                                    </div>
                                </div></a></div>
                    </div>
                </section>
            </div>
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/popper.js/umd/popper.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
            <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
            <script src="js/front.js"></script>
    </body>
    <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 text-center text-md-left text-primary">
                    <p class="mb-2 mb-md-0">Ryan Dhea Pratama &copy; 2020</p>
                </div>
                <div class="col-md-6 text-center text-md-right text-gray-400">
                    <p class="mb-0">Design by <a class="external text-gray-400">Bootstrapious</a></p>
                </div>
            </div>
        </div>
    </footer>
</html>
