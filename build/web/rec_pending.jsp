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
    <script>
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("rec_pending.jsp");
                }

            }
            checkEvt();
        </script>
    <title>Receiver Pending</title>
    <!-- [ Header ] end -->
    <body>
        <%            
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

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
                                                    <h5>Receiver Pending</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="admin.jsp"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="#!">Receiver</a></li>
                                                    <li class="breadcrumb-item"><a href="#!">Pending</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- [ breadcrumb ] end -->
                                <%    String msg = request.getParameter("msg");
                                    if ("updated".equals(msg)) {
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
                                <!-- [ Main Content ] start -->
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-header bg-secondary">
                                            <h5 style="color:white;">Pending Receivers</h5>
                                        </div>
                                        <div class="card-body px-0 py-0">
                                            <div class="table-responsive">
                                                <div class="session-scroll" style="position:relative;">
                                                    <table class="table table-hover m-b-0" id="myTable">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>First Name</th>
                                                                <th>Last Name</th>
                                                                <th>Gender</th>
                                                                <th>E-mail</th>
                                                                <th>State</th>
                                                                <th>City</th>
                                                                <th>Phone</th>
                                                                <th>Blood Group</th>
                                                                <th>Done</th>
                                                                <th>view More</th>
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
                                                                        ps = con.prepareStatement("SELECT rec_signup.id, rec_signup.fname, rec_signup.mname, rec_signup.lname ,rec_signup.dob, rec_signup.gender, rec_signup.email, rec_signup.address,state.state_name, city.city_name, rec_signup.pincode, rec_signup.phone, rec_signup.bldgrp FROM rec_signup INNER JOIN city ON rec_signup.city_id=city.city_id INNER JOIN state ON rec_signup.state_id=state.state_id INNER JOIN request_blood ON rec_signup.id=request_blood.rid where request_blood.status='pending' order by request_blood.timestamp desc");
                                                                        ResultSet rs = ps.executeQuery();
                                                                        while (rs.next()) {
                                                                %>
                                                                <td><%id = id + 1;
                                                                    out.print(id);%></td>
                                                                <td><%=rs.getString(2)%></td>
                                                                <td><%=rs.getString(4)%></td>
                                                                <td><%=rs.getString(6)%></td>
                                                                <td><%=rs.getString(7)%></td>
                                                                <td><%=rs.getString(9)%></td>
                                                                <td><%=rs.getString(10)%></td>
                                                                <td><%=rs.getString(12)%></td>
                                                                <td><%=rs.getString(13)%></td>
                                                                <td><a class="btn-sm btn-success" data-toggle="modal" data-target="#myModal" href="#">Done</a></td>
                                                                <td><a class="btn-sm btn-primary" href="rec_view_more.jsp?id=<%=rs.getString(1)%>">View More</a></td>
                                                            </tr>
                                                            <!-- Modal -->
                                                        <div class="modal" id="myModal" tabindex="-1">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Completed</h5>
                                                                        <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <p>Are you sure you want to UPDATE this record?</p>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <a href="rec_pending?rid=<%=rs.getString(1)%>"><input type="button" value="Completed" class="btn btn-primary"></a>
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%
                                                                }
                                                            } catch (Exception e) {
                                                                System.out.print(e);
                                                                response.sendRedirect("rec_details.jsp?msg=exception");
                                                            }
                                                        %>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- [ Main Content ] end -->


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- sessions-section end -->
        <!-- [ Main Content ] end -->
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
                    let td1 = tr[i].getElementsByTagName('td')[7];

                    if (td || td1) {
                        let textvalue = td.textContent || td.innerHtTML;
                        let textvalue1 = td1.textContent || td1.innerHtTML;

                        if (textvalue.toUpperCase().indexOf(filter) > -1 || textvalue1.toUpperCase().indexOf(filter) > -1) {
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

