<%-- 
    Document   : profileview.jsp
    Created on : Mar 19, 2020, 8:42:28 PM
    Author     : JOE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="page-holder w-100 d-flex flex-wrap">
            <div class="container">
                <section class="py-5">
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <!-- Basic Form-->
                        <div class="col-lg-6 mb-5">
                            <div class="card">
                                <div class="card-header text-center">
                                    <img src="img/avatar-6.jpg" alt="Avatar" style="max-width: 30rem;" class="img-fluid rounded-circle shadow">
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group text-center">       
                                            <label class="form-control-label text-uppercase">Username</label>
                                            <input type="text" readonly value="Joe" class="form-control">
                                        </div>
                                        <div class="form-group text-center">
                                            <label class="form-control-label text-uppercase">Email</label>
                                            <input type="text" readonly value="<%= session.getAttribute("currentSessionUser")%>" class="form-control">
                                        </div>
                                        <div class="form-group" style="text-align: right;">       
                                            <button data-target="#choose" data-toggle="modal" type="button" class="btn btn-warning">Choose Password</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3"></div>
                    </div>
                </section>
            </div>

            <form action="${pageContext.servletContext.contextPath}/userservlet?sendForgot" method="post" class="modal fade" id="choose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title w-100 font-weight-bold">Insert Email</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3 md-form mb-2">
                            <input type="email" id="email" value="<%= session.getAttribute("currentSessionUser")%>" name="username" class="form-control validate">
                            <div style="text-align: right; padding-top: 10px;">
                                <button class="btn btn-success" type="submit">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
    </body>
    <%@include file="footer.jsp" %>
</html>
