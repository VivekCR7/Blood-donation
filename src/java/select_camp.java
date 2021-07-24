
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
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
public class select_camp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String cid = request.getParameter("cid");
        String did = request.getParameter("did");
        String email = request.getParameter("email");
        String cname = request.getParameter("cname");
        String sdt = request.getParameter("sdt");
        String edt = request.getParameter("edt");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            PreparedStatement ps = null;
            ps = con.prepareStatement("select * from dnr_camp where cid=? and did=?");
            ps.setString(1, cid);
            ps.setString(2, did);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                response.sendRedirect("dnr_fpage.jsp?email=" + email + "&msg=alreadyselected");
            }else {
                String query = ("INSERT INTO dnr_camp(did , cid) VALUES(?,?)");
                PreparedStatement st = con.prepareStatement(query);
                st.setString(1, did);
                st.setString(2, cid);
                st.executeUpdate();
                st.close();
                con.close();
                
                String name, subject;
                subject = "Please verify";

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
                    String final_Text = "You have been opted for camp ("+cname+") successfully.\nSTARTING FROM: "+sdt+" and ENDING ON: "+edt+".\nPlease do visit.\nThankyou";
                    textPart.setText(final_Text);
                    message.setSubject(subject);
                    multipart.addBodyPart(textPart);
                    message.setContent(multipart);
                    message.setSubject("Camp Selected");
                    //out.println("Sending");
                    Transport.send(message);
                } catch (Exception e) {
                    System.out.print(e);
                    response.sendRedirect("dnr_fpage.jsp?msg=exception&email=" + email);
                }
                finally{
                    response.sendRedirect("dnr_fpage.jsp?email=" + email + "&msg=selected");
                }
            }
        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("dnr_fpage.jsp?msg=exception&email=" + email);
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
