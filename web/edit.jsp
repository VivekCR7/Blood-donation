<%-- 
    Document   : edit
    Created on : Jan 14, 2021, 8:07:51 PM
    Author     : Mayur Kesari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <%@include file="sidenav.jsp" %>
    </head>
    <body>
        <!-- [ Main Content ] start -->
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <div class="pcoded-content">
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">

                                <!-- [ breadcrumb ] start -->
                                <div class="page-header">
                                    <div class="page-block">
                                        <div class="row align-items-center">
                                            <div class="col-md-12">
                                                <div class="page-header-title">
                                                    <h5 class="m-b-10">Donor</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="admin.jsp"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="a_dnr_details.jsp">Donor Details</a></li>
                                                    <li class="breadcrumb-item"><a href="view_more.jsp">View More</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- [ breadcrumb ] end -->

                                <div class="col-xl-12 col-xl-6">
                                    <div class="card table-card">
                                        <div class="card-header">
                                            <%
                                                String id = request.getParameter("id");
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                    PreparedStatement ps = null;
                                                    ps = con.prepareStatement("select * from dnr_signup where id='" + id + "'");
                                                    ResultSet rs = ps.executeQuery();
                                                    while (rs.next()) {
                                            %>
                                            <h5>Edit Donor Details</h5>
                                        </div>
                                        <form method="get" action="edit">
                                            <input  type = "hidden" name = "id" value ="<%out.print(id);%>">
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
                                                                <td><h5>Gender:</h5> <input class="form-control" type="text" value="<%=rs.getString(6)%>" name="gender"></td>
                                                                <td><h5>Date of Birth:</h5> <input class="form-control" type="text" value="<%=rs.getString(5)%>" name="dob"></td>
                                                                <td><h5>Blood group:</h5> <input class="form-control" type="text" value="<%=rs.getString(13)%>" name="bldgrp"></td>
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
                                                                <td><h5>State:</h5> <input class="form-control" type="text" value="<%=rs.getString(9)%>" name="state"></td>
                                                                <td><h5>City:</h5> <input class="form-control" type="text" value="<%=rs.getString(10)%>" name="city"></td>
                                                                <td><h5>Pin code:</h5> <input class="form-control" type="text" value="<%=rs.getString(11)%>" name="pincode"></td>
                                                            </tr>
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="3" class="bg-primary text-white">Contact Details</th>
                                                                </tr>
                                                            </thead>
                                                            <tr>
                                                                <td colspan="2"><h5>Email:</h5> <input class="form-control" type="text" value="<%=rs.getString(7)%>" name="email"></td>
                                                                <td><h5>Phone:</h5> <input class="form-control" type="text" value="<%=rs.getString(12)%>" name="phone"></td>
                                                            </tr>

                                                            <tr>
                                                                <td colspan="3"><a href="#"><input type="button" data-toggle="modal" data-target="#myModal1" value="Save" class="btn btn-info"></a> 
                                                                    <a href="#"><input type="button" data-toggle="modal" data-target="#myModal" value="Delete" class="btn btn-danger"></a></td>
                                                            </tr>
                                                            <!-- Modal -->
                                                            <div class="modal" id="myModal" tabindex="-1">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title">Delete</h5>
                                                                            <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <p>Are you sure you want to delete this record?</p>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <a href="a_dnr_delete?id=<%=rs.getString(1)%>"><input type="button" value="Yes" class="btn btn-primary"></a>
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="modal" id="myModal1" tabindex="-1">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title">Update</h5>
                                                                            <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
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
                                                                    out.print(e);
                                                                }
                                                            %>
                                                        </table>
                                                    </div>
                                                </div>      
                                            </div>  
                                        </form>        
                                    </div>              
                                </div>
                            </div>                      
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="./assets/js/vendor-all.min.js"></script>
        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="./assets/js/pcoded.min.js"></script>
    </body>
</html>
