<%-- 
    Document   : check_camp
    Created on : Mar 16, 2021, 1:16:43 AM
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
        <title>Ongoing Camp Details</title>
        <%@include file="csscript.jsp" %>
    <header>
        <%@include file="nav_services.jsp" %>
    </header>
</head>
<body style="margin-right: 12px;">
    <div class="container" style="margin-top: 15px;">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header" style="background-color: #B02A37;">
                    <!-- [ Main Content ] start -->
                    <h5 style="color: white;font-weight: bold;">Camp Info</h5>
                    <input type="text" placeholder="Search . . ." id="m-search" class="form-control" style="float: right;width: 200px;margin-top: -32px;border-color: black;" onkeyup="searchFun()">
                </div>
                <div class="card-body px-0 py-0">
                    <div class="table-responsive">
                        <div class="session-scroll" style="position:relative;">
                            <table class="table table-striped table-hover m-b-0" id="myTable">
                                <thead style="background-color: #DC3545;color: white;">
                                    <tr>
                                        <th>#</th>
                                        <th>Camp Name</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>State</th>
                                        <th>Phone</th>
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
                                                    ps = con.prepareStatement("SELECT camp.cname , camp.address, city.city_name, state.state_name, camp.phone, camp.start_date,camp.end_date FROM camp INNER JOIN city ON camp.city_id=city.city_id INNER JOIN state ON camp.state_id=state.state_id WHERE camp.end_date>CURRENT_TIMESTAMP");
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
                                        <td><input type="date" disabled="" value="<%=rs.getString("start_date")%>" style="border: none; border-width: 0; box-shadow: none;"></td>
                                        <td><input type="date" disabled="" value="<%=rs.getString("end_date")%>" style="border: none; border-width: 0; box-shadow: none;"></td>

                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            System.out.print(e);
                                            out.print("error");
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
    <!--Footer-->
    <div style="margin-top: 50px;">
        <%@include file="footer.jsp" %>
    </div>
    <script>
        const searchFun = () => {
            let filter = document.getElementById('m-search').value.toUpperCase();

            let myTable = document.getElementById('myTable');

            let tr = myTable.getElementsByTagName('tr');

            for (var i = 0; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName('td')[3];
                let td1 = tr[i].getElementsByTagName('td')[4];

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
