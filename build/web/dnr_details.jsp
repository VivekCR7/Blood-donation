<%-- 
    Document   : dnr_details
    Created on : Mar 11, 2021, 12:33:56 PM
    Author     : Mayur Kesari
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donor Details</title>
        <%@include file="nav_org.jsp" %>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Org_signin.jsp");
            }
            String email = request.getParameter("email");
        %>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #343A40;">
                    <!-- [ Main Content ] start -->
                    <h5 style="color: white;font-weight: bold;">Donor Opted for Camp</h5>
                </div>
                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;">
                            <table class="table table-hover m-b-0" id="myTable">
                                <thead style="background-color: #6C757D;color: white;">
                                    <tr>
                                        <th>#</th>
                                        <th>Donor Name</th>
                                        <th>DOB</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>Blood Group</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            int id = 0;
                                            try {
                                                String cid = null;

                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                PreparedStatement pst = null;
                                                pst = con.prepareStatement("select id from org_signup where email=?");
                                                pst.setString(1, email);
                                                ResultSet rst = pst.executeQuery();
                                                if (rst.next()) {
                                                    cid = rst.getString("id");
                                                }

                                                PreparedStatement ps = null;
                                                ps = con.prepareStatement("SELECT dnr_signup.fname, dnr_signup.dob, dnr_signup.gender, dnr_signup.phone ,dnr_signup.bldgrp from dnr_signup INNER JOIN dnr_camp ON dnr_signup.id=dnr_camp.did WHERE dnr_camp.cid='"+ cid +"'");
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {
                                        %>
                                        <td><%id = id + 1;
                                            out.print(id);%></td>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            System.out.print(e);
                                        }
                                    %>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
