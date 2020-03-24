/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.GenericDao;
import dao.IGeneric;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.Job;
import models.Department;

/**
 *
 * @author JOE
 */
public class EmployeeServlet extends HttpServlet {

    IGeneric<Employee> generic = new GenericDao();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CountryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<script>alert('You clicked the button!')</script>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getQueryString()) {
            case "save":
                save(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                response.sendRedirect(request.getServletContext().getContextPath() + "/employeeview.jsp");
                break;
        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Date toDate(String date) throws ParseException {
        DateFormat df = new SimpleDateFormat("YYYY-MM-DD");
        java.util.Date date1 = df.parse(date);
        java.sql.Date sqldate = new java.sql.Date(date1.getTime());
        return sqldate;
    }

    public boolean confirm(String id) {
        return (generic.manageData(new Employee(), "employeeId", id, "", false, false) != null);
    }

      public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String hiredate = request.getParameter("hireDate");
        String job = request.getParameter("job");
        String salary = request.getParameter("phone");
        String comm = request.getParameter("comm");
        String manager = request.getParameter("manager");
        String department = request.getParameter("department");
        try {
            generic.manageData(new Employee(new Integer(id), firstname, lastname, email,
                    phone, toDate(hiredate), (new Job(job)), new BigDecimal(salary), new BigDecimal(comm),
                    (new Employee(new Integer(manager))), new Department(new Short(department))), "", "",
                    0, true, false);
            alert(request, response, "Data has been saved");
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        System.out.println(id);
        generic.manageData(new Employee(new Integer(id)), "", "", new Integer(id), true, true);
        alert(request, response, "Data has been deleted");

    }

    public void alert(HttpServletRequest request, HttpServletResponse response, String msg) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function () {");
        out.println("swal ( '" + msg + "' ,  ' ' ,  'success' ).then(function() {\n"
                + "    window.location = 'employeeview.jsp';\n"
                + "});");
        out.println("$  });");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("/employeeview.jsp");
        rd.include(request, response);
    }
}
