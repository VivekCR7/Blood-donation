
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur Kesari
 */
public class org_otp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext sc = getServletContext();
        String id = (String) sc.getAttribute("id");
        String oname = (String) sc.getAttribute("oname");
        String email = (String) sc.getAttribute("email");
        String address = (String) sc.getAttribute("address");
        String state = (String) sc.getAttribute("state");
        String city = (String) sc.getAttribute("city");
        String pincode = (String) sc.getAttribute("pincode");
        String phone = (String) sc.getAttribute("phone");
        String pass = (String) sc.getAttribute("pass");
        String otp = request.getParameter("otp");
        String randotp = (String) sc.getAttribute("randotp");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            if ((randotp).equals(otp)) {
            PreparedStatement st = con.prepareStatement("INSERT INTO org_signup(id, oname, address, email, state_id, city_id, pincode, phone, pass) VALUES(?,?,?,?,?,?,?,?,?)");
            st.setString(1, id);
            st.setString(2, oname);
            st.setString(3, address);
            st.setString(4, email);
            st.setString(5, state);
            st.setString(6, city);
            st.setString(7, pincode);
            st.setString(8, phone);
            st.setString(9, pass);
            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("org_signup.jsp?msg=valid");
            }else {
                response.sendRedirect("org_otppage.jsp?msg=invalidotp");
            }
        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("org_signup.jsp?msg=exception");
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
