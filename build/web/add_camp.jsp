<%-- 
    Document   : add_camp
    Created on : Mar 8, 2021, 6:27:23 PM
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
        <title>Add Camp</title>

        <%@include file="nav_org.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#sts").on("change", function () {
                    var id = $("#sts").val();

                    $("#error").html("");
                    $.ajax({
                        url: "fetch2.jsp",
                        data: {id: id},
                        method: "POST",
                        success: function (data)
                        {
                            $("#msg").html(data);
                        }
                    });
                }
                );
            });
        </script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Org_signin.jsp");
            }
        %>
        <%
            String msg = request.getParameter("msg");
            if ("exception".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin: 12px;">
                <strong>Oops!</strong> Something went wrong!!!
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
        %>
        <%
            String email = request.getParameter("email");
        %>
        <div class="col-xl-12 col-xl-6 container" style="margin-top: 10px;">
            <div class="card table-card">
                <div class="card-header">
                    <h5>Add Camp Details</h5>
                </div>
                <form method="get" action="camp_insert">
                    <div class="card-body px-0 py-0">
                        <div class="table-responsive">
                            <div class="session-scroll" style="position:relative;">
                                <table class="table table-hover m-b-0">
                                    <thead>
                                        <tr>
                                            <th colspan="3" class="bg-secondary text-white">Camp Name</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td colspan="3"><h5>Camp Name:</h5> <input class="form-control" placeholder="Camp Name" type="text" value="" name="cname" required=""></td>
                                    </tr>
                                    <thead>
                                        <tr>
                                            <th colspan="3"class="bg-secondary text-white">Address</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td colspan="3"><h5>Address:</h5> <input class="form-control" placeholder="Address" type="text" value="" name="address" required=""></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>State:</h5>
                                            <select class="form-control" name="state" id="sts">
                                                <option disabled="" selected="">Select State</option>
                                                <%                                Class.forName("com.mysql.jdbc.Driver");
                                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                                                    Statement st = con.createStatement();
                                                    ResultSet rs = st.executeQuery("select * from state");
                                                    while (rs.next()) {
                                                %>
                                                <option value="<%=rs.getString("state_id")%>"><%=rs.getString("state_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>
                                        <td>
                                            <h5>City:</h5>
                                            <div id="msg">
                                                <select name="city" class="form-control">
                                                    <option>Select City</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td><h5>Pin code:</h5> <input class="form-control" type="text" placeholder="Pin code" value="" name="pincode" required=""></td>
                                    </tr>
                                    <thead>
                                        <tr>
                                            <th colspan="3" class="bg-secondary text-white">Contact Details</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                    <input type="text" hidden="" value="<%=email%>" name="email">
                                    <td colspan="2"><h5>Email:</h5> <input class="form-control" value="<%=email%>" disabled="" type="text" placeholder="Email" required=""></td>
                                    <td><h5>Phone:</h5> <input class="form-control" type="text" placeholder="Phone" value="" name="phone"></td>
                                    </tr>
                                    <tr>
                                        <td><h5>Start Date:</h5> <input class="form-control" type="date" value=""  name="sdt" required=""></td>
                                        <td><h5>End Date:</h5> <input class="form-control" type="date" value=""  name="edt" required=""></td>
                                    </tr>

                                    <tr>
                                        <td colspan="3"><a href="#"><input type="button" data-toggle="modal" data-target="#myModal1" value="Create" class="btn btn-success"></a> 
                                            <a href="org_fpage.jsp"><input type="button" value="Cancel" class="btn btn-danger"></a></td>
                                    </tr>
                                    <!-- Modal -->
                                    <div class="modal" id="myModal1" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Create Camp</h5>
                                                    <a href="#" class="btn-close" data-dismiss="modal" aria-label="close"></a>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Are you sure you want to create this camp?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="#"><input type="submit" value="Yes" class="btn btn-primary"></a>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </div>      
                    </div>  
                </form>        
            </div>              
        </div>
    </div>
</div>
</body>
</html>
