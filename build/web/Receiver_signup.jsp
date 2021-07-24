<%-- 
    Document   : Receiver_signup
    Created on : Dec 19, 2020, 9:33:44 PM
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
        <title>Receiver Signup</title>

        <%@include file="csscript.jsp" %>

        <script>
            function validate()
            {
                var fname = document.form12.fname.value;
                var lname = document.form12.lname.value;
                var dob = document.form12.dob.value;
                var email = document.form12.email.value;
                var gender = document.form12.gender.value;
                var address = document.form12.address.value;
                var state = document.form12.state.value;
                var pincode = document.form12.pincode.value;
                var phone = document.form12.phone.value;
                var bldgrp = document.form12.bldgrp.value;
                var pass = document.form12.pass.value;
                var cnfpass = document.form12.cnfpass.value;


                if (fname === null || fname === "") {
                    document.getElementById("rfname").innerHTML = "**First Name can't be blank";
                    document.getElementsByName("fname")[0].style.borderColor = "red";
                    document.getElementsByName("fname")[0].focus();
                    return false;
                } else if (fname.length < 2)
                {
                    document.getElementById("lenfname").innerHTML = "***First Name must at least contain 2 or more characters.";
                    document.getElementsByName("fname")[0].style.borderColor = "red";
                    document.getElementsByName("fname")[0].focus();
                    return false;
                }
                if (lname === null || lname === "") {
                    document.getElementById("rlname").innerHTML = "**Last Name can't be blank";
                    document.getElementsByName("lname")[0].style.borderColor = "red";
                    document.getElementsByName("lname")[0].focus();
                    return false;
                } else if (lname.length < 2)
                {
                    document.getElementById("lenlname").innerHTML = "***Last Name must at least contain 2 or more characters.";
                    document.getElementsByName("lname")[0].style.borderColor = "red";
                    document.getElementsByName("lname")[0].focus();
                    return false;
                }
                if (dob === null || dob === "") {
                    document.getElementById("rdob").innerHTML = "**DOB can't be blank";
                    document.getElementsByName("dob")[0].style.borderColor = "red";
                    document.getElementsByName("dob")[0].focus();
                    return false;
                }
                if (gender === "Select Gender")
                {
                    document.getElementById("rgender").innerHTML = "**Please select Gender!";
                    document.getElementsByName("gender")[0].style.borderColor = "red";
                    document.getElementsByName("gender")[0].focus();
                    return false;
                }
                if (email === null || email === "") {
                    document.getElementById("remail").innerHTML = "**Email can't be blank";
                    document.getElementsByName("email")[0].style.borderColor = "red";
                    document.getElementsByName("email")[0].focus();
                    return false;
                }
                if (address === null || address === "") {
                    document.getElementById("raddress").innerHTML = "**Address can't be blank";
                    document.getElementsByName("address")[0].style.borderColor = "red";
                    return false;
                }
                if (state === "Select State")
                {
                    document.getElementById("rstate").innerHTML = "**Please select State!";
                    document.getElementsByName("state")[0].style.borderColor = "red";
                    document.getElementsByName("state")[0].focus();
                    return false;
                }
                if (pincode === null || pincode === "") {
                    document.getElementById("rpincode").innerHTML = "**Pincode can't be blank";
                    document.getElementsByName("pincode")[0].style.borderColor = "red";
                    document.getElementsByName("pincode")[0].focus();
                    return false;
                }
                if (pincode.length < 6 || pincode.length > 6)
                {
                    document.getElementById("rpincode").innerHTML = "***Invalid.";
                    document.getElementsByName("pincode")[0].style.borderColor = "red";
                    document.getElementsByName("pincode")[0].focus();
                    return false;
                }
                if (phone === null || phone === "") {
                    document.getElementById("rphone").innerHTML = "**Phone can't be blank";
                    document.getElementsByName("phone")[0].style.borderColor = "red";
                    document.getElementsByName("phone")[0].focus();
                    return false;
                }
                if (bldgrp === "Select Blood Group")
                {
                    document.getElementById("rbldgrp").innerHTML = "**Please select Blood Group!";
                    document.getElementsByName("bldgrp")[0].style.borderColor = "red";
                    document.getElementsByName("bldgrp")[0].focus();
                    return false;
                }
                if (pass === null || pass === "") {
                    document.getElementById("rpass").innerHTML = "**Password can't be blank";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (cnfpass === null || cnfpass === "") {
                    document.getElementById("rcnfpass").innerHTML = "**Confirm Password can't be blank";
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
                    window.location.replace("Receiver_signup.jsp");
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
            <div class="alert alert-success alert-dismissible fade show" style="margin-right: -12px; margin-top: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>Success!</strong> Registered successfully! <a href="Receiver_signin.jsp" class="alert-link">Click here to login.</a>.
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
            if ("invalidemail".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin-top: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>E-mail</strong> already exists!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
            if ("invalidphone".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin-top: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>Phone Number</strong> already exists!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
            if ("exception".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin-top: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>Oops!</strong> Something went wrong! Please try again!!!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        </div>
        <%
            }
        %>

        <!---Receiver Form--->
        <br>
        <br>

        <%
            int id = 1;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                PreparedStatement ps = null;
                ps = con.prepareStatement("select max(id) from rec_signup");
                ResultSet rs = ps.executeQuery();
                if (rs.first()) {
                    id = rs.getInt(1);
                    id = id + 1;
                }%>

<!--- to print id <h1> id:<%out.print(id);%></h1> --->
        <%
            } catch (Exception e) {
                System.out.print(e);
                response.sendRedirect("Receiver_signup.jsp?msg=exception");
            }

        %>

        <div class="container wrapper">
            <div class="page-header">
                <div class="form-horizontal">
                    <form name="form12" method="post" action="rec_signup" onsubmit="return validate()">
                        <div class="shadow p-3 mb-5 bg-white rounded" id="shadow">
                            <br>

                            <h2 class="text-danger" align="center">RECEVIER SIGN-UP</h2>
                            <hr>
                            <div class="row">

                                <input type="hidden" name="id" value="<% out.print(id);%>">

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">First Name <font color="red">*</font></label>
                                        <input id="form_name" type="text" name="fname" class="form-control" placeholder="First Name"  data-error="name is required.">
                                        <span id="rfname" style="color: red; font-weight: bold;"></span><br>
                                        <span id="lenfname" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Middle Name</label>
                                        <input id="form_name" type="text" name="mname" class="form-control" placeholder="Middle Name">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Last Name <font color="red">*</font></label>
                                        <input id="form_name" type="text" name="lname" class="form-control" placeholder="Last Name" data-error="name is required.">
                                        <span id="rlname" style="color: red; font-weight: bold;"></span><br>
                                        <span id="lenlname" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Date Of Birth <font color="red">*</font></label>
                                        <input id="form_name" type="Date" name="dob" min="1970-01-01" max="2018-12-31" class="form-control"  data-error="name is required.">
                                        <span id="rdob" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Gender <font color="red">*</font></label>
                                        <select class="form-select" name="gender"  data-error="Gender is required.">
                                            <option value="Select Gender">Select Gender</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                        <div class="help-block with-errors"></div>
                                        <span id="rgender" style="color: red; font-weight: bold;"></span>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_email">E-mail <font color="red">*</font></label>
                                        <input id="form_email" type="email" name="email" class="form-control" placeholder="E-mail" data-error="Valid email is required.">
                                        <span id="remail" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>


                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label for="form_phone">Address <font color="red">*</font></label>
                                        <textarea class="form-control" name="address" placeholder="Address" rows="1"></textarea> 
                                        <span id="raddress" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>	

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Select State <font color="red">*</font></label>
                                        <select class="form-select" id="sts" name ="state" >
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
                                        <span id="rstate" style="color: red; font-weight: bold;"></span>
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
                                        <span id="rcity" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_phone">Pin Code <font color="red">*</font></label>
                                        <input id="form_phone" type="number" maxlength="6" name="pincode" class="form-control" placeholder="Pin Code">
                                        <span id="rpincode" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>


                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_phone">Phone <font color="red">*</font></label>
                                        <input id="form_phone" type="tel" pattern="[0-9]{10}" name="phone" maxlength="10" class="form-control" placeholder="Phone Number">
                                        <span id="rphone" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Blood Group <font color="red">*</font></label>
                                        <select class="form-select" name="bldgrp"  data-error="Gender is required.">
                                            <option value="Select Blood Group">Select Blood Group</option>
                                            <option>A positive (A+)</option>
                                            <option>A negative (A-)</option>
                                            <option>B positive (B+)</option>
                                            <option>B negative (B-)</option>
                                            <option>AB positive (AB+)</option>
                                            <option>AB negative (AB-)</option>
                                            <option>O positive (O+)</option>
                                            <option>O negative (O-)</option>
                                        </select>
                                        <span id="rbldgrp" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Password <font color="red">*</font></label>
                                        <input id="form_name" type="Password"  name="pass" class="form-control" placeholder="Password"  data-error="Password is required.">
                                        <span id="rpass" style="color: red; font-weight: bold;"></span><br>
                                        <span id="lenpass" style="color: red; font-weight: bold;"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="form_name">Confirm Password <font color="red">*</font></label>
                                        <input id="form_name" type="Password"  name="cnfpass" class="form-control" placeholder="Confirm Password"  data-error="Password is required.">
                                        <span id="rcnfpass" style="color: red; font-weight: bold;"></span><br>
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

        <!---Footer--->

        <%@include file="footer.jsp" %>

    </body>
</html>
