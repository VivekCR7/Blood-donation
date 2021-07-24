<%-- 
    Document   : select_camp
    Created on : Mar 9, 2021, 12:52:02 PM
    Author     : Mayur Kesari
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Camp</title>
        <%@include file="csscript.jsp" %>
        <%@include file="main_nav.jsp" %>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Donor_signin.jsp");
            }
        %>
        <%
            int id = 0;
            String cid = request.getParameter("cid");
            String did = request.getParameter("did");
            String email = request.getParameter("email");
            String cname = null;
            String sdt = null;
            String edt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                PreparedStatement ps = null;
                ps = con.prepareStatement("SELECT camp.cname, camp.address, state.state_name, city.city_name, camp.pincode, camp.email, camp.phone, camp.start_date, camp.end_date FROM camp inner join state on camp.state_id=state.state_id inner join city on camp.city_id=city.city_id where id = '" + cid + "'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    cname = rs.getString(1);
                    sdt = rs.getString(8);
                    edt = rs.getString(9);
        %>
        <div class="col-xl-12 col-xl-6 container" style="margin-top: 10px;">
            <div class="card table-card">
                <div class="card-header">
                    <h5>View Camp Details</h5>
                </div>
                
                    <div class="card-body px-0 py-0">
                        <div class="table-responsive">
                            <div class="session-scroll" style="position:relative;">
                                <table class="table table-hover m-b-0">
                                    <thead>
                                        <tr>
                                            <th colspan="3" class="bg-primary text-white">Camp Name</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td colspan="3"><h5>Camp Name:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(1)%>" name="cname"></td>
                                    </tr>
                                    <thead>
                                        <tr>
                                            <th colspan="3"class="bg-primary text-white">Address</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td colspan="3"><h5>Address:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(2)%>" name="address"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>State:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(3)%>" name="state">
                                        </td>
                                        <td>
                                            <h5>City:</h5> <input class="form-control" disabled="" type="text" value="<%=rs.getString(4)%>" name="address">
                                        </td>
                                        <td><h5>Pin code:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(5)%>" name="pincode"></td>
                                    </tr>
                                    <thead>
                                        <tr>
                                            <th colspan="3" class="bg-primary text-white">Contact Details</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td colspan="2"><h5>Email:</h5> <input class="form-control" value="<%=rs.getString(6)%>" disabled="" type="text" placeholder="Email" value=""  name="email"></td>
                                        <td><h5>Phone:</h5> <input class="form-control" type="text" disabled="" value="<%=rs.getString(7)%>" name="phone"></td>
                                    </tr>
                                    <tr>
                                        <td><h5>Start Date:</h5> <input class="form-control" disabled="" type="date" value="<%=rs.getString(8)%>"  name="sdt"></td>
                                        <td><h5>End Date:</h5> <input class="form-control" disabled="" type="date" value="<%=rs.getString(9)%>"  name="edt"></td>
                                    </tr>

                                    <tr>
                                        <td colspan="3"><a href="#"><input type="button" data-toggle="modal" data-target="#myModal1" value="Select This Camp" class="btn btn-success"></a> 
                                            <a href="dnr_fpage.jsp?email=<%=email%>"><input type="button" value="Cancel" class="btn btn-danger"></a></td>
                                    </tr>
                                    
                                    <!-- Modal-->
                                    <div class="modal" id="myModal1" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Select Camp</h5>
                                                    <a href="#" class="btn-close" data-dismiss="modal" aria-label="close"></a>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to select this camp?</p>
                                                </div>
                                                <form action="select_camp">
                                                    <input type="text" value="<%=cid%>" name="cid" hidden="">
                                                    <input type="text" value="<%=did%>" name="did" hidden="">
                                                    <input type="text" value="<%=email%>" name="email" hidden="">
                                                    <input type="text" value="<%=cname%>" name="cname" hidden="">
                                                    <input type="text" value="<%=sdt%>" name="sdt" hidden="">
                                                    <input type="text" value="<%=edt%>" name="edt" hidden="">
                                                <div class="modal-footer">
                                                    <a href="#"><input type="submit" value="Yes" class="btn btn-primary"></a>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </div>      
                    </div>       
            </div>              
        </div>
        <%
                }
            } catch (Exception e) {
                System.out.print(e);
                response.sendRedirect("dnr_fpage.jsp?msg=exception&email=" + email);
            }
        %>
    </body>
</html>
