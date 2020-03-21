<%-- 
    Document   : departmentview
    Created on : Mar 15, 2020, 11:10:22 PM
    Author     : JOE
--%>

<%@page import="dao.IGeneric"%>
<%@page import="models.Location"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Department" %>
<%@page import="models.Employee"%>
<%@page import="dao.GenericDao" %>
<% IGeneric<Department> department = new GenericDao<>(); %>
<% IGeneric<Employee> manager = new GenericDao<>(); %>
<% IGeneric<Location> location = new GenericDao<>(); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Department Page</title>
    </head>
    <body>
        <div class="container" style="padding-top: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insert" style="float: right"><i class="fa fa-save"></i> Insert Data</button>
            <table id="example" class="table table-responsive-xl table-bordered table-hover" style="align-content: center; text-align: center">
                <thead>
                    <tr>
                        <th>Department Id</th>
                        <th>Department Name</th>
                        <th>Manager</th>
                        <th>Location</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Department d : department.manageData(new Department(), "departmentName", "", "", false, true)) {%>
                    <tr>
                        <td class="id"><%= d.getDepartmentId()%></td>
                        <td class="name"><%= d.getDepartmentName()%></td>
                        <td class="manager"><%= (d.getManagerId() == null) ? "-" : d.getManagerId().getLastName()%></td>
                        <td class="location"><%= (d.getLocationId() == null) ? "-" : d.getLocationId().getCity()%></td>
                        <td><a data-target="#update" data-toggle="modal" type="button" class="btn confirm" style="color: blue;"><i class="fa fa-edit"></i></a>
                            <a data-target="#delete" data-toggle="modal" type="button" class="btn confirm" style="color: red;"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <% };%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- The Modal Insert -->
    <form action="${pageContext.servletContext.contextPath}/departmentservlet?save" method="post" class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Insert</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Department Id</label>
                    <input type="text" id="departmentid" name="id" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">Department Name</label>
                    <input type="text" id="departmentname" name="name" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form3">Manager</label>
                    <select name="manager" id="departmentmanager" class="manager custom-select custom-select-lg mb-3 mdb-select">
                        <option value="" disabled selected=>Select Manager</option>
                        <% for (Employee em : manager.manageData(new Employee(), "lastName", "", "", false, true)) {%>
                        <option value="<%= em.getEmployeeId()%>"><%=em.getLastName()%></option>
                        <% };%>
                    </select>

                    <label data-error="wrong" data-success="right" for="form4">Location</label>
                    <select name="location" id="departmentlocation" class="location custom-select custom-select-lg mb-3 mdb-select">
                        <option value="" disabled selected=>Select Location</option>
                        <% for (Location l : location.manageData(new Location(), "city", "", "", false, true)) {%>
                        <option value="<%= l.getLocationId()%>"><%=l.getCity()%></option>
                        <% };%>
                    </select>
                    <div style="text-align: right; padding-top: 5px;">
                        <button class="btn btn-success" type="submit">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Update -->
    <form action="${pageContext.servletContext.contextPath}/departmentservlet?save" method="post" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Update</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Department Id</label>
                    <input type="text" readonly id="id" name="id" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">Department Name</label>
                    <input type="text" id="name" name="name" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form3">Manager</label>
                    <select name="manager" id="manager" class="manager custom-select custom-select-lg mb-3 mdb-select">
                        <% for (Employee em : manager.manageData(new Employee(), "lastName", "", "", false, true)) {%>
                        <option value="<%= em.getEmployeeId()%>"><%=em.getLastName()%></option>
                        <% };%>
                    </select>

                    <label data-error="wrong" data-success="right" for="form4">Location</label>
                    <select name="location" id="location" class="location custom-select custom-select-lg mb-3 mdb-select">
                        <% for (Location l : location.manageData(new Location(), "city", "", "", false, true)) {%>
                        <option value="<%= l.getLocationId()%>"><%=l.getCity()%></option>
                        <% };%>
                    </select>
                    <div style="text-align: right; padding-top: 5px;">
                        <button class="btn btn-success" type="submit">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Delete -->
    <form action="${pageContext.servletContext.contextPath}/departmentservlet?delete" method="post" class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Delete</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-1">
                    <label data-error="wrong" data-success="right" for="form1">Department Id</label>
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
        var manager = row.find(".manager").text();
        var location = row.find(".location").text();
        var iddelete = row.find(".id").text();
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("iddelete").value = iddelete;
        $("#manager option:contains(" + manager + ")").attr("selected", true);
        $("#location option:contains(" + location + ")").attr("selected", true);
    });
</script>
</html>