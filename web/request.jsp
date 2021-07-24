<%-- 
    Document   : request
    Created on : Mar 11, 2021, 1:10:25 AM
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
        <title>Request Blood</title>
        <%@include file="csscript.jsp" %>
        <%@include file="rec_nav.jsp" %>
    </head>
    <body>
        <%            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Receiver_signin.jsp");
            }
        %>
        <%
            String rid = request.getParameter("rid");
            String oid = request.getParameter("oid");
            String email = request.getParameter("email");
            String bldgrp = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                PreparedStatement ps = null;
                ps = con.prepareStatement("select bldgrp from rec_signup where email=?");
                ps.setString(1, email);
                ResultSet rst = ps.executeQuery();
                if (rst.next()) {
                    bldgrp = rst.getString("bldgrp");
                }
                ps = con.prepareStatement("SELECT org_signup.oname, org_signup.address, state.state_name, city.city_name, org_signup.pincode, org_signup.phone, org_signup.email, org_signup.id FROM `org_signup` inner join city on org_signup.city_id = city.city_id inner join state on org_signup.state_id = state.state_id where org_signup.id = '" + oid + "'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <div class="col-xl-12 col-xl-6 container" style="margin-top: 10px;">
            <div class="card table-card">
                <div class="card-header">
                    <h5>View Organization Details</h5>
                </div>

                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;">
                            <table class="table table-hover m-b-0">
                                <thead>
                                    <tr>
                                        <th colspan="3" class="bg-primary text-white">Organization Name</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td colspan="3"><h5>Org Name:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(1)%>" name="cname"></td>
                                </tr>
                                <thead>
                                    <tr>
                                        <th colspan="3"class="bg-primary text-white">Address</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td colspan="3"><h5>Address:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(2)%>" name="address"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h5>State:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(3)%>" name="state">
                                    </td>
                                    <td>
                                        <h5>City:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(4)%>" name="address">
                                    </td>
                                    <td><h5>Pin code:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(5)%>" name="pincode"></td>
                                </tr>
                                <thead>
                                    <tr>
                                        <th colspan="3" class="bg-primary text-white">Contact Details</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td colspan="2"><h5>Email:</h5> <input class="form-control" value="<%=rs.getString(7)%>" disabled="" type="text" placeholder="Email" value=""></td>
                                    <td><h5>Phone:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(6)%>" name="phone"></td>
                                </tr>
                                <thead>
                                    <tr>
                                        <th colspan="3"class="bg-primary text-white">Requested Blood Type</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td colspan="3"><h5>Blood Group:</h5> <input class="form-control" disabled="" type="text" value="<%=bldgrp%>" name="address"></td>
                                </tr>
                                <tr>
                                    <td colspan="3"><a href="#"><input type="button" data-toggle="modal" data-target="#myModal1" value="Request" class="btn btn-success"></a> 
                                        <a href="rec_fpage.jsp?email=<%=email%>"><input type="button" value="Cancel" class="btn btn-danger"></a></td>
                                </tr>

                                <!-- Modal-->
                                <div class="modal" id="myModal1" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Request Blood</h5>
                                                <a href="#" class="btn-close" data-dismiss="modal" aria-label="close"></a>
                                            </div>
                                            <div class="modal-body">
                                                <p>Are you sure you want to select this organization for Bloodgroup <%=bldgrp%>?</p>
                                            </div>
                                            <form action="request">
                                                <input type="text" value="<%=oid%>" name="oid" hidden="">
                                                <input type="text" value="<%=rid%>" name="rid" hidden="">
                                                <input type="text" value="<%=email%>" name="email" hidden="">
                                                <input type="text" value="<%=rs.getString(7)%>" name="email1" hidden="">
                                                <input type="text" value="<%=bldgrp%>" name="bldgrp" hidden="">
                                                <div class="modal-footer">
                                                    <a href="#"><input type="submit" value="Yes" class="btn btn-primary"></a>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </table>
                        </div>
                    </div>      
                </div>       
            </div>              
        </div>
        <%
                }
            } catch (Exception e) {
                System.out.print(e);
                response.sendRedirect("rec_fpage.jsp?msg=exception&email=" + email);
            }
        %>
    </body>
</html>
