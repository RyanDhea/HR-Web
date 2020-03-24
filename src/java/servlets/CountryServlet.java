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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Country;
import models.Region;

/**
 *
 * @author JOE
 */
public class CountryServlet extends HttpServlet {

    IGeneric<Country> generic = new GenericDao();

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
            out.println("<h1>Servlet CountryServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
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
                response.sendRedirect(request.getServletContext().getContextPath() + "/countryview.jsp");
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

    public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String region = request.getParameter("region");
        generic.manageData(new Country(id, name, new Region(new BigDecimal(region))), "", "", new String(), true, false);
        alert(request, response, "Data has been saved");

    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        generic.manageData(new Country(id), "", "", id, true, true);
        alert(request, response, "Data has been deleted");

    }

    public void alert(HttpServletRequest request, HttpServletResponse response, String msg) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function () {");
        out.println("swal ( '" + msg + "' ,  ' ' ,  'success' ).then(function() {\n"
                + "    window.location = 'countryview.jsp';\n"
                + "});");
        out.println("$  });");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("/countryview.jsp");
        rd.include(request, response);
    }

    public void confrimAlert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function () {");
        out.println("$(\"#delete\").submit(swal({\n" +
"                title: \"sure want to delete ?\",\n" +
"                text: \"\",\n" +
"                type: \"question\",\n" +
"                showCancelButton: true,\n" +
"                confirmButtonColor: \"#34E076\",\n" +
"                confirmButtonText: 'Yes, delete it!',\n" +
"                cancelButtonText: 'No, keep it'\n" +
"            }\n" +
"            ).then(function (result) {\n" +
"                setTimeout(function () {\n" +
"                    var formz = document.getElementById(\"delete\");\n" +
"                    formz.submit();\n" +
"                }, 30);\n" +
"            }));\n");
//        delete(request, response);
        out.println("  }\n");
        out.println( ")");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("/countryview.jsp");
        rd.include(request, response);
    }
}
