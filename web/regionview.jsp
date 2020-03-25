<%-- 
    Document   : region
    Created on : Mar 11, 2020, 2:52:50 PM
    Author     : JOE
--%>

<%@page import="dao.IGeneric"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="models.Region" %>
<%@page import="dao.GenericDao" %>
<% IGeneric<Region> generic = new GenericDao<>(); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Region Page</title>
    </head>
    <body>
        <div class="container" style="padding-top: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insert" style="float: right"><i class="fa fa-save"></i> Insert Data</button>
            <table id="example" class="table table-responsive-xl table-bordered table-hover" style="align-content: center; text-align: center">
                <thead>
                    <tr>
                        <th>Region Id</th>
                        <th>Region Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Region r : generic.manageData(new Region(), "regionName", "", "", false, true)) {
                    %>
                    <tr>
                        <td class="txtid"><%= r.getRegionId()%></td>
                        <td class="txtname"><%= r.getRegionName()%></td>
                        <td><abbr class="tooltipedit" data-title="Edit Data"><a data-target="#update" data-toggle="modal" type="button" class="btn confirm " style="color: blue;"><i class="fa fa-edit"></i></a></abbr>
                            <abbr class="tooltipdelete" data-title="Delete Data"><a onclick="deleteAlert(event)" type="button" class="btn confirm" style="color: red;"><i class="fa fa-trash"></i></a></abbr>
                        </tr>
                    <% };%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- The Modal Insert -->
    <form action="${pageContext.servletContext.contextPath}/regionservlet?save" method="post" class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <label data-error="wrong" data-success="right" for="form3">Region Id</label>
                        <input type="text" id="regionId" name="id" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form2">Region Name</label>
                        <input type="text" id="regionName" name="name" class="form-control validate">

                        <div style="text-align: right; padding-top: 20px;">
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Update -->
    <form action="${pageContext.servletContext.contextPath}/regionservlet?save" method="post" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <label data-error="wrong" data-success="right" for="form3">Region Id</label>
                        <input type="text" readonly id="id" name="id" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form2">Region Name</label>
                        <input type="text" id="name" name="name" class="form-control validate">

                        <div style="text-align: right; padding-top: 20px;">
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Delete -->
    <form hidden action="${pageContext.servletContext.contextPath}/regionservlet?delete" method="post" class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        var $id = $row.find(".txtid").text();
        var $name = $row.find(".txtname").text();
        var $iddelete = $row.find(".txtid").text();
        var id = document.getElementById("id");
        var name = document.getElementById("name");
        var iddelete = document.getElementById("iddelete");
        id.value = $id;
        name.value = $name;
        iddelete.value = $iddelete;
    });
</script>
</html>

