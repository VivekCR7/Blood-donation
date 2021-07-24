<%-- 
    Document   : dnr_fpage
    Created on : Dec 24, 2020, 9:00:29 PM
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
        <title>Donor First Page</title>
        <%@include file="csscript.jsp" %>
        <%@include file="main_nav.jsp" %>
    </head>
    <body>
        <%            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Donor_signin.jsp");
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
            if ("selected".equals(msg)) {
        %>
        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
            <strong>Camp Selected Successfully!</strong>
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
                    <div class="card-header" style="background-color: #0F5132;">
                        <!-- [ Main Content ] start -->
                        <h5 style="color: white;font-weight: bold;">Ongoing Blood Camp</h5>
                    </div>
                    <form method="get" action="">
                        <div class="card-body px-0 py-0">
                            <div class="table-responsive">
                                <div class="session-scroll" style="position:relative;">
                                    <table class="table table-hover m-b-0" id="myTable">
                                        <thead class="text-white bg-success">
                                            <tr>
                                                <th>#</th>
                                                <th>Camp Name</th>
                                                <th>Address</th>
                                                <th>State</th>
                                                <th>City</th>
                                                <th>Pincode</th>
                                                <th>Phone</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Select</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <%                                                        int id = 0;
                                                    try {
                                                        String state = null;
                                                        String did = null;

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("select state_id,id from dnr_signup where email=?");
                                                        ps.setString(1, email);
                                                        ResultSet rs = ps.executeQuery();
                                                        if (rs.next()) {
                                                            state = rs.getString("state_id");
                                                            did = rs.getString("id");
                                                        }
                                                        ps = con.prepareStatement("SELECT camp.cname, camp.address, state.state_name, city.city_name, camp.pincode, camp.phone, camp.start_date, camp.end_date, camp.id FROM camp inner join state on camp.state_id = state.state_id inner join city on camp.city_id = city.city_id  where camp.state_id = '" + state + "' order by timestamp desc");
                                                        ResultSet rst = ps.executeQuery();
                                                        while (rst.next()) {
                                                %>
                                                <td><%id = id + 1;
                                                        out.print(id);%></td>
                                                <td><%=rst.getString(1)%></td>
                                                <td><%=rst.getString(2)%></td>
                                                <td><%=rst.getString(3)%></td>
                                                <td><%=rst.getString(4)%></td>
                                                <td><%=rst.getString(5)%></td>
                                                <td><%=rst.getString(6)%></td>
                                                <td><input type="date" disabled="" value="<%=rst.getString(7)%>" style="border: none; border-width: 0; box-shadow: none;"></td>
                                                <td><input type="date" disabled="" value="<%=rst.getString(8)%>" style="border: none; border-width: 0; box-shadow: none;"></td>
                                                <td><a class="btn-sm btn-success" href="select_camp.jsp?did=<%out.print(did);%>&cid=<%=rst.getString(9)%>&email=<%=email%>" style="text-decoration: none;">SELECT</a></td>
                                            </tr>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    System.out.print(e);
                                                    response.sendRedirect("dnr_fpage.jsp?msg=exception&email=" + email);
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

        <div style="margin-left: 10px;margin-right: 10px; ">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header" style="background-color: #140330;">
                        <!-- [ Main Content ] start -->
                        <h5 style="color: white;font-weight: bold;">Selected Blood Camp</h5>
                    </div>
                    <form method="get" action="deselect_camp">
                        <div class="card-body px-0 py-0">
                            <div class="table-responsive">
                                <div class="session-scroll" style="position:relative;">
                                    <table class="table table-hover m-b-0" id="myTable">
                                        <thead class="text-white" style="background-color: #3D0A91;">
                                            <tr>
                                                <th>#</th>
                                                <th>Camp Name</th>
                                                <th>Address</th>
                                                <th>State</th>
                                                <th>City</th>
                                                <th>Pincode</th>
                                                <th>Phone</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Deselect</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <%
                                                    int sid = 0;
                                                    try {
                                                        String state = null;
                                                        String did = null;
                                                        String cid = null;

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("select state_id,id from dnr_signup where email=?");
                                                        ps.setString(1, email);
                                                        ResultSet rs = ps.executeQuery();
                                                        if (rs.next()) {
                                                            state = rs.getString("state_id");
                                                            did = rs.getString("id");
                                                        }

                                                        ps = con.prepareStatement("SELECT dnr_camp.did , dnr_signup.id ,camp.cname, camp.address, state.state_name, city.city_name, camp.pincode, camp.phone, camp.start_date, camp.end_date, dnr_camp.cid FROM dnr_camp inner join dnr_signup on dnr_camp.did = dnr_signup.id inner join camp on dnr_camp.cid = camp.id inner join state on camp.state_id = state.state_id inner join city on camp.city_id = city.city_id where dnr_camp.did = '" + did + "'");
                                                        ResultSet rst = ps.executeQuery();

                                                        while (rst.next()) {
                                                            cid = rst.getString(11);
                                                %>
                                                <td><%sid = sid + 1;
                                                        out.print(sid);%></td>
                                                <td><%=rst.getString(3)%></td>
                                                <td><%=rst.getString(4)%></td>
                                                <td><%=rst.getString(5)%></td>
                                                <td><%=rst.getString(6)%></td>
                                                <td><%=rst.getString(7)%></td>
                                                <td><%=rst.getString(8)%></td>
                                                <td><input type="date" disabled="" value="<%=rst.getString(9)%>" style="border: none; border-width: 0; box-shadow: none;"></td>
                                                <td><input type="date" disabled="" value="<%=rst.getString(10)%>" style="border: none; border-width: 0; box-shadow: none;"></td>
                                                <td><a class="btn-sm" href="deselect_camp?cid=<%=cid%>&did=<%=did%>&email=<%=email%>" style="text-decoration: none;background-color: #3D0A91;color: white;">DESELECT</a></td>
                                            </tr>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                System.out.print(e);
                                                response.sendRedirect("dnr_fpage.jsp?msg=exception&email=" + email);
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
<script>
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("dnr_fpage.jsp?email=<%=email%>");
                }

            }
            checkEvt();
        </script>
</body>
</html>
