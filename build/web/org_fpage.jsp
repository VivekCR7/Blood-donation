<%-- 
    Document   : org_fpage
    Created on : Dec 24, 2020, 9:56:04 PM
    Author     : Mayur Kesari
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organization First Page</title>
        <%@include file="nav_org.jsp" %>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Org_signin.jsp");
            }
            String email = request.getParameter("email");

            String city = null;

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            PreparedStatement pst = null;
            pst = conn.prepareStatement("SELECT city_id FROM `org_signup` where email=?");
            pst.setString(1, email);
            ResultSet rst = pst.executeQuery();
            if (rst.next()) {
                city = rst.getString(1);
            }
        %>
        <div class="container">
            <div class="alert alert-dark" role="alert">
                WELCOME! <strong><%=email%></strong>
            </div>
        </div>
        <%
            String msg = request.getParameter("msg");
            if ("validstock".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
                <strong>STOCK UPDATED!</strong>successfully!!
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
            if ("updated".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
                <strong>Profile UPDATED!</strong>successfully!!
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
            if ("exception".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin: 12px;">
                <strong>Oops!</strong> Something went wrong!!!
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
        %>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #343A40;">
                    <!-- [ Main Content ] start -->
                    <h5 style="color: white;font-weight: bold;">BLOOD STOCK</h5>
                    <input type="button" value="MAINTAIN BLOODSTOCK" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-outline-light btn-sm" style="float: right;margin-top: -30px;">
                </div>
                <!-- Modal -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">UPDATE STOCK</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="org_update_stock">
                                    <input type="text" hidden="" value="<%=email%>" name="email">
                                    <input type="text" hidden="" value="<%=city%>" name="city">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <select class="form-control" name="bldgrp">
                                                    <option selected="" disabled="" value="Select Blood Group">Select Blood Group</option>
                                                    <option value="AP">A positive (A+)</option>
                                                    <option value="AN">A negative (A-)</option>
                                                    <option value="BP">B positive (B+)</option>
                                                    <option value="BN">B negative (B-)</option>
                                                    <option value="ABP">AB positive (AB+)</option>
                                                    <option value="ABN">AB negative (AB-)</option>
                                                    <option value="OP">O positive (O+)</option>
                                                    <option value="Oneg">O negative (O-)</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input id="stock" type="number" name="stock" class="form-control" placeholder="Enter Stock">
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <select class="form-control" name="incdec">
                                                    <option selected="" disabled="" value="Select Blood Group">Increase/Decrease</option>
                                                    <option value="inc">+ Increase</option>
                                                    <option value="dec">- Decrease</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <input type="submit" value="UPDATE" class="btn btn-success">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;">
                            <table class="table table-hover m-b-0" id="myTable">
                                <thead>
                                    <tr>
                                        <th>A+</th>
                                        <th>A-</th>
                                        <th>B+</th>
                                        <th>B-</th>
                                        <th>AB+</th>
                                        <th>AB-</th>
                                        <th>O+</th>
                                        <th>O-</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                PreparedStatement ps = null;
                                                ps = con.prepareStatement("SELECT AP , AN , BP ,BN ,ABP ,ABN ,OP ,ONeg FROM `org_signup` where email=?");
                                                ps.setString(1, email);
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {
                                                    String AP = rs.getString(1);
                                                    String AN = rs.getString(1);
                                                    String BP = rs.getString(1);
                                                    String BN = rs.getString(1);
                                                    String ABP = rs.getString(1);
                                                    String ABN = rs.getString(1);
                                                    String OP = rs.getString(1);
                                                    String Oneg = rs.getString(1);
                                        %>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                        <td><%=rs.getString(8)%></td>
                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            System.out.print(e);
                                            response.sendRedirect("org_fpage.jsp?msg=exception&email=" + email);
                                        }
                                    %>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("org_fpage.jsp?email=<%=email%>");
                }

            }
            checkEvt();
        </script>
</body>
</html>
