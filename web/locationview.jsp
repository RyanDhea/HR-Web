<%-- 
    Document   : locationview
    Created on : Mar 15, 2020, 7:20:53 PM
    Author     : JOE
--%>

<%@page import="dao.IGeneric"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Location" %>
<%@page import="models.Country" %>
<%@page import="dao.GenericDao" %>
<% IGeneric<Location> location = new GenericDao<>(); %>
<% IGeneric<Country> country = new GenericDao<>(); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Location Page</title>
    </head>
    <body>
        <div class="container" style="padding-top: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insert" style="float: right"><i class="fa fa-save"></i> Insert Data</button>
            <table id="example" class="table table-responsive-xl table-bordered table-hover" style="align-content: center; text-align: center">
                <thead>
                    <tr>
                        <th>Location Id</th>
                        <th>Address</th>
                        <th>Postal</th>
                        <th>City</th>
                        <th>Province</th>
                        <th>Country</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 13px;">
                    <% for (Location l : location.manageData(new Location(), "streetAddress", "", "", false, true)) {%>
                    <tr>
                        <td class="id"><%= l.getLocationId()%></td>
                        <td class="address"><%= l.getStreetAddress()%></td>
                        <td class="postal"><%= l.getPostalCode()%></td>
                        <td class="city"><%= l.getCity()%></td>
                        <td class="province"><%= (l.getStateProvince() == null) ? "-" : l.getStateProvince()%></td>
                        <td class="country"><%= (l.getCountryId() == null) ? "-" : l.getCountryId().getCountryName()%></td>
                        <td><a data-target="#update" data-toggle="modal" type="button" class="btn confirm" style="color: blue;"><i class="fa fa-edit"></i></a>
                            <a data-target="#delete" data-toggle="modal" type="button" class="btn confirm" style="color: red;"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <% }; %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- The Modal Insert -->
    <form action="${pageContext.servletContext.contextPath}/locationservlet?save" method="post" class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <label data-error="wrong" data-success="right" for="form1">Location Id</label>
                        <input type="text" id="locationId" name="id" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form2">Street Address</label>
                        <input type="text" id="locationaddress" name="address" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form3">Postal Code</label>
                        <input type="text" id="locationpostalcode" name="postal" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form4">City</label>
                        <input type="text" id="locationcity" name="city" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form5">Province</label>
                        <input type="text" id="locationprovince" name="province" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form6">Country</label>
                        <select name="country" id="cBox" class="custom-select custom-select-lg mb-3 mdb-select">
                            <option value="" disabled selected=>Select Country</option>
                            <% for (Country co : country.manageData(new Country(), "countryName", "", "", false, true)) {%>
                            <option value="<%= co.getCountryId()%>"><%= co.getCountryName()%></option>
                            <% };%>
                        </select>
                        <div style="text-align: right; padding-top: 10px;">
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Update -->
    <form action="${pageContext.servletContext.contextPath}/locationservlet?save" method="post" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <label data-error="wrong" data-success="right" for="form1">Location Id</label>
                        <input type="text" readonly id="id" name="id" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form2">Street Address</label>
                        <input type="text" id="address" name="address" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form3">Postal Code</label>
                        <input type="text" id="postal" name="postal" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form4">City</label>
                        <input type="text" id="city" name="city" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form5">Province</label>
                        <input type="text" id="province" name="province" class="form-control validate">

                        <label data-error="wrong" data-success="right" for="form6">Country</label>
                        <select name="country" id="country" class="country custom-select custom-select-lg mb-3 mdb-select">
                            <% for (Country co : country.manageData(new Country(), "countryName", "", "", false, true)) {%>
                            <option value="<%= co.getCountryId()%>"><%=co.getCountryName()%></option>
                            <% };%>
                        </select>
                        <div style="text-align: right; padding-top: 10px;">
                            <button class="btn btn-success" type="submit">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Delete -->
    <form action="${pageContext.servletContext.contextPath}/locationservlet?delete" method="post" class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <button onclick="deleteAlert(event)" class="btn btn-warning" type="submit">Delete</button>
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
        var address = row.find(".address").text();
        var postal = row.find(".postal").text();
        var city = row.find(".city").text();
        var province = row.find(".province").text();
        var iddelete = row.find(".id").text();
        var country = row.find(".country").text();
        document.getElementById("id").value = id;
        document.getElementById("address").value = address;
        document.getElementById("postal").value = postal;
        document.getElementById("city").value = city;
        document.getElementById("province").value = province;
        document.getElementById("iddelete").value = iddelete;
        $("#country option:contains(" + country + ")").attr("selected", true);
    });
</script>
</html>