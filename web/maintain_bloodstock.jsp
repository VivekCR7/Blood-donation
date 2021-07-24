<%-- 
    Document   : maintain_bloodstock
    Created on : Mar 6, 2021, 11:19:00 AM
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
        <title>Maintain Bloodstock</title>
        <%@include file="sidenav.jsp" %>
        <script>
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("maintain_bloodstock.jsp");
                }

            }
            checkEvt();
        </script>
    </head>
    <body>
        <%            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("username") == null) {
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
                                                    <h5 class="m-b-10">Maintain Bloodstock</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="admin.jsp"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="a_dnr_details.jsp">Maintain Bloodstock</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- [ breadcrumb ] end -->
                        <%
                            String msg = request.getParameter("msg");
                            if ("valid".equals(msg)) {
                        %>
                        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
                            <strong>Updated!</strong> record successfully!!
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div> 
                        <%
                            }
                            if ("exception".equals(msg)) {
                        %>
                        <div class="alert alert-danger alert-dismissible fade show" style="margin: 12px;">
                            <strong>Oops!</strong> Something went wrong!!!
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div>
                        <%
                            }
                        %>
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header bg-secondary">
                                    <!-- [ Main Content ] start -->
                                    <h5 style="color: white;font-weight: bold;">BLOOD STOCK</h5>
                                    <input type="button" value="MAINTAIN BLOODSTOCK" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-outline-light btn-sm" style="float: right;">
                                </div>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">UPDATE STOCK</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <form action="update_stock">
                                                    <div class="row">

                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <select class="form-control" name="city" id="ct">
                                                                    <option disabled="" selected="">Select City</option>
                                                                    <%
                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                        Statement st = conn.createStatement();
                                                                        ResultSet rse = st.executeQuery("select * from city ORDER BY city_name");
                                                                        while (rse.next()) {
                                                                    %>
                                                                    <option value="<%=rse.getString("city_id")%>"><%=rse.getString("city_name")%></option>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <select class="form-control" name="bldgrp">
                                                                    <option value="Select Blood Group">Select Blood Group</option>
                                                                    <option value="AP">A positive (A+)</option>
                                                                    <option value="AN">A negative (A-)</option>
                                                                    <option value="BP">B positive (B+)</option>
                                                                    <option value="BN">B negative (B-)</option>
                                                                    <option value="ABP">AB positive (AB+)</option>
                                                                    <option value="ABN">AB negative (AB-)</option>
                                                                    <option value="OP">O positive (O+)</option>
                                                                    <option value="Oneg">O negative (O-)</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <select class="form-control" name="incdec">
                                                                    <option selected="" disabled="" value="Select Blood Group">Increase/Decrease</option>
                                                                    <option value="inc">+ Increase</option>
                                                                    <option value="dec">- Decrease</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <input id="stock" type="number" name="stock" class="form-control" placeholder="Enter Stock">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <input type="submit" value="UPDATE" class="btn btn-success">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body px-0 py-0">
                                    <div class="table-responsive">
                                        <div class="session-scroll" style="height:378px;position:relative;">
                                            <table class="table table-hover m-b-0" id="myTable">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>City</th>
                                                        <th>A+</th>
                                                        <th>A-</th>
                                                        <th>B+</th>
                                                        <th>B-</th>
                                                        <th>AB+</th>
                                                        <th>AB-</th>
                                                        <th>O+</th>
                                                        <th>O-</th>
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
                                                                ps = con.prepareStatement("SELECT city_name , AP , AN , BP ,BN ,ABP ,ABN ,OP ,ONeg FROM `city`");
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
                                                    </tr>
                                                    <%
                                                            }
                                                        } catch (Exception e) {
                                                            System.out.print(e);
                                                            response.sendRedirect("a_dnr_details.jsp?msg=exception");
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
            </div>
        </div>


        <!-- Required Js -->

        <script src="./assets/js/vendor-all.min.js"></script>
        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="./assets/js/pcoded.min.js"></script>
        <script>
            const searchFun = () => {
                let filter = document.getElementById('m-search').value.toUpperCase();

                let myTable = document.getElementById('myTable');

                let tr = myTable.getElementsByTagName('tr');

                for (var i = 0; i < tr.length; i++) {
                    let td = tr[i].getElementsByTagName('td')[1];

                    if (td) {
                        let textvalue = td.textContent || td.innerHtTML;

                        if (textvalue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
    </body>
</html>
