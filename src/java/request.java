
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur Kesari
 */
public class request extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String rid = request.getParameter("rid");
        String oid = request.getParameter("oid");
        String email = request.getParameter("email");
        String email1 = request.getParameter("email1");
        String bldgrp = request.getParameter("bldgrp");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            String query = ("INSERT INTO request_blood(rid , oid) VALUES(?,?)");
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, rid);
            st.setString(2, oid);
            st.executeUpdate();
            st.close();
            con.close();

            String subject, subject1;
            subject = "Please Verify";
            subject1 = "Please Confirm";

            final String username = "mkesari75@gmail.com";
            final String password = "Mayur@80";
            Properties props = new Properties();
            props.put("mail.smtp.auth", true);
            props.put("mail.smtp.starttls.enable", true);
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                MimeBodyPart textPart = new MimeBodyPart();
                Multipart multipart = new MimeMultipart();
                String final_Text = "Your request for blood type (" + bldgrp + ") is successfull.";
                textPart.setText(final_Text);
                message.setSubject(subject);
                multipart.addBodyPart(textPart);
                message.setContent(multipart);
                message.setSubject("Requested Blood");
                //out.println("Sending");
                Transport.send(message);
                try {
                    Message message1 = new MimeMessage(session);
                    message1.setFrom(new InternetAddress(email1));
                    message1.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email1));
                    MimeBodyPart textPart1 = new MimeBodyPart();
                    Multipart multipart1 = new MimeMultipart();
                    String final_Text1 = "You have been requested for blood type (" + bldgrp + ").\nPlease Login and check";
                    textPart1.setText(final_Text1);
                    message1.setSubject(subject1);
                    multipart1.addBodyPart(textPart1);
                    message1.setContent(multipart1);
                    message1.setSubject("Blood Request");
                    //out.println("Sending");
                    Transport.send(message1);
                } catch (Exception e) {
                    System.out.print(e);
                }
            } catch (Exception e) {
                System.out.print(e);
                response.sendRedirect("rec_fpage.jsp?msg=exception&email=" + email);
            } finally {
                response.sendRedirect("rec_fpage.jsp?email=" + email + "&msg=requested");
            }

        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("rec_fpage.jsp?email=" + email + "&msg=exception");
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

}
