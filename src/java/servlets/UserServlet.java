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
import java.io.StringWriter;
import java.util.List;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Useraccount;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import tools.BCrypt;

/**
 *
 * @author VINTHERA
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
        save(request, response);
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
            case "verify":
                verify(request, response);
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

    public String getName(String username) {
        listUser = generic.manageData(new Useraccount(), "username", username, new String(), false, false);
        return listUser.get(0).getFirstname() + " " + listUser.get(0).getLastname();
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        try {
            if (username.isEmpty() || password.isEmpty()) {
                alert(request, response, "field cannot empty", "error", "loginview.jsp");
            } else if (!getUsername(username)) {
                alert(request, response, "email not found", "error", "loginview.jsp");
            } else if (!BCrypt.checkpw(password, getPassword(username))) {
                alert(request, response, "wrong password", "error", "loginview.jsp");
            } else if (!getStatus(username)) {
                alert(request, response, "account not activated", "error", "loginview.jsp");
            } else {
                String name = getName(username);
                HttpSession session = request.getSession();
                session.setAttribute("currentSessionUser", name);
                response.sendRedirect("mainview.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void send(String from, String password, String to, String sub, String filename) {
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
            message.setContent(filename, "text/html; charset=utf-8");
//            BodyPart messageBodyPart = new MimeBodyPart();
//            messageBodyPart.setText(msg);
//            Multipart multipart = new MimeMultipart();
//            multipart.addBodyPart(messageBodyPart);
//            messageBodyPart = new MimeBodyPart();
//            messageBodyPart.setDataHandler(new DataHandler(new FileDataSource(filename)));
//            multipart.addBodyPart(messageBodyPart);
//            message.setContent(multipart);
            //send message

            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendForgot(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        if (getUsername(username) && getStatus(username)) {
            String[] name = getName(username).split(" ");
            VelocityEngine ve = new VelocityEngine();
            ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            ve.init();
            VelocityContext context = new VelocityContext();
            context.put("lastname", name[1]);
            context.put("loginLink", "http://localhost:8084/HR-Web/loginview.jsp?username=" + username);
            context.put("resetPasswordLink", "http://localhost:8084/HR-Web/forgotview.jsp?username=" + username);
            org.apache.velocity.Template t = ve.getTemplate("templateMail/resetPassword.vm");
            StringWriter writer = new StringWriter();
            t.merge(context, writer);
            String htmlFile = writer.toString();
            send("bootcamp34mii@gmail.com", "Bootcamp34", username, "Reset password", htmlFile);
            alert(request, response, "please check your email to check your password", "success", "loginview.jsp");
        } else if (getUsername(username) && (!getStatus(username))) {
            alert(request, response, "Your account is not activated", "error", "loginview.jsp");
        } else {
            PrintWriter out = response.getWriter();
            alert(request, response, "Email not found", "error", "loginview.jsp");
        }
    }

    public void sendConfirm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String firstname = request.getParameter("firstname").trim();
        String lastname = request.getParameter("lastname").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");
        if (username.isEmpty() || password.isEmpty()) {
            alert(request, response, "Field cannot Empty", "error", "registerview.jsp");
        } else if (getUsername(username)) {
            alert(request, response, "Username has already", "error", "registerview.jsp");
        } else {
            VelocityEngine ve = new VelocityEngine();
            ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            ve.init();
            VelocityContext context = new VelocityContext();
            context.put("lastname", lastname);
            context.put("loginLink", "http://localhost:8084/HR-Web/loginview.jsp?username=" + username);
            context.put("confirmationLink", "http://localhost:8084/HR-Web/userservlet?username=" + username);
            org.apache.velocity.Template t = ve.getTemplate("templateMail/registerConfirmation.vm");
            StringWriter writer = new StringWriter();
            t.merge(context, writer);
            String htmlFile = writer.toString();
            send("bootcamp34mii@gmail.com", "Bootcamp34", username, "Confirm Account", htmlFile);
            String pw_hash = BCrypt.hashpw(password, BCrypt.gensalt());
            generic.manageData(new Useraccount(username, pw_hash, 'N', firstname, lastname), "", "", new String(), true, false);
            alert(request, response, "Please check your email for confirm account", "success", "loginview.jsp");
        }
    }

    public void verify(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        System.out.println(gRecaptchaResponse);
        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
        // get servlet config init params
        // logging example
        System.out.println("User=" + username + "::password=" + password + "::Captcha Verify=" + verify);
        if (username.equals(username) && password.equals(password) && verify) {
            sendConfirm(request, response);
        } else {
            if (verify) {
                alert(request, response, "Either user name or password is wrong", "error", "registerview.jsp");

            } else {
                alert(request, response, "You missed the Captcha", "error", "registerview.jsp");

            }
        }
    }

    public void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        String[] name = getName(username).split(" ");
        generic.manageData(new Useraccount(username, getPassword(username), 'Y', name[0], name[1]), "", "", new String(), true, false);
        alert(request, response, "Data has been saved", "success", "loginview.jsp");
    }

    public void savePassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");
        String[] name = getName(username).split(" ");
        String pw_hash = BCrypt.hashpw(password, BCrypt.gensalt());
        generic.manageData(new Useraccount(username, pw_hash, 'Y', name[0], name[1]), "", "", new String(), true, false);
        alert(request, response, "Password has been saved", "success", "loginview.jsp");
    }

    public void alert(HttpServletRequest request, HttpServletResponse response, String msg, String type, String loc) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function () {");
        out.println("swal ( '" + msg + "' ,  ' ' ,  '" + type + "' ).then(function() {\n"
                + "    window.location = '" + loc + "';\n"
                + "});");
        out.println("$  });");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher(loc);
        rd.include(request, response);
    }
}
