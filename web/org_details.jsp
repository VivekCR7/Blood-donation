<%-- 
    Document   : a_dnr_details
    Created on : Jan 12, 2021, 8:13:22 PM
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
        <title>Donor Details</title>
        <%@include file="sidenav.jsp" %>
        <script>
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("org_details.jsp");
                }

            }
            checkEvt();
        </script>
    </head>
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
                                                    <h5 class="m-b-10">Organization Details</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="admin.jsp"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="org_details.jsp">Organization Details</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%                                    String msg = request.getParameter("msg");
                                    if ("deleted".equals(msg)) {
                                %>
                                <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
                                    <strong>Successfully!</strong> deleted one entry.
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                </div>
                                <%
                                    }
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
                                <!-- [ breadcrumb ] end -->
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-header bg-secondary">
                                            <!-- [ Main Content ] start -->
                                            <h5 style="color: white;">Organization Details</h5>
                                        </div>
                                        <div class="card-body px-0 py-0">
                                            <div class="table-responsive">
                                                <div class="session-scroll" style="position:relative;">
                                                    <table class="table table-hover m-b-0" id="myTable">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Organization Name</th>
                                                                <th>E-mail</th>
                                                                <th>State</th>
                                                                <th>City</th>
                                                                <th>Phone</th>
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
                                                                        ps = con.prepareStatement("SELECT org_signup.id, org_signup.oname , org_signup.email, state.state_name, city.city_name, org_signup.pincode, org_signup.phone FROM org_signup INNER JOIN city ON org_signup.city_id=city.city_id INNER JOIN state ON org_signup.state_id=state.state_id order by timestamp desc");
                                                                        ResultSet rs = ps.executeQuery();
                                                                        while (rs.next()) {
                                                                %>
                                                                <td><%id = id + 1;
                                                                    out.print(id);%></td>
                                                                <td><%=rs.getString(2)%></td>
                                                                <td><%=rs.getString(3)%></td>
                                                                <td><%=rs.getString(4)%></td>
                                                                <td><%=rs.getString(5)%></td>
                                                                <td><%=rs.getString(7)%></td>
                                                                <td><a class="btn-sm btn-success" href="org_view_more.jsp?id=<%=rs.getString(1)%>">View More</a></td>
                                                            </tr>
                                                            <%
                                                                    }
                                                                } catch (Exception e) {
                                                                    System.out.print(e);
                                                                    response.sendRedirect("org_details.jsp?msg=exception");
                                                                }
                                                            %>
                                                    </table>

                                                </div>
                                            </div>
                                        </div>


                                        <!-- [ Main Content ] end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                    let td1 = tr[i].getElementsByTagName('td')[5];

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
