/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class rec_otp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext sc = getServletContext();
        String id = (String) sc.getAttribute("id");
        String fname = (String) sc.getAttribute("fname");
        String mname = (String) sc.getAttribute("mname");
        String lname = (String) sc.getAttribute("lname");
        String dob = (String) sc.getAttribute("dob");
        String gender = (String) sc.getAttribute("gender");
        String email = (String) sc.getAttribute("email");
        String address = (String) sc.getAttribute("address");
        String state = (String) sc.getAttribute("state");
        String city = (String) sc.getAttribute("city");
        String pincode = (String) sc.getAttribute("pincode");
        String phone = (String) sc.getAttribute("phone");
        String bldgrp = (String) sc.getAttribute("bldgrp");
        String pass = (String) sc.getAttribute("pass");
        String otp = request.getParameter("otp");
        String randotp = (String) sc.getAttribute("randotp");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            if ((randotp).equals(otp)) {
                PreparedStatement st = con.prepareStatement("INSERT INTO rec_signup(id, fname, mname, lname, dob, gender, email, address, state_id, city_id, pincode, phone, bldgrp, pass, status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                st.setString(1, id);
                st.setString(2, fname);
                st.setString(3, mname);
                st.setString(4, lname);
                st.setString(5, dob);
                st.setString(6, gender);
                st.setString(7, email);
                st.setString(8, address);
                st.setString(9, state);
                st.setString(10, city);
                st.setString(11, pincode);
                st.setString(12, phone);
                st.setString(13, bldgrp);
                st.setString(14, pass);
                st.setString(15, "Pending");
                st.executeUpdate();
                st.close();
                con.close();
                response.sendRedirect("rec_otppage.jsp?msg=valid");
            } else {
                response.sendRedirect("rec_otppage.jsp?msg=invalidotp");
            }
        } catch (Exception e) {
            System.out.print(e);
            response.sendRedirect("Receiver_signup.jsp?msg=exception");
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
