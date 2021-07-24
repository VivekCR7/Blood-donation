import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayur Kesari
 */
public class rec_login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
            String dbemail = null, dbpass = null;
            String email, pass;
            email = request.getParameter("email");
            pass = request.getParameter("pass");
            
            PreparedStatement ps = null;
            ps = con.prepareStatement("select * from rec_signup where email=? AND pass=?");
            ps.setString(1, email);
            ps.setString(2,pass);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                dbemail = rs.getString("email");
                dbpass = rs.getString("pass");
            }
            
            if(email.equals(dbemail) && pass.equals(dbpass))
            {
                HttpSession session = request.getSession();
                session.setAttribute("email",email);
                response.sendRedirect("rec_fpage.jsp?email="+email);
            }
            else if(email.equals("admin@login.com") && pass.equals("admin"))
            {
                response.sendRedirect("admin_login.jsp");
            }
            else
            {
                response.sendRedirect("Receiver_signin.jsp?msg=invalid");
            }
        }
        catch(Exception e)
        {
            System.out.print(e);
            response.sendRedirect("Receiver_signin.jsp?msg=exception");
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
