<%-- 
    Document   : Donor_signin
    Created on : Dec 19, 2020, 9:30:00 PM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Donor Signin</title>

        <%@include file="csscript.jsp" %>
        <style>


            .form1 {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #f5f5f5;
            }

            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <script>
            function validate()
            {
                var email = document.form1.email.value;
                var pass = document.form1.pass.value;

                if (email === null || email === "") {
                    document.getElementById("semail").innerHTML = "**Email can't be blank";
                    document.getElementsByName("email")[0].style.borderColor = "red";
                    document.getElementsByName("email")[0].focus();
                    return false;
                }
                if (pass === null || pass === "") {
                    document.getElementById("spass").innerHTML = "**Password can't be blank";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                return true;
            }
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("Donor_signin.jsp");
                }

            }
            checkEvt();
        </script>

    </head>
    <body style="margin-right: 12px;">

        <!---Navbar--->
        <header>
            <%@include file="nav_login.jsp" %>
        </header>

        <%
            String msg = request.getParameter("msg");
            if ("invalid".equals(msg)) {
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin-right: -12px; margin: 12px; margin-right: -1px; margin-bottom: -35px">
            Incorrect <strong>E-mail</strong> or <strong>Password</strong>!!!
            <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true"></span>
            </button>
        </div>
        <%
            }
            if ("valid".equals(msg)) {
        %>
            <div class="alert alert-success alert-dismissible fade show" style="margin-right: -12px; margin: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>Success!</strong> Password changed! Please login Here.
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        <%
            }
            if ("exception".equals(msg)) {
        %>
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>Oops!</strong> Something went wrong! Please try again!!!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        <%
            }
        %>

        <div class="form1">    
            <main class="form-signin">
                <form name="form1" class="text-center" method="get" action="dnr_login" onsubmit="return validate()">
                    <div class="shadow p-3 mb-5 bg-white rounded" id="shadow">
                        <img class="mb-4" src="images/signin.png" alt="" width="72" height="57">
                        <h1 class="h3 mb-3 fw-normal" style="color: #dc3545">DONOR SIGNIN</h1>
                        <hr>
                        <label for="inputEmail" class="visually-hidden">Email address</label>
                        <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Email address" >
                        <span id="semail" style="color: red; font-weight: bold;"></span>
                        <label for="inputPassword" class="visually-hidden">Password</label>
                        <input type="password" id="inputPassword" name="pass" class="form-control" placeholder="Password" >
                        <span id="spass" style="color: red; font-weight: bold;"></span>
                        <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Remember me
                            </label>
                            <br>
                            <a href="Donor_signup.jsp"><input type="button" value="New User" class="w-100 btn btn-lg btn-light"></a>
                            <br>
                        </div>
                        <button class="w-100 btn btn-lg btn-danger" type="submit">Sign in</button>
                        <a href="dnr_forgot.jsp"><input type="button" id="forgot_pass" value="Forgot Password" class="w-100 btn btn-lg btn-secondary"></a>

                    </div>
                </form>
            </main>
        </div>

        <!---Footer--->

        <%@include file="footer.jsp" %>
    </body>
</html>
