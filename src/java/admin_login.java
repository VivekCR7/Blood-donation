
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayur Kesari
 */
public class admin_login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
            String dbusername = null, dbpass = null;
            String username, pass;
            username = request.getParameter("username");
            pass = request.getParameter("pass");
            
            PreparedStatement ps = null;
            ps = con.prepareStatement("select * from admin where username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2,pass);
            
            ServletContext sc = getServletContext();
            sc.setAttribute("username",username);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                dbusername = rs.getString("username");
                dbpass = rs.getString("password");
            }
            
            if(username.equals(dbusername) && pass.equals(dbpass))
            {
                HttpSession session = request.getSession();
                session.setAttribute("username",username);
                response.sendRedirect("admin.jsp");
                
            }
            else
            {
                response.sendRedirect("admin_login.jsp?msg=invalid");
            }
        }
        catch(Exception e)
        {
            System.out.print(e);
            response.sendRedirect("admin_login.jsp?msg=exception");
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
