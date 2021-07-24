<%-- 
    Document   : without_reg_details
    Created on : Mar 16, 2021, 2:07:19 AM
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
        <title>Organization Details</title>
        <%@include file="csscript.jsp" %>
    <header>
        <%@include file="nav_services.jsp" %>
    </header>
</head>
<body>
    <%
        String oid = request.getParameter("oid");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

            PreparedStatement ps = null;
            ps = con.prepareStatement("SELECT org_signup.oname, org_signup.address, state.state_name, city.city_name, org_signup.pincode, org_signup.phone, org_signup.email, org_signup.id FROM `org_signup` inner join city on org_signup.city_id = city.city_id inner join state on org_signup.state_id = state.state_id where org_signup.id = '" + oid + "'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
    %>
    <div class="col-xl-12 col-xl-6 container" style="margin-top: 10px;">
        <div class="card table-card">
            <div class="card-header text-white" style="background-color : #B02A37;">
                <h5>View Organization Details</h5>
            </div>

            <div class="card-body px-0 py-0">
                <div class="table-responsive">
                    <div class="session-scroll" style="position:relative;">
                        <table class="table table-hover m-b-0">
                            <thead>
                                <tr>
                                    <th colspan="3" class="bg-danger text-white">Organization Name</th>
                                </tr>
                            </thead>
                            <tr>
                                <td colspan="3"><h5>Org Name:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(1)%>" name="cname"></td>
                            </tr>
                            <thead>
                                <tr>
                                    <th colspan="3"class="bg-danger text-white">Address</th>
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
                                    <th colspan="3" class="bg-danger text-white">Contact Details</th>
                                </tr>
                            </thead>
                            <tr>
                                <td colspan="2"><h5>Email:</h5> <input class="form-control" value="<%=rs.getString(7)%>" disabled="" type="text" placeholder="Email" value=""  name="email"></td>
                                <td><h5>Phone:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(6)%>" name="phone"></td>
                            </tr>
                            <tr>
                                <td colspan="3"><a href="#"><input type="button" data-toggle="modal" data-target="#myModal1" value="Request" class="btn btn-success"></a> 
                                    <a href="without_reg.jsp"><input type="button" value="Cancel" class="btn btn-danger"></a></td>
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
                                            <form action="without_reg">
                                                <p>Please provide your details to contact you.</p>
                                                <select class="form-select" name="bldgrp">
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
                                                <br>
                                                <input type="tel" name="phone" placeholder="Phone Number" required="" class="form-control">
                                                <input type="text" hidden="" value="<%=oid%>" name="oid">
                                        </div>
                                        <div class="modal-footer">
                                            <a href="#"><input type="submit" value="Request" class="btn btn-danger"></a>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        </form>
                                        </div>
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
        }
    %>
    <!---Footer--->
    <div style="margin-top: 50px;">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
