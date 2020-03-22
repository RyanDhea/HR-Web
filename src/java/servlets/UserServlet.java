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
import java.util.List;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Useraccount;
import tools.BCrypt;

/**
 *
 * @author JOE
 */
public class UserServlet extends HttpServlet {

    List<Useraccount> listUser;
    IGeneric<Useraccount> generic = new GenericDao();

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
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<script>alert('Success!')</script>");
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
            case "login":
                login(request, response);
                break;
            case "sendForgot":
                sendForgot(request, response);
                break;
            case "sendConfirm":
                sendConfirm(request, response);
                break;
            case "save":
                save(request, response);
                break;
            case "savePassword":
                savePassword(request, response);
                break;
            default:
                response.sendRedirect(request.getServletContext().getContextPath() + "/regionview.jsp");
                break;
        }
//        processRequest(request, response);
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

    public String getPassword(String username) {
        listUser = generic.manageData(new Useraccount(), "username", username, new String(), false, false);
        if (listUser.isEmpty()) {
            return "failed";
        }
        return listUser.get(0).getPassword();
    }

    public boolean getUsername(String username) {
        listUser = generic.manageData(new Useraccount(), "username", username, new String(), false, false);
        return listUser != null;
    }

    public boolean getStatus(String username) {
        listUser = generic.manageData(new Useraccount(), "username", username, new String(), false, false);
        if (listUser.get(0).getStatus() == 'N') {
            return false;
        } else {
            return true;
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        System.out.println(getUsername(username));
        try {
            if (username.isEmpty() || password.isEmpty()) {
                errorAlert(request, response, "field cannot empty");
            } else {
                if (!getUsername(username)) {
                    errorAlert(request, response, "email not found");
                } else {
                    if (!BCrypt.checkpw(password, getPassword(username))) {
                        errorAlert(request, response, "wrong password");
                    } else {
                        if (!getStatus(username)) {
                            errorAlert(request, response, "account not activated");
                        } else {
                            HttpSession session = request.getSession();
                            session.setAttribute("currentSessionUser", username);
                            response.sendRedirect("mainview.jsp");
                        }
                    }
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void errorAlert(HttpServletRequest request, HttpServletResponse response, String msg) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function () {");
        out.println("swal ( '" + msg + "' ,  ' ' ,  'error' ).then(function() {\n"
                + "    window.location = 'loginview.jsp';\n"
                + "});");
        out.println("$  });");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("/loginview.jsp");
        rd.include(request, response);
    }

    public static void send(String from, String password, String to, String sub, String msg, String filename) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        //get Session   
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Address address = new InternetAddress(from);
            message.setFrom(address);
            message.setSubject(sub);
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(msg);
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            messageBodyPart = new MimeBodyPart();
            messageBodyPart.setDataHandler(new DataHandler(new FileDataSource(filename)));
            multipart.addBodyPart(messageBodyPart);
            message.setContent(multipart);
            //send message

            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendForgot(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        if (getUsername(username)) {
            String htmlFile = "D:\\kerja online\\templateResetPassword.html";
            String message = "click to reset password : " + "http://localhost:8084/HR-Web/forgotview.jsp?username=" + username;
            send("bootcamp34mii@gmail.com", "Bootcamp34", username, "reset password", message, htmlFile);
            response.sendRedirect("loginview.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function () {");
            out.println("swal ( 'Email not found' ,  ' ' ,  'error' ).then(function() {\n"
                    + "    window.location = 'loginview.jsp';\n"
                    + "});");
            out.println("$  });");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("/loginview.jsp");
            rd.include(request, response);
        }
    }

    public void sendConfirm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        System.out.println(username);
        String password = request.getParameter("password");
        if (username.isEmpty() || password.isEmpty()) {
            PrintWriter out = response.getWriter();
            out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function () {");
            out.println("swal ( 'Field cannot Empty' ,  ' ' ,  'error' ).then(function() {\n"
                    + "    window.location = 'registerview.jsp';\n"
                    + "});");
            out.println("$  });");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("/registerview.jsp");
            rd.include(request, response);
        } else if (getUsername(username)) {
            PrintWriter out = response.getWriter();
            out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function () {");
            out.println("swal ( 'Username has already' ,  ' ' ,  'error' ).then(function() {\n"
                    + "    window.location = 'registerview.jsp';\n"
                    + "});");
            out.println("$  });");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("/registerview.jsp");
            rd.include(request, response);
        } else {
            String htmlFile = "D:\\METRODATA\\Tugas\\HR-Web\\web\\templateRegister.html";
            String message = "click to confirm account : " + "http://localhost:8084/HR-Web/confirmview.jsp?username=" + username;
            send("bootcamp34mii@gmail.com", "Bootcamp34", username, "reset password", message, htmlFile);
            response.sendRedirect("registerview.jsp");
            String pw_hash = BCrypt.hashpw(password, BCrypt.gensalt());
            generic.manageData(new Useraccount(username, pw_hash, 'N'), "", "", new String(), true, false);
            PrintWriter out = response.getWriter();
            out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function () {");
            out.println("swal ( 'Please check your email for confirm account' ,  ' ' ,  'success' ).then(function() {\n"
                    + "    window.location = 'registerview.jsp';\n"
                    + "});");
            out.println("$  });");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("/registerview.jsp");
            rd.include(request, response);
        }
    }

    public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        generic.manageData(new Useraccount(username, getPassword(username), 'Y'), "", "", new String(), true, false);
        response.sendRedirect("loginview.jsp");
    }

    public void savePassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String pw_hash = BCrypt.hashpw(password, BCrypt.gensalt());
        generic.manageData(new Useraccount(username, pw_hash, 'Y'), "", "", new String(), true, false);
        response.sendRedirect("loginview.jsp");
    }
}
