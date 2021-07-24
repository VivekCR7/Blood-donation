<%-- 
    Document   : view_more
    Created on : Jan 13, 2021, 8:28:56 PM
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
        <title>View More</title>
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
                                                    <h5 class="m-b-10">Organization View More</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="admin.jsp"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="org_details.jsp">Organization Details</a></li>
                                                    <li class="breadcrumb-item"><a href="#">View More</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- [ breadcrumb ] end -->
                                <%
                                    try {
                                        String id = request.getParameter("id");
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                        PreparedStatement ps = null;
                                        ps = con.prepareStatement("SELECT org_signup.id, org_signup.oname, org_signup.email, org_signup.address, state.state_name, city.city_name, org_signup.pincode, org_signup.phone, org_signup.timestamp, org_signup.updated_timestamp FROM org_signup INNER JOIN city ON org_signup.city_id=city.city_id INNER JOIN state ON org_signup.state_id=state.state_id where org_signup.id=?");
                                        ps.setString(1, id);
                                        ResultSet rs = ps.executeQuery();
                                        while (rs.next()) {
                                %>
                                <div class="col-sm-12">
                                    <div class="card">
                                            <div class="table-responsive">
                                                <table class="table table-striped m-b-0">
                                                    <tr>
                                                        <td><h4>id </h4> <%=rs.getInt(1)%></td>
                                                        <td><h4>Date/Time </h4> <%=rs.getString(9)%></td>
                                                        <td><h4>Last Updated on </h4> <%=rs.getString(10)%></td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <hr>


                                            <div class="col-xl-12 col-xl-6">
                                                <div class="card table-card">
                                                    <div class="card-header bg-light">
                                                        <h5>Complete Organization Details</h5>
                                                    </div>
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
                                                                        <td colspan="3"><h5>Organization Name:</h5> <%=rs.getString(2)%></td>
                                                                    </tr>
                                                                    <thead>
                                                                        <tr>
                                                                            <th colspan="3"class="bg-primary text-white">Address</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tr>
                                                                        <td colspan="3"><h5>Address:</h5> <%=rs.getString(4)%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><h5>State:</h5> <%=rs.getString(5)%></td>
                                                                        <td><h5>City:</h5> <%=rs.getString(6)%></td>
                                                                        <td><h5>Pin code:</h5> <%=rs.getString(7)%></td>
                                                                    </tr>
                                                                    <thead>
                                                                        <tr>
                                                                            <th colspan="3" class="bg-primary text-white">Contact Details</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tr>
                                                                        <td colspan="2"><h5>Email:</h5> <%=rs.getString(3)%></td>
                                                                        <td><h5>Phone:</h5> <%=rs.getString(8)%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3"><a href="org_details.jsp?id=<%=rs.getString(1)%>"><input type="button" value="Done" class="btn btn-info"></a>  
                                                                                        <button class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button></td>
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
                                                                                    <a href="org_delete?id=<%=rs.getString(1)%>"><input type="button" value="Yes" class="btn btn-primary"></a>
                                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </table>
                                                                <%
                                                                        }
                                                                    } catch (Exception e) {
                                                                        System.out.print(e);
                                                                        response.sendRedirect("org_details.jsp?msg=exception");
                                                                    }
                                                                %>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
