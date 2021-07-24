
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
public class camp_insert extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String cname = request.getParameter("cname");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String start_date = request.getParameter("sdt");
        String end_date = request.getParameter("edt");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            String query = ("INSERT INTO camp(cname, address, state_id, city_id, pincode, email, phone, start_date, end_date) VALUES(?,?,?,?,?,?,?,?,?)");
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, cname);
            st.setString(2, address);
            st.setString(3, state);
            st.setString(4, city);
            st.setString(5, pincode);
            st.setString(6, email);
            st.setString(7, phone);
            st.setString(8, start_date);
            st.setString(9, end_date);
            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("view_camp.jsp?msg=created&email=" + email);
        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("add_camp.jsp?msg=exception&email="+email);
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
