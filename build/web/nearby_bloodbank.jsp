<%-- 
    Document   : nearby_bloodbank
    Created on : Mar 16, 2021, 12:25:24 AM
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
        <title>Blood Availability</title>
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
                        <h5 style="color: white;font-weight: bold;">Available Blood Stock</h5>
                        <input type="text" placeholder="Search . . ." id="m-search" class="form-control" style="float: right;width: 200px;margin-top: -32px;border-color: black;" onkeyup="searchFun()">
                    </div>
                    <div class="card-body px-0 py-0">
                        <div class="table-responsive">
                            <div class="session-scroll" style="position:relative;height: 490px;">
                                <table class="table table-striped table-hover m-b-0" id="myTable">
                                    <thead style="background-color: #DC3545; color: white;">
                                        <tr>
                                            <th>#</th>
                                            <th>City</th>
                                            <th>State</th>
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
                                                try {
                                                    int id = 0;
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");

                                                    PreparedStatement ps = null;

                                                    ps = con.prepareStatement("SELECT city.city_name , state.state_name , city.AP , city.AN, city.BP , city.BN, city.ABP, city.ABN, city.OP , city.ONeg FROM city INNER JOIN state ON city.state_id=state.state_id");
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
                                        </tr>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                System.out.print(e);
                                                response.sendRedirect("index.jsp");
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
