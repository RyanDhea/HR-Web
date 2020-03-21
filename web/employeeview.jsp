<%-- 
    Document   : employeejsp
    Created on : Mar 15, 2020, 11:54:50 PM
    Author     : JOE
--%>

<%@page import="dao.IGeneric"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Employee" %>
<%@page import="models.Job"%>
<%@page import="models.Department"%>
<%@page import="dao.GenericDao" %>
<% IGeneric<Employee> employee = new GenericDao<>(); %>
<% IGeneric<Job> job = new GenericDao<>(); %>
<% IGeneric<Department> department = new GenericDao<>(); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Employee Page</title>
    </head>
    <style>
        input {
            position: relative;
            color: black;
        }

        input:before {
            position: absolute;
            content: attr(data-date);
            color: black;
        }

        input::-webkit-datetime-edit, input::-webkit-inner-spin-button, input::-webkit-clear-button {
            display: none;
        }

        input::-webkit-calendar-picker-indicator {
            position: absolute;
            top: 3px;
            right: 0;
            color: black;
            opacity: 1;
        }
    </style>
    <body>
        <div class="container" style="padding-top: 20px;">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#insert" style="float: right"><i class="fa fa-save"></i> Insert Data</button>
            <table id="example" class="table table-responsive-xl table-bordered table-hover" style="align-content: center; text-align: center">
                <thead>
                    <tr style="font-size: 13px; font-style: inherit">
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Hire Date</th>
                        <th>Job</th>
                        <th>Salary</th>
                        <th>Comm</th>
                        <th>Manager</th>
                        <th>Department</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody style="font-size: 11px;">
                    <% for (Employee e : employee.manageData(new Employee(), "lastName", "", "", false, true)) {%>
                    <tr>
                        <td class="id"><%= e.getEmployeeId()%></td>
                        <td class="firstname"><%= e.getFirstName()%></td>
                        <td class="lastname"><%= e.getLastName()%></td>
                        <td class="email"><%= e.getEmail()%></td>
                        <td class="phone"><%= e.getPhoneNumber()%></td>
                        <% SimpleDateFormat hire = new SimpleDateFormat("YYYY-MM-dd");%>
                        <td class="hire"><%= hire.format(e.getHireDate())%></td>
                        <td class="job"><%= (e.getJobId() == null) ? "-" : e.getJobId().getJobTitle()%></td>
                        <td class="salary"><%= e.getSalary()%></td>
                        <td class="comm"><%= (e.getCommissionPct() == null) ? "-" : e.getCommissionPct()%></td></td>
                        <td class="manager"><%= (e.getManagerId() == null) ? "-" : e.getManagerId().getLastName()%></td>
                        <td class="department"><%= (e.getDepartmentId() == null) ? "-" : e.getDepartmentId().getDepartmentName()%></td>
                        <td><a data-target="#view" data-toggle="modal" type="button" class="btn confirm" style="color: #ffc107;"><i class="fa fa-eye"></i></a>
                            <a data-target="#update" data-toggle="modal" type="button" class="btn confirm" style="color: blue;"><i class="fa fa-edit"></i></a>
                            <a data-target="#delete" data-toggle="modal" type="button" class="btn confirm" style="color: red;"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <% };%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- The Modal View -->
    <form action="${pageContext.servletContext.contextPath}/employeeservlet?save" method="post" class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">View Data</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-5">
                    <label data-error="wrong" data-success="right" for="form1">Employee Id</label>
                    <input type="text" readonly id="employeeId" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">First Name</label>
                    <input type="text" readonly id="employeeFirstName" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form3">Last Name</label>
                    <input type="text" readonly id="employeeLastName" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form4">Email</label>
                    <input type="text" readonly id="employeeEmail" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form5">Phone Number</label>
                    <input type="text" readonly id="employeePhone" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form6">Hire Date</label>
                    <input type="text" readonly id="employeeHire" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form7">Job</label>
                    <input type="text" readonly id="employeeJob" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form8">Salary</label>
                    <input type="text" readonly id="employeeSalary" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form9">Commission</label>
                    <input type="text" readonly id="employeeComm" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form10">Manager</label>
                    <input type="text" readonly id="employeeManager" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form11">Department</label>
                    <input type="text" readonly id="employeeDepartment" class="form-control validate">
                </div>
            </div>
        </div>
    </form>

    <!-- The Modal Insert -->
    <form action="${pageContext.servletContext.contextPath}/employeeservlet?save" method="post" class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Insert</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Employee Id</label>
                    <input type="text" name="id" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">First Name</label>
                    <input type="text" name="firstname" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form3">Last Name</label>
                    <input type="text" name="lastname" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form4">Email</label>
                    <input type="text" name="email" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form5">Phone Number</label>
                    <input type="text" name="phone" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form6">Hire Date</label>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js" ></script>
                    <input id="hireDate" type="Date" name="hireDate" aria-label="hireDate" data-date="" data-date-format="MM/DD/YYYY" value=""  aria-describedby="addon-wrapping" class="form-control" style="width: 100%"/>

                    <label data-error="wrong" data-success="right" for="form7">Job</label>
                    <select name="job" class="job custom-select custom-select-lg mb-3 mdb-select">
                        <option value="" disabled selected=>Select Job</option>
                        <% for (Job j : job.manageData(new Job(), "jobTitle", "", "", false, true)) {%>
                        <option value="<%= j.getJobId()%>"><%=j.getJobTitle()%></option>
                        <% };%>
                    </select>

                    <label data-error="wrong" data-success="right" for="form8">Salary</label>
                    <input type="text" name="salary" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form9">Commission</label>
                    <input type="text" name="comm" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form10">Manager</label>
                    <select name="manager" class="custom-select custom-select-lg mb-3 mdb-select">
                        <option value="" disabled selected=>Select Manager</option>
                        <% for (Employee e : employee.manageData(new Employee(), "lastName", "", "", false, true)) {%>
                        <option value="<%= e.getEmployeeId()%>"><%=e.getLastName()%></option>
                        <% };%>
                    </select>

                    <label data-error="wrong" data-success="right" for="form11">Department</label>
                    <select name="department" class="custom-select custom-select-lg mb-3 mdb-select">
                        <option value="" disabled selected=>Select Department</option>
                        <% for (Department d : department.manageData(new Department(), "departmentName", "", "", false, true)) {%>
                        <option value="<%= d.getDepartmentId()%>"><%=d.getDepartmentName()%></option>
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
    <form action="${pageContext.servletContext.contextPath}/employeeservlet?save" method="post" class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Update</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 md-form mb-2">
                    <label data-error="wrong" data-success="right" for="form1">Employee Id</label>
                    <input type="text" readonly id="id" name="id" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form2">First Name</label>
                    <input type="text" id="firstname" name="firstname" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form3">Last Name</label>
                    <input type="text" id="lastname" name="lastname" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form4">Email</label>
                    <input type="text" id="email" name="email" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form5">Phone Number</label>
                    <input type="text" id="phone" name="phone" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form6">Hire Date</label>
                    <input id="hire" type="Date" name="hireDate" aria-label="hireDate" data-date="" data-date-format="MM/DD/YY" value="2020-12-05"  aria-describedby="addon-wrapping" class="form-control">

                    <label data-error="wrong" data-success="right" for="form7">Job</label>
                    <select name="job" id="job" class="custom-select custom-select-lg mb-3 mdb-select">
                        <% for (Job j : job.manageData(new Job(), "jobTitle", "", "", false, true)) {%>
                        <option value="<%= j.getJobId()%>"><%=j.getJobTitle()%></option>
                        <% };%>
                    </select>

                    <label data-error="wrong" data-success="right" for="form8">Salary</label>
                    <input type="text" id="salary" name="salary" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form9">Commission</label>
                    <input type="text" id="comm" name="comm" class="form-control validate">

                    <label data-error="wrong" data-success="right" for="form10">Manager</label>
                    <select name="manager" id="manager" class="custom-select custom-select-lg mb-3 mdb-select">
                        <% for (Employee e : employee.manageData(new Employee(), "lastName", "", "", false, true)) {%>
                        <option value="<%= e.getEmployeeId()%>"><%=e.getLastName()%></option>
                        <% };%>
                    </select>

                    <label data-error="wrong" data-success="right" for="form11">Department</label>
                    <select name="department" id="department" class="custom-select custom-select-lg mb-3 mdb-select">
                        <% for (Department d : department.manageData(new Department(), "departmentName", "", "", false, true)) {%>
                        <option value="<%= d.getDepartmentId()%>"><%=d.getDepartmentName()%></option>
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
    <form action="${pageContext.servletContext.contextPath}/employeeservlet?delete" method="post" class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Delete</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-1">
                        <label data-error="wrong" data-success="right" for="form3">Employee Id</label>
                        <input type="text" readonly id="iddelete" name="id" class="form-control validate">

                        <div style="text-align: right; padding-top: 15px;">
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

    $("#hireDate").on("change", function () {
        this.setAttribute(
                "data-date",
                moment(this.value, "YYYY-MM-DD")
                .format(this.getAttribute("data-date-format"))
                );
    }).trigger("change");

    $(".confirm").click(function () {
        var row = $(this).closest("tr");
        var id = row.find(".id").text();
        var firstname = row.find(".firstname").text();
        var lastname = row.find(".lastname").text();
        var email = row.find(".email").text();
        var phone = row.find(".phone").text();
        var hiredate = row.find(".hire").text();
        var job = row.find(".job").text();
        var salary = row.find(".salary").text();
        var comm = row.find(".comm").text();
        var manager = row.find(".manager").text();
        var department = row.find(".department").text();
        document.getElementById("employeeId").value = id;
        document.getElementById("employeeFirstName").value = firstname;
        document.getElementById("employeeLastName").value = lastname;
        document.getElementById("employeeEmail").value = email;
        document.getElementById("employeePhone").value = phone;
        document.getElementById("employeeHire").value = hiredate;
        document.getElementById("employeeJob").value = job;
        document.getElementById("employeeSalary").value = salary;
        document.getElementById("employeeComm").value = comm;
        document.getElementById("employeeManager").value = manager;
        document.getElementById("employeeDepartment").value = department;

        document.getElementById("id").value = id;
        document.getElementById("firstname").value = firstname;
        document.getElementById("lastname").value = lastname;
        document.getElementById("email").value = email;
        document.getElementById("phone").value = phone;
        document.getElementById("hireDate").value = hiredate;
        document.getElementById("hire").value = hiredate;
        $("#job option:contains(" + job + ")").attr("selected", true);
        document.getElementById("salary").value = salary;
        document.getElementById("comm").value = comm;
        $("#manager option:contains(" + manager + ")").attr("selected", true);
        $("#department option:contains(" + department + ")").attr("selected", true);
        document.getElementById("iddelete").value = id;
    });
</script>
</html>