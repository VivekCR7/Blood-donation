
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

/**
 *
 * @author Mayur Kesari
 */
public class add_city extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int id = 1;
            String city_name = request.getParameter("tcity");
            String state_id = request.getParameter("state");
            int AP = 0;
            int AN = 0;
            int BP = 0;
            int BN = 0;
            int ABP = 0;
            int ABN = 0;
            int OP = 0;
            int Oneg = 0;

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
            PreparedStatement ps = null;
            ps = con.prepareStatement("select max(city_id) from city");
            ResultSet rs = ps.executeQuery();
            if (rs.first()) {
                id = rs.getInt(1);
                id = id + 1;
            }
            PreparedStatement st = con.prepareStatement("INSERT INTO city(city_id, city_name, state_id, AP, AN, BP, BN, ABP, ABN, OP, Oneg) VALUES(?,?,?,?,?,?,?,?,?,?,?)");

            st.setInt(1, id);
            st.setString(2, city_name);
            st.setString(3, state_id);
            st.setInt(4, AP);
            st.setInt(5, AN);
            st.setInt(6, BP);
            st.setInt(7, BN);
            st.setInt(8, ABP);
            st.setInt(9, ABN);
            st.setInt(10, OP);
            st.setInt(11, Oneg);
            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("manage_cities.jsp?msg=added");

        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("manage_cities.jsp?msg=exception");

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
