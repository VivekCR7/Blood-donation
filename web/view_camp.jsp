<%-- 
    Document   : view_camp
    Created on : Mar 8, 2021, 8:01:53 PM
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
        <title>View Camp</title>
        <%@include file="nav_org.jsp" %>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Org_signin.jsp");
            }
            String email = request.getParameter("email");
            String msg = request.getParameter("msg");
            if ("created".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
                <strong>Camp Created!</strong>successfully!!
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
                    <h5 style="color: white;font-weight: bold;">Camp Info</h5>
                </div>
                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;">
                            <table class="table table-hover m-b-0" id="myTable">
                                <thead style="background-color: #6C757D;color: white;">
                                    <tr>
                                        <th>#</th>
                                        <th>Camp Name</th>
                                        <th>Address</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            int id = 0;
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                PreparedStatement ps = null;
                                                ps = con.prepareStatement("SELECT cname, address, start_date, end_date FROM camp where email = '" + email + "'");
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {
                                        %>
                                        <td><%id = id + 1;
                                            out.print(id);%></td>
                                        <td><%=rs.getString("cname")%></td>
                                        <td><%=rs.getString("address")%></td>
                                        <td><input type="date" disabled="" value="<%=rs.getString("start_date")%>" style="border: none; border-width: 0; box-shadow: none;"></td>
                                        <td><input type="date" disabled="" value="<%=rs.getString("end_date")%>" style="border: none; border-width: 0; box-shadow: none;"></td>

                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            System.out.print(e);
                                            out.print("error");
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
</body>
</html>
