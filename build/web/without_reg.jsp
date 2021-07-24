<%-- 
    Document   : without_reg.jsp
    Created on : Mar 16, 2021, 1:38:37 AM
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
        <title>Request Without Registration</title>
        <%@include file="csscript.jsp" %>
    <header>
        <%@include file="nav_services.jsp" %>
    </header>
</head>
<body style="margin-right: 12px;">
    <div class="container" style="margin-top: 15px;">
        <div style="margin-left: 10px;margin-right: 10px; ">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header" style="background-color : #B02A37;">
                        <!-- [ Main Content ] start -->
                        <h5 style="color: white;font-weight: bold;">Blood Request (Without Registration)</h5></div>
                    <div class="card-body px-0 py-0">
                        <div class="table-responsive">
                            <div class="session-scroll" style="position:relative;">
                                <table class="table table-hover m-b-0" id="myTable">
                                    <thead style="background-color: #DC3545; color: white;">
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
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                    PreparedStatement ps = null;
                                                    ps = con.prepareStatement("SELECT org_signup.oname, org_signup.address,city.city_name, org_signup.phone, org_signup.AP , org_signup.AN , org_signup.BP ,org_signup.BN ,org_signup.ABP ,org_signup.ABN ,org_signup.OP ,org_signup.ONeg, org_signup.id FROM `org_signup` inner join city on org_signup.city_id = city.city_id ");
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
                                            <td><%=rs.getString(6)%></td>
                                            <td><%=rs.getString(7)%></td>
                                            <td><%=rs.getString(8)%></td>
                                            <td><%=rs.getString(9)%></td>
                                            <td><%=rs.getString(10)%></td>
                                            <td><%=rs.getString(11)%></td>
                                            <td><%=rs.getString(12)%></td>
                                            <td><a class="btn-sm" href="without_reg_details.jsp?oid=<%=rs.getString(13)%>" style="text-decoration: none;background-color: #DC3545;color: white;">REQUEST</a></td>
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
        </div>
    </div>
    <!---Footer--->
    <div style="margin-top: 50px;">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
