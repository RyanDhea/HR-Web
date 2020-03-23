/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import dao.GenericDao;
import dao.IGeneric;
import java.io.IOException;
import java.io.StringWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import models.Useraccount;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

/**
 *
 * @author JOE
 */
public class ManualTest {

    public static void send(String from,String password,String to, String sub, String msg) throws IOException{

          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session;
            session = Session.getDefaultInstance(props,    
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from,password);
                }    
            });
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
           Address address  = new InternetAddress(from);
           message.setFrom(address);
           message.setSubject(sub);    
//            MimeBodyPart messageBodyPart = new MimeBodyPart();
//            Multipart multipart = new MimeMultipart();
//            messageBodyPart = new MimeBodyPart();
//            String fileName = "attachmentName";
//            DataSource source = new FileDataSource(file);
//            messageBodyPart.setDataHandler(new DataHandler(source));
//            messageBodyPart.setFileName(fileName);
//            multipart.addBodyPart(messageBodyPart);
            message.setContent(msg, "text/html; charset=utf-8");
//            message.setContent(multipart); 

//            MimeBodyPart imagePart = new MimeBodyPart();
//            imagePart.setHeader("Content-ID", "AbcXyz123");
//            imagePart.setDisposition(MimeBodyPart.INLINE);
//            // attach the image file
//            imagePart.attachFile(imageFilePath);

//            message.setDataHandler(
//            new DataHandler(new FileDataSource(htmlFile)));

           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             
    }  
    
    
    public static void main(String[] args) throws IOException {
//        IGeneric<Useraccount> generic = new GenericDao<>();
//        String pw_hash = BCrypt.hashpw("test", BCrypt.gensalt());
//        generic.manageData(new Useraccount("atlanticaid2@gmail.com", pw_hash, 'Y'), "", "", new String(), true, false);
   
         /*
         *   first, get and initialize an engine
         */

        VelocityEngine ve = new VelocityEngine();
        ve.init();

        /*
         *   organize our data 
         */

        ArrayList list = new ArrayList();
        Map map = new HashMap();

        map.put("name", "Jody");
        map.put("login", "http://localhost:8084/HR-Web/loginview.jsp");
        map.put("activate", "http://localhost:8084/HR-Web/loginview.jsp");
        map.put("reset", "http://localhost:8084/HR-Web/loginview.jsp");
        list.add( map );

        /*
         *  add that list to a VelocityContext
         */

        VelocityContext context = new VelocityContext();
        context.put("person", list);

        /*
         *   get the Template  
         */

        org.apache.velocity.Template t = ve.getTemplate("./src/java/templateMail/registerConfirmation.vm");

        /*
         *  now render the template into a Writer, here 
         *  a StringWriter 
         */

        StringWriter writer = new StringWriter();

        t.merge( context, writer );

        /*
         *  use the output in the body of your emails
         */

        System.out.println( writer.toString() );
        
        
//         String htmlFile = "D:/METRODATA/tugasjava/HRWeb/HRWeb/src/java/htmlMail/welcomeuser.html";
         ManualTest.send("bootcamp34mii@gmail.com","Bootcamp34","jodyzman70@gmail.com","HTML",writer.toString());  
    
    }

}
