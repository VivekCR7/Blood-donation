<%-- 
    Document   : rec_fpage
    Created on : Dec 24, 2020, 9:49:54 PM
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
        <title>Receiver First Page</title>
        <%@include file="csscript.jsp" %>
        <%@include file="rec_nav.jsp" %>
    </head>
    <body>
        <%             response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Receiver_signin.jsp");
            }
            String email = request.getParameter("email");
        %>
        <div class="alert alert-info" role="alert">
            <h4 class="alert-heading">Welcome!</h4>
            <hr>
            <p class="mb-0"><%out.print(email);%></p>
        </div>
        <%
            String msg = request.getParameter("msg");
            if ("updated".equals(msg)) {
        %>
        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
            <strong>Updated!</strong> record successfully!!
            <a href="#" class="btn-close" data-dismiss="alert" aria-label="close"></a>
        </div>
        <%
            }
            if ("valid".equals(msg)) {
        %>
        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
            <strong>Password reset successful!</strong>
            <a href="#" class="btn-close" data-dismiss="alert" aria-label="close"></a>
        </div>
        <%
            }
            if ("exception".equals(msg)) {
        %>
        <div class="alert alert-danger alert-dismissible fade show" style="margin: 12px;">
            <strong>Oops!</strong> Something went wrong!!!
            <a href="#" class="btn-close" data-dismiss="alert" aria-label="close"></a>
        </div>
        <%
            }
        %>
        <%
            if ("requested".equals(msg)) {
        %>
        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
            <strong>Requested for </strong><strong class="text-danger">blood!</strong>
            <a href="#" class="btn-close" data-dismiss="alert" aria-label="close"></a>
        </div>
        <%
            }
            if ("alreadyselected".equals(msg)) {
        %>
        <div class="alert alert-warning alert-dismissible fade show" style="margin: 12px;">
            This Camp is <strong>Already Selected</strong>
            <a href="#" class="btn-close" data-dismiss="alert" aria-label="close"></a>
        </div>
        <%
            }
            if ("deselected".equals(msg)) {
        %>
        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
            <strong>Camp Deselected Successfully!</strong>
            <a href="#" class="btn-close" data-dismiss="alert" aria-label="close"></a>
        </div>
        <%
            }
        %>
        <div style="margin-left: 10px;margin-right: 10px; ">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header" style="background-color : #055160;">
                        <!-- [ Main Content ] start -->
                        <h5 style="color: white;font-weight: bold;">Available Blood Stock</h5></div>
                    <div class="card-body px-0 py-0">
                        <div class="table-responsive">
                            <div class="session-scroll" style="position:relative;">
                                <table class="table table-hover m-b-0" id="myTable">
                                    <thead style="background-color: #087990; color: white;">
                                        <tr>
                                            <th>#</th>
                                            <th>Org Name</th>
                                            <th>Address</th>
                                            <th>City</th>
                                            <th>Phone</th>
                                            <th>A+</th>
                                            <th>A-</th>
                                            <th>B+</th>
                                            <th>B-</th>
                                            <th>AB+</th>
                                            <th>AB-</th>
                                            <th>O+</th>
                                            <th>O-</th>
                                            <th>REQUEST</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                                <%
                                                    try {
                                                        int id = 0;
                                                        String state = null;
                                                        String rid = null;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("select state_id,id from rec_signup where email=?");
                                                        ps.setString(1, email);
                                                        ResultSet rs = ps.executeQuery();
                                                        if (rs.next()) {
                                                            state = rs.getString("state_id");
                                                            rid = rs.getString("id");
                                                        }

                                                        ps = con.prepareStatement("SELECT org_signup.oname, org_signup.address,city.city_name, org_signup.phone, org_signup.AP , org_signup.AN , org_signup.BP ,org_signup.BN ,org_signup.ABP ,org_signup.ABN ,org_signup.OP ,org_signup.ONeg, org_signup.id FROM `org_signup` inner join city on org_signup.city_id = city.city_id where org_signup.state_id=?");
                                                        ps.setString(1, state);
                                                        rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                %>
                                                <td><%id = id + 1;
                                                    out.print(id);%></td>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><%=rs.getString(5)%></td>
                                            <td><%=rs.getString(6)%></td>
                                            <td><%=rs.getString(7)%></td>
                                            <td><%=rs.getString(8)%></td>
                                            <td><%=rs.getString(9)%></td>
                                            <td><%=rs.getString(10)%></td>
                                            <td><%=rs.getString(11)%></td>
                                            <td><%=rs.getString(12)%></td>
                                            <td><a class="btn-sm" href="request.jsp?rid=<%out.print(rid);%>&oid=<%=rs.getString(13)%>&email=<%=email%>"  style="text-decoration: none;background-color: #087990;color: white;">REQUEST</a></td>
                                        </tr>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                System.out.print(e);
                                                response.sendRedirect("rec_fpage.jsp?email=" + email + "&msg=exception");
                                            }
                                        %>
                                </table>

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
                                            window.location.replace("rec_fpage.jsp?email=<%=email%>");
                }

            }
            checkEvt();
        </script>
    </body>
</html>
