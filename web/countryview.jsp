<%-- 
    Document   : countryview
    Created on : Mar 15, 2020, 2:32:26 PM
    Author     : JOE
--%>

<%@page import="dao.IGeneric"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Country" %>
<%@page import="models.Region"%>
<%@page import="dao.GenericDao" %>
<% IGeneric<Country> country = new GenericDao<>(); %>
<% IGeneric<Region> region = new GenericDao<>(); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Country Page</title>
    </head>
    <body>
        <div class="container" style="padding-top: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insert" style="float: right"><i class="fa fa-save"></i> Insert Data</button>
            <table id="example" class="table table-responsive-xl table-bordered table-hover" style="align-content: center; text-align: center">
                <thead>
                    <tr>
                        <th>Country Id</th>
                        <th>Country Name</th>
                        <th>Region</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Country c : country.manageData(new Country(), "countryName", "", "", false, true)) {%>
                    <tr>
                        <td class="id"><%= c.getCountryId()%></td>
                        <td class="name"><%= c.getCountryName()%></td>
                        <td class="region"><%= c.getRegionId().getRegionName()%></td>
                        <td><a data-target="#update" data-toggle="modal" type="button" class="btn confirm" style="color: blue;"><i class="fa fa-edit"></i></a>
                            <a onclick="deleteAlert(event)" type="button" class="btn confirm" style="color: red;"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <% };%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- The Modal Insert -->
    <form action="${pageContext.servletContext.contextPath}/countryservlet?save" method="post" class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Insert</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Country Id</label>
                    <input type="text" id="countryId" name="id" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">Country Name</label>
                    <input type="text" id="countryName" name="name" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">Region</label>
                    <select name="region" id="cBox" class="custom-select custom-select-lg mb-3 mdb-select">
                        <option value="" disabled selected=>Select Region</option>
                        <% for (Region r : region.manageData(new Region(), "regionName", "", "", false, true)) {%>
                        <option value="<%= r.getRegionId()%>"><%= r.getRegionName()%></option>
                        <% };%>
                    </select>
                    <div style="text-align: right; padding-top: 10px;">
                        <button class="btn btn-success" type="submit">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Update -->
    <form action="${pageContext.servletContext.contextPath}/countryservlet?save" method="post" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Update</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Country Id</label>
                    <input type="text" readonly id="id" name="id" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">Country Name</label>
                    <input type="text" id="name" name="name" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">Region</label>
                    <select name="region" id="region" class="region custom-select custom-select-lg mb-3 mdb-select">
                        <% for (Region r : region.manageData(new Region(), "regionName", "", "", false, true)) {%>
                        <option value="<%= r.getRegionId()%>"><%=r.getRegionName()%></option>
                        <% };%>
                    </select>
                    <div style="text-align: right; padding-top: 10px;">
                        <button class="btn btn-success" type="submit">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Delete -->
    <form hidden action="${pageContext.servletContext.contextPath}/countryservlet?delete" method="post"  id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Delete</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Country Id</label>
                    <input type="text" readonly id="iddelete" name="id" class="form-control validate">

                    <div style="text-align: right; padding-top: 20px;">
                        <button class="btn btn-warning" type="submit">Delete</button>
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
        var row = $(this).closest("tr");
        var id = row.find(".id").text();
        var name = row.find(".name").text();
        var iddelete = row.find(".id").text();
        var region = row.find(".region").text();
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("iddelete").value = iddelete;
        $("#region option:contains(" + region + ")").attr("selected", true);
    });
    
</script>
</html>