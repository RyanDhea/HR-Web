<%-- 
    Document   : jobview
    Created on : Mar 12, 2020, 12:43:25 AM
    Author     : JOE
--%>

<%@page import="dao.IGeneric"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Job" %>
<%@page import="dao.GenericDao" %>
<% IGeneric<Job> generic = new GenericDao<>(); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Job Page</title>
    </head>
    <body>
        <div class="container" style="padding-top: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insert" style="float: right"><i class="fa fa-save"></i> Insert Data</button>
            <table id="example" class="table table-responsive-xl table-bordered table-hover" style="align-content: center; text-align: center">
                <thead>
                    <tr>
                        <th>Job Id</th>
                        <th>Job Title</th>
                        <th>Min Salary</th>
                        <th>Max Salary</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Job job : generic.manageData(new Job(), "jobTitle", "", "", false, true)) {
                    %>
                    <tr>
                        <td class="id"><%= job.getJobId()%></td>
                        <td class="title"><%= job.getJobTitle()%></td>
                        <td class="minsalary"><%= job.getMinSalary()%></td>
                        <td class="maxsalary"><%= job.getMaxSalary()%></td>
                        <td><a data-target="#update" data-toggle="modal" type="button" class="btn confirm" style="color: blue;"><i class="fa fa-edit"></i></a>
                            <a data-target="#delete" data-toggle="modal" type="button" class="btn confirm" style="color: red;"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%};%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- The Modal Insert -->
    <form action="${pageContext.servletContext.contextPath}/jobservlet?save" method="post" class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Insert</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-3">
                        <label data-error="wrong" data-success="right" for="form1">Job Id</label>
                        <input type="text" name="id" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form2">Job Title</label>
                        <input type="text" name="title" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form3">Min Salary</label>
                        <input type="text" name="minsalary" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form4">Max Salary</label>
                        <input type="text" name="maxsalary" class="form-control validate">

                        <div style="text-align: right; padding-top: 25px;">
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Update -->
    <form action="${pageContext.servletContext.contextPath}/jobservlet?save" method="post" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Update</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-3">
                        <label data-error="wrong" data-success="right" for="form1">Job Id</label>
                        <input type="text" readonly id="id" name="id" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form2">Job Title</label>
                        <input type="text" id="title" name="title" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form3">Min Salary</label>
                        <input type="text" id="minsalary" name="minsalary" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form4">Max Salary</label>
                        <input type="text" id="maxsalary" name="maxsalary" class="form-control validate">
                    
                        <div style="text-align: right; padding-top: 25px;">
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Delete -->
    <form action="${pageContext.servletContext.contextPath}/jobservlet?delete" method="post" class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Delete</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-2">
                        <label data-error="wrong" data-success="right" for="form3">Region Id</label>
                        <input type="text" readonly id="iddelete" name="id" class="form-control validate">
                    
                        <div style="text-align: right; padding-top: 20px;">
                            <button class="btn btn-warning" type="submit">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<%@include file="footer.jsp" %>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/autofill/2.3.4/css/autoFill.bootstrap4.min.css"></script>
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            dom: '<"top"f>rt<"bottom right"p><"clear">'
        });
    });

    $(".confirm").click(function () {
        var $row = $(this).closest("tr");
        var $id = $row.find(".id").text();
        var $title = $row.find(".title").text();
        var $minsalary = $row.find(".minsalary").text();
        var $maxsalary = $row.find(".maxsalary").text();
        var $iddelete = $row.find(".id").text();
        var id = document.getElementById("id");
        var title = document.getElementById("title");
        var minsalary = document.getElementById("minsalary");
        var maxsalary = document.getElementById("maxsalary");
        var iddelete = document.getElementById("iddelete");
        id.value = $id;
        title.value = $title;
        minsalary.value = $minsalary;
        maxsalary.value = $maxsalary;
        iddelete.value = $iddelete;
    });
</script>
</html>
