<%-- 
    Document   : org_signup
    Created on : Dec 19, 2020, 9:11:51 PM
    Author     : Mayur Kesari
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organization Signup</title>

        <%@include file="csscript.jsp" %>

        <script>
            function validate()
            {
                var oname = document.form12.oname.value;
                var email = document.form12.email.value;
                var address = document.form12.address.value;
                var state = document.form12.state.value;
                var city = document.form12.city.value;
                var pincode = document.form12.pincode.value;
                var phone = document.form12.phone.value;
                var pass = document.form12.pass.value;
                var cnfpass = document.form12.cnfpass.value;


                if (oname === null || oname === "") {
                    document.getElementById("orgname").innerHTML = "**First Name can't be blank";
                    document.getElementsByName("oname")[0].style.borderColor = "red";
                    document.getElementsByName("oname")[0].focus();
                    return false;
                } else if (oname.length < 2)
                {
                    document.getElementById("lenname").innerHTML = "***Name must at least contain 2 or more characters.";
                    document.getElementsByName("oname")[0].style.borderColor = "red";
                    document.getElementsByName("oname")[0].focus();
                    return false;

                }
                if (address === null || address === "") {
                    document.getElementById("oaddress").innerHTML = "**Address can't be blank";
                    document.getElementsByName("address")[0].style.borderColor = "red";
                    document.getElementsByName("address")[0].focus();
                    return false;
                }
                if (email === null || email === "") {
                    document.getElementById("oemail").innerHTML = "**Email can't be blank";
                    document.getElementsByName("email")[0].style.borderColor = "red";
                    document.getElementsByName("email")[0].focus();
                    return false;
                }
                if (state === "Select State")
                {
                    document.getElementById("ostate").innerHTML = "**Please select State!";
                    document.getElementsByName("state")[0].style.borderColor = "red";
                    document.getElementsByName("state")[0].focus();
                    return false;
                }
                if (city === "Select City")
                {
                    document.getElementById("ocity").innerHTML = "**Please select City!";
                    document.getElementsByName("city")[0].style.borderColor = "red";
                    document.getElementsByName("city")[0].focus();
                    return false;
                }
                if (pincode === null || pincode === "") {
                    document.getElementById("opincode").innerHTML = "**Pincode can't be blank";
                    document.getElementsByName("pincode")[0].style.borderColor = "red";
                    document.getElementsByName("pincode")[0].focus();
                    return false;
                }
                if (pincode.length < 6 || pincode.length > 6)
                {
                    document.getElementById("opincode").innerHTML = "***Invalid.";
                    document.getElementsByName("pincode")[0].style.borderColor = "red";
                    document.getElementsByName("pincode")[0].focus();
                    return false;
                }
                if (phone === null || phone === "") {
                    document.getElementById("ophone").innerHTML = "**Phone can't be blank";
                    document.getElementsByName("phone")[0].style.borderColor = "red";
                    document.getElementsByName("phone")[0].focus();
                    return false;
                }
                if (pass === null || pass === "") {
                    document.getElementById("opass").innerHTML = "**Password can't be blank";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (cnfpass === null || cnfpass === "") {
                    document.getElementById("ocnfpass").innerHTML = "**Confirm Password can't be blank";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                } else if (pass.length < 6)
                {
                    document.getElementById("lenpass").innerHTML = "***Password must be at least 6 characters long.";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                } else if (pass !== cnfpass)
                {
                    document.getElementById("recnfpass").innerHTML = "***Confirm Password should match with the Password";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                }
                return true;
            }

            $(document).ready(function () {
                $("#sts").on("change", function () {
                    var id = $("#sts").val();

                    $("#error").html("");
                    $.ajax({
                        url: "fetch1.jsp",
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
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("org_signup.jsp");
                }

            }
            checkEvt();
        </script>

    </head>
    <body style="margin-right: 12px;">

        <!---Navbar--->

        <header>
            <%@include file="nav_services.jsp" %>
        </header>

        <%
            String msg = request.getParameter("msg");
            if ("valid".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show" style="margin-right: -12px; margin-top:  12px; margin-right: -1px; margin-bottom: -35px;">
                <strong>Success!</strong> Registered successfully! <a href="Org_signin.jsp" class="alert-link">Click here to login.</a>.
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
            if ("invalidemail".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin-top:  12px; margin-right: -1px; margin-bottom: -35px;">
                <strong>E-mail</strong> already exists!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
            if ("invalidphone".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin-top:  12px; margin-right: -1px; margin-bottom: -35px;">
                <strong>Phone Number</strong> already exists!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
            if ("exception".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin-top: 12px; margin-right: -1px; margin-bottom: -35px;">
                <strong>Oops!</strong> Something went wrong! Please try again!!!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
        %>

        <!---Org Signup Form--->
        <br>
        <br>

        <%
            int id = 1;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                PreparedStatement ps = null;
                ps = con.prepareStatement("select max(id) from org_signup");
                ResultSet rs = ps.executeQuery();
                if (rs.first()) {
                    id = rs.getInt(1);
                    id = id + 1;
                }%>

<!--- to print id <h1> id:<%out.print(id);%></h1> --->
        <%
            } catch (Exception e) {
                System.out.print(e);
                response.sendRedirect("org_signup.jsp?msg=exception");
            }

        %>

        <div class="container wrapper">
            <div class="page-header">
                <div class="form-horizontal">
                    <form name="form12" method="get" action="org_signup" onsubmit="return validate()">
                        <div class="shadow p-3 mb-5 bg-white rounded" id="shadow">
                            <br>

                            <h2 class="text-danger" align="center">Organization SIGN-UP</h2>
                            <hr>

                            <input type="hidden" name="id" value="<% out.print(id);%>">

                            <div class="form-group">
                                <label for="form_name">Organization Name <font color="red">*</font></label>
                                <input id="form_name" type="text" name="oname" class="form-control" placeholder="Organization Name"  data-error="name is required." size="50">
                                <span id="orgname" style="color: red; font-weight: bold;"></span><br>
                                <span id="lenname" style="color: red; font-weight: bold;"></span>
                                <div class="help-block with-errors"></div>


                            </div>


                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="form_phone">Address <font color="red">*</font></label>
                                    <textarea class="form-control" name="address" placeholder="Address"></textarea> 
                                    <span id="oaddress" style="color: red; font-weight: bold;"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="form_email">E-mail <font color="red">*</font></label>
                                        <input id="form_email" type="email" name="email" class="form-control" placeholder="E-mail" data-error="Valid email is required.">
                                        <span id="oemail" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Select State <font color="red">*</font></label>
                                        <select class="form-select" id="sts" name ="state">
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
                                        <span id="ostate" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Select City <font color="red">*</font></label>
                                        <div id="msg">
                                            <select name="city" class="form-select">
                                                <option>Select City</option>
                                            </select>
                                        </div>
                                        <span id="ocity" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_phone">Pin Code <font color="red">*</font></label>
                                        <input id="form_phone" type="number" maxlength="6" name="pincode" class="form-control" placeholder="Pin Code">
                                        <span id="opincode" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_phone">Phone <font color="red">*</font></label>
                                        <input id="form_phone" type="tel" pattern="[0-9]{10}" name="phone" maxlength="10" class="form-control" placeholder="Phone Number">
                                        <span id="ophone" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Password <font color="red">*</font></label>
                                        <input id="form_name" type="Password" name="pass" class="form-control" placeholder="Password"  data-error="Password is required.">
                                        <span id="opass" style="color: red; font-weight: bold;"></span><br>
                                        <span id="lenpass" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Confirm Password <font color="red">*</font></label>
                                        <input id="form_name" type="Password"  name="cnfpass" class="form-control" placeholder="Confirm Password" data-error="Password is required.">
                                        <span id="ocnfpass" style="color: red; font-weight: bold;"></span><br>
                                        <span id="recnfpass" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <br>

                                <div class="col-md-12"></div>
                                <center>
                                    <input type="submit" value="SIGN UP" id="signup_btn" class="btn btn-danger btn-lg" name="submit" />
                                </center>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!---footer--->

        <%@include file="footer.jsp" %>

    </body>
</html>
