<%-- 
    Document   : manage_cities
    Created on : Mar 5, 2021, 8:46:27 PM
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
        <title>Manage Cities</title>
        <%@include file="sidenav.jsp" %>
        <script>
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("manage_cities.jsp");
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
                                                    <h5 class="m-b-10">Manage Cities</h5>
                                                </div>
                                                <ul class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="admin.jsp"><i class="feather icon-home"></i></a></li>
                                                    <li class="breadcrumb-item"><a href="a_dnr_details.jsp">Manage Cities</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            String msg = request.getParameter("msg");
                            if ("added".equals(msg)) {
                        %>
                        <div class="alert alert-success alert-dismissible fade show" style="margin: 12px;">
                            City Added successfully!!
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div>
                        <%
                            }
                            if ("deleted".equals(msg)) {
                        %>
                        <div class="alert alert-danger alert-dismissible fade show" style="margin: 12px;">
                            <strong>Deleted!</strong> One City.
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
                                <div class="card-body px-0 py-0">
                                    <div class="container" style="margin-top: 5px;">
                                        <input type="button" value="Add City" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-outline-success btn-lg">
                                        <input type="button" value="Remove City" data-toggle="modal" data-target="#exampleModalCenter1" class="btn btn-outline-danger btn-lg" style="float: right;">
                                    </div>

                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">ADD CITY</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">

                                                    <form action="add_city">
                                                        <div class="row">

                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <input id="tcity" type="text" name="tcity" class="form-control" placeholder="City">
                                                                    <span id="scity" style="color: red; font-weight: bold;"></span>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-8">
                                                                <div class="form-group">
                                                                    <select class="form-control" name="state" id="sts">
                                                                        <option disabled="" selected="">Select State</option>
                                                                        <%                                                                                        Class.forName("com.mysql.jdbc.Driver");
                                                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                            Statement st = conn.createStatement();
                                                                            ResultSet rse = st.executeQuery("select * from state");
                                                                            while (rse.next()) {
                                                                        %>
                                                                        <option value="<%=rse.getString("state_id")%>"><%=rse.getString("state_name")%></option>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <input type="submit" value="ADD" class="btn btn-success">
                                                        </div>
                                                    </form>
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal2 -->
                                    <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Remove City</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="remove_city">
                                                        <center>
                                                            <div class="col-sm-8">
                                                                <div class="form-group">
                                                                    <div class="col-sm-12">
                                                                        <div class="form-group">
                                                                            <select class="form-control" name="city" id="ct">
                                                                                <option disabled="" selected="">Select City</option>
                                                                                <%
                                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                                    Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                                    Statement sta = connn.createStatement();
                                                                                    ResultSet rset = sta.executeQuery("select * from city ORDER BY city_name");
                                                                                    while (rset.next()) {
                                                                                %>
                                                                                <option value="<%=rset.getString("city_id")%>"><%=rset.getString("city_name")%></option>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </center>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <input type="submit" value="REMOVE" class="btn btn-danger">
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <div class="session-scroll" style="height:378px;position:relative;">
                                            <table class="table table-hover m-b-0" id="myTable">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Cities</th>
                                                        <th>State</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <%                                                            int id = 0;
                                                            try {
                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                                PreparedStatement ps = null;
                                                                ps = con.prepareStatement("SELECT city.city_name, state.state_name FROM city INNER JOIN state ON city.state_id=state.state_id");
                                                                ResultSet rs = ps.executeQuery();
                                                                while (rs.next()) {
                                                        %>
                                                        <td><%id = id + 1;
                                                                out.print(id);%></td>
                                                        <td><%=rs.getString(1)%></td>
                                                        <td><%=rs.getString(2)%></td>
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
                                <!-- [ Main Content ] end -->               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

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
                    let td1 = tr[i].getElementsByTagName('td')[2];

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
