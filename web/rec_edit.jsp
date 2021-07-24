<%-- 
    Document   : rec_edit
    Created on : Mar 10, 2021, 8:29:03 PM
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
        <title>Receiver Edit</title>
        <%@include file="csscript.jsp" %>
        <%@include file="rec_nav.jsp" %>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Receiver_signin.jsp");
            }
            String email = request.getParameter("email");
        %>
        <div class="col-xl-12 col-xl-6 container" style="margin-top: 10px;">
            <div class="card table-card">
                <div class="card-header">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                            PreparedStatement ps = null;
                            ps = con.prepareStatement("SELECT rec_signup.id, rec_signup.fname, rec_signup.mname, rec_signup.lname ,rec_signup.dob, rec_signup.gender, rec_signup.email, rec_signup.address,state.state_name, city.city_name, rec_signup.pincode, rec_signup.phone, rec_signup.bldgrp FROM rec_signup LEFT JOIN city ON rec_signup.city_id=city.city_id LEFT JOIN state ON rec_signup.state_id=state.state_id where email = '" + email + "'");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <h5>Edit Receiver Details</h5>
                </div>
                <form method="get" action="rec_edit">
                    <input  type = "hidden" name = "id" value ="<%=rs.getInt(1)%>">
                    <div class="card-body px-0 py-0">
                        <div class="table-responsive">
                            <div class="session-scroll" style="position:relative;">
                                <table class="table table-hover m-b-0">
                                    <thead>
                                        <tr>
                                            <th colspan="3" class="bg-primary text-white">Personal Info</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td><h5>First Name:</h5> <input class="form-control" type="text" value="<%=rs.getString(2)%>" name="fname"></td>
                                        <td><h5>Middle Name:</h5> <input class="form-control" type="text" value="<%=rs.getString(3)%>" name="mname"></td>
                                        <td><h5>Last Name:</h5> <input class="form-control" type="text" value="<%=rs.getString(4)%>" name="lname"></td>
                                    </tr>
                                    <tr>
                                        <td><h5>Gender:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(6)%>" name="gender"></td>
                                        <td><h5>Date of Birth:</h5> <input class="form-control" type="text" value="<%=rs.getString(5)%>" name="dob"></td>
                                        <td><h5>Blood group:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(13)%>" name="bldgrp"></td>
                                    </tr>
                                    <thead>
                                        <tr>
                                            <th colspan="3"class="bg-primary text-white">Address</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td colspan="3"><h5>Address:</h5> <input class="form-control" type="text" value="<%=rs.getString(8)%>" name="address"></td>
                                    </tr>
                                    <tr>
                                        <td><h5>State:</h5> <input class="form-control" type="text" value="<%=rs.getString(9)%>" disabled="" name="state"></td>
                                        <td><h5>City:</h5> <input class="form-control" type="text" value="<%=rs.getString(10)%>" disabled="" name="city"></td>
                                        <td><h5>Pin code:</h5> <input class="form-control" type="text" value="<%=rs.getString(11)%>" name="pincode"></td>
                                    </tr>
                                    <thead>
                                        <tr>
                                            <th colspan="3" class="bg-primary text-white">Contact Details</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <input class="form-control" type="text" hidden="" value="<%=rs.getString(7)%>" name="email">
                                        <td colspan="2"><h5>Email:</h5> <input class="form-control" type="text" value="<%=rs.getString(7)%>" disabled=""></td>
                                        <td><h5>Phone:</h5> <input class="form-control" type="text" value="<%=rs.getString(12)%>" disabled="" name="phone"></td>
                                    </tr>

                                    <tr>
                                        <td colspan="3"><a href="#"><input type="button" data-toggle="modal" data-target="#myModal1" value="Save" class="btn btn-success"></a> 
                                            <a href="dnr_fpage.jsp?email=<%=email%>"><input type="button" value="Cancel" class="btn btn-danger"></a></td>
                                    </tr>
                                    <!-- Modal -->
                                    <div class="modal" id="myModal1" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Update</h5>
                                                    <a href="#" class="btn-close" data-dismiss="modal" aria-label="close"></a>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to save the changes to this record?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="#"><input type="submit" value="Yes" class="btn btn-primary"></a>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>

                                    <%
                                        } catch (Exception e) {
                                            System.out.print(e);
                                            response.sendRedirect("rec_fpage.jsp?msg=exception&email="+email);
                                        }
                                    %>
                                </table>
                            </div>
                        </div>      
                    </div>  
                </form>        
            </div>              
        </div>
    </body>
</html>
