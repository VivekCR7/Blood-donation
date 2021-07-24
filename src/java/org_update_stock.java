
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
public class org_update_stock extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");

        String bldgrp = request.getParameter("bldgrp");
        String city = request.getParameter("city");
        String incdec = request.getParameter("incdec");
        String stock = request.getParameter("stock");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
            PreparedStatement ps = null;
            if (incdec.equals("inc")) {
                if ("AP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.AP = org_signup.AP + ?, city.AP = city.AP + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("AN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.AN = org_signup.AN + ?, city.AN = city.AN + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("BP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.BP = org_signup.BP + ?, city.BP = city.BP + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("BN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.BN = org_signup.BN + ?, city.BN = city.BN + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("ABP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.ABP = org_signup.ABP + ?, city.ABP = city.ABP + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("ABN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.ABN = org_signup.ABN + ?, city.ABN = city.ABN + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("OP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.OP = org_signup.OP + ?, city.OP = city.OP + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("Oneg".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.Oneg = org_signup.Oneg + ?, city.Oneg = city.Oneg + ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                }
            }else if(incdec.equals("dec")){
                if ("AP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.AP = org_signup.AP - ?, city.AP = city.AP - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("AN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.AN = org_signup.AN - ?, city.AN = city.AN - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("BP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.BP = org_signup.BP - ?, city.BP = city.BP - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("BN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.BN = org_signup.BN - ?, city.BN = city.BN - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("ABP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.ABP = org_signup.ABP - ?, city.ABP = city.ABP - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("ABN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.ABN = org_signup.ABN - ?, city.ABN = city.ABN - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, email);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("OP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.OP = org_signup.OP - ?, city.OP = city.OP - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                } else if ("Oneg".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE org_signup, city SET org_signup.Oneg = org_signup.Oneg - ?, city.Oneg = city.Oneg - ? WHERE org_signup.email = ? AND city.city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, stock);
                    ps.setString(3, email);
                    ps.setString(4, city);
                    ps.executeUpdate();
                    response.sendRedirect("org_fpage.jsp?msg=validstock&email=" + email);
                }
            }

        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("org_fpage.jsp?msg=exception&email=" + email);
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
