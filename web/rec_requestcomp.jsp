<%-- 
    Document   : rec_request
    Created on : Mar 11, 2021, 1:02:53 PM
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
        <title>Blood Requests</title>
        <%@include file="nav_org.jsp" %>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Org_signin.jsp");
            }
            String email = request.getParameter("email");
        %>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #343A40;">
                    <!-- [ Main Content ] start -->
                    <h5 style="color: white;font-weight: bold;">Receiver's Request Completed</h5>
                </div>
                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;height: 300px;">
                            <table class="table table-hover m-b-0" id="myTable">
                                <thead style="background-color: #6C757D;color: white;">
                                    <tr>
                                        <th>#</th>
                                        <th>Receiver Name</th>
                                        <th>DOB</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>Blood Group</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            int id = 0;
                                            try {
                                                String cid = null;

                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                PreparedStatement pst = null;
                                                pst = con.prepareStatement("select id from org_signup where email=?");
                                                pst.setString(1, email);
                                                ResultSet rst = pst.executeQuery();
                                                if (rst.next()) {
                                                    cid = rst.getString("id");
                                                }

                                                PreparedStatement ps = null;
                                                ps = con.prepareStatement("SELECT rec_signup.id, rec_signup.fname,rec_signup.dob, rec_signup.gender, rec_signup.phone, rec_signup.bldgrp, request_blood.status FROM rec_signup INNER JOIN request_blood ON rec_signup.id=request_blood.rid where  request_blood.oid = '" + cid + "' AND request_blood.status = 'completed' order by request_blood.timestamp desc");
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {
                                        %>
                                        <td><%id = id + 1;
                                            out.print(id);%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td style="color: green;"><%=rs.getString(7).toUpperCase()%></td>
                                    </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        System.out.print(e);
                                        response.sendRedirect("org_fpage.jsp?msg=exception&email="+email);
                                    }
                                %>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
                            <div class="col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #343A40;">
                    <!-- [ Main Content ] start -->
                    <h5 style="color: white;font-weight: bold;">Receiver's Request Completed(Without Registration)</h5>
                </div>
                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;height: 300px;">
                            <table class="table table-hover m-b-0" id="myTable">
                                <thead style="background-color: #6C757D;color: white;">
                                    <tr>
                                        <th>#</th>
                                        <th>Phone</th>
                                        <th>Blood Group</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            int idd = 0;
                                            try {
                                                String ccid = null;

                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                PreparedStatement psts = null;
                                                psts = con.prepareStatement("select id from org_signup where email=?");
                                                psts.setString(1, email);
                                                ResultSet rsts = psts.executeQuery();
                                                if (rsts.next()) {
                                                    ccid = rsts.getString("id");
                                                }

                                                PreparedStatement pss = null;
                                                pss = con.prepareStatement("SELECT without_reg.phone, without_reg.bldgrp, without_reg.status, without_reg.id FROM without_reg where without_reg.oid = '" + ccid + "' AND without_reg.status = 'completed'");
                                                ResultSet rss = pss.executeQuery();
                                                while (rss.next()) {
                                        %>
                                        <td><%idd = idd + 1;
                                            out.print(idd);%></td>
                                        <td><%=rss.getString(1)%></td>
                                        <td><%=rss.getString(2)%></td>
                                        <td style="color: green;"><%=rss.getString(3).toUpperCase()%></td>
                                    </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        System.out.print(e);
                                        response.sendRedirect("org_fpage.jsp?msg=exception&email" + email);
                                    }
                                %>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
