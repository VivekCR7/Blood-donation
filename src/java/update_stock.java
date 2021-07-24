
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur Kesari
 */
public class update_stock extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String city_id = request.getParameter("city");
            String bldgrp = request.getParameter("bldgrp");
            String stock = request.getParameter("stock");
            String incdec = request.getParameter("incdec");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
            PreparedStatement ps = null;
            
            if (incdec.equals("inc")) {
                if ("AP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET AP=AP + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("AN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET AN=AN + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("BP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET BP=BP + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("BN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET BN=BN + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("ABP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET ABP=ABP + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("ABN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET ABN=ABN + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("OP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET OP=OP + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("Oneg".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET Oneg=Oneg + ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                }
            }else if (incdec.equals("dec")) {
                if ("AP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET AP=AP - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("AN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET AN=AN- ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("BP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET BP=BP - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("BN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET BN=BN - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("ABP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET ABP=ABP - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("ABN".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET ABN=ABN - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("OP".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET OP=OP - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                } else if ("Oneg".equals(bldgrp)) {
                    ps = con.prepareStatement("UPDATE city SET Oneg=Oneg - ? WHERE city_id = ?");
                    ps.setString(1, stock);
                    ps.setString(2, city_id);
                    ps.executeUpdate();
                    response.sendRedirect("maintain_bloodstock.jsp?msg=valid");
                }
            }

        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("maintain_bloodstock.jsp?msg=exception");
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
