<%-- 
    Document   : admin
    Created on : Jan 12, 2021, 7:39:08 PM
    Author     : Mayur Kesari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="sidenav.jsp"%>
    <!-- [ Header ] end -->
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            if(session.getAttribute("username")==null)
            {
                response.sendRedirect("admin_login.jsp");
            }
            %>
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
                                                    <h5>Home</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="#!">Analytics Dashboard</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- [ breadcrumb ] end -->

                                <!-- [ Main Content ] start -->
                                <div class="row">
                                    <!-- product profit start -->
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card prod-p-card bg-c-red">
                                            <div class="card-body">
                                                <div class="row align-items-center m-b-25">
                                                    <div class="col">
                                                        <h6 class="m-b-5 text-white">Total Donor Registered</h6>
                                                        <%
                                                            try {
                                                                int count = 0;
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                PreparedStatement ps = null;
                                                                ps = con.prepareStatement("Select Count(*) from dnr_signup");
                                                                ResultSet rs = ps.executeQuery();
                                                                while (rs.next()) {
                                                                    count = rs.getInt(1);
                                                                }
                                                        %><h3 class="m-b-0 text-white"><%out.print(count);%></h3><%
                                                            } catch (Exception e) {
                                                                out.print(e);
                                                            }
                                                        %>

                                                    </div>
                                                </div>
                                                <%
                                                    try {
                                                        int count = 0;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("SELECT COUNT(*) FROM `dnr_signup` WHERE date(timestamp)=date(CURRENT_DATE)");
                                                        ResultSet rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                            count = rs.getInt(1);
                                                        }
                                                %><p class="m-b-0 text-white">Total Registration Today</p><br><span class="label label-danger m-r-10">+<%out.print(count);%></span><%
                                                    } catch (Exception e) {
                                                        out.print(e);
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-md-6">
                                        <div class="card prod-p-card bg-c-blue">
                                            <div class="card-body">
                                                <div class="row align-items-center m-b-25">
                                                    <div class="col">
                                                        <h6 class="m-b-5 text-white">Total Receiver Registered</h6>
                                                        <%
                                                            try {
                                                                int count = 0;
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                PreparedStatement ps = null;
                                                                ps = con.prepareStatement("Select Count(*) from rec_signup");
                                                                ResultSet rs = ps.executeQuery();
                                                                while (rs.next()) {
                                                                    count = rs.getInt(1);
                                                                }
                                                        %><h3 class="m-b-0 text-white"><%out.print(count);%></h3><%
                                                            } catch (Exception e) {
                                                                out.print(e);
                                                            }
                                                        %>

                                                    </div>
                                                </div>
                                                <%
                                                    try {
                                                        int count = 0;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("SELECT COUNT(*) FROM `rec_signup` WHERE date(timestamp)=date(CURRENT_DATE)");
                                                        ResultSet rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                            count = rs.getInt(1);
                                                        }
                                                %><p class="m-b-0 text-white">Total Registration Today</p><br><span class="label label-primary m-r-10">+<%out.print(count);%></span><%
                                            } catch (Exception e) {
                                                out.print(e);
                                            }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card prod-p-card bg-c-green">
                                            <div class="card-body">
                                                <div class="row align-items-center m-b-25">
                                                    <div class="col">
                                                        <h6 class="m-b-5 text-white">Organization Registered</h6>
                                                        <%
                                                            try {
                                                                int count = 0;
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                PreparedStatement ps = null;
                                                                ps = con.prepareStatement("Select Count(*) from org_signup");
                                                                ResultSet rs = ps.executeQuery();
                                                                while (rs.next()) {
                                                                    count = rs.getInt(1);
                                                                }
                                                        %><h3 class="m-b-0 text-white"><%out.print(count);%></h3><%
                                                            } catch (Exception e) {
                                                                out.print(e);
                                                            }
                                                        %>
                                                    </div>
                                                </div>
                                                <%
                                                    try {
                                                        int count = 0;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("SELECT COUNT(*) FROM `org_signup` WHERE date(timestamp)=date(CURRENT_DATE)");
                                                        ResultSet rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                            count = rs.getInt(1);
                                                        }
                                                %><p class="m-b-0 text-white">Total Registration Today</p><br><span class="label label-success m-r-10">+<%out.print(count);%></span><%
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="col-xl-3 col-md-6">
                                        <div class="card prod-p-card bg-c-yellow">
                                            <div class="card-body">
                                                <div class="row align-items-center m-b-25">
                                                    <div class="col">
                                                        <h6 class="m-b-5 text-white">Ongoing Campaign</h6>
                                                        <%
                                                            try {
                                                                int count = 0;
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                PreparedStatement ps = null;
                                                                ps = con.prepareStatement("SELECT COUNT(*) FROM `camp` WHERE date(end_date)>date(CURRENT_DATE)");
                                                                ResultSet rs = ps.executeQuery();
                                                                while (rs.next()) {
                                                                    count = rs.getInt(1);
                                                                }
                                                        %><h3 class="m-b-0 text-white"><%out.print(count);%></h3><%
                                                            } catch (Exception e) {
                                                                out.print(e);
                                                            }
                                                        %>
                                                    </div>
                                                </div>
                                                    <%
                                                    try {
                                                        int count = 0;
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                        PreparedStatement ps = null;
                                                        ps = con.prepareStatement("SELECT COUNT(*) FROM `camp` WHERE date(timestamp)=date(CURRENT_DATE)");
                                                        ResultSet rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                            count = rs.getInt(1);
                                                        }
                                                %><p class="m-b-0 text-white">Total Registration Today</p><br><span class="label label-warning m-r-10">+<%out.print(count);%></span><%
                                                } catch (Exception e) {
                                                    out.print(e);
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

        <!-- Required Js -->
        <script src="./assets/js/vendor-all.min.js"></script>
        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="./assets/js/pcoded.min.js"></script>
    </body>

</html>

