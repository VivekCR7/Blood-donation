<%-- 
    Document   : dnr_forgot
    Created on : Dec 27, 2020, 9:15:27 PM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receiver Forgot Password</title>
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
                var cnfpass = document.form1.cnfpass.value;

                if (email === null || email === "") {
                    document.getElementById("email").innerHTML = "**Email can't be blank";
                    document.getElementsByName("email")[0].style.borderColor = "red";
                    document.getElementsByName("email")[0].focus();
                    return false;
                }
                if (pass === null || pass === "") {
                    document.getElementById("email").innerHTML="**Password can't be blank";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (pass.length < 6)
                {
                    document.getElementById("email").innerHTML ="***Password must be at least 6 characters long.";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (cnfpass === null || cnfpass === "") {
                    document.getElementById("email").innerHTML="**Confirm Password can't be blank";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                }
                  else if (pass !== cnfpass)
                {
                    document.getElementById("email").innerHTML ="***Confirm Password should match with the Password";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                } 
                return true;
            }
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("rec_forgot.jsp");
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
            if ("invalidemail".equals(msg)) {
        %>
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>E-mail</strong> doesn't exists!
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        <%
            }
        if ("exception".equals(msg)) {
        %>
            <div class="alert alert-danger alert-dismissible fade show" style="margin-right: -12px; margin: 12px; margin-right: -1px; margin-bottom: -35px">
                <strong>Oops!</strong> Something went wrong.
                <button type="button" class="btn-close" data-dismiss="alert"></button>
            </div>
        <%
            }
        %>
        <div class="form1">    
            <main class="form-signin">
                <form name="form1" class="text-center" method="get" action="rec_forgot" onsubmit="return validate()">
                    <div class="shadow p-3 mb-5 bg-white rounded" id="shadow">
                        <img class="mb-4" src="images/signin.png" alt="" width="72" height="57">
                        <h1 class="h3 mb-3 fw-normal" style="color: #dc3545">FORGOT PASSWORD</h1>
                        <hr>
                        <div>
                        <span id="email" style="color: red; font-weight: bold;"></span>
                        <input type="email" name="email" class="form-control" placeholder="Email">
                        </div>
                        <div>
                        <input type="password" name="pass" class="form-control" style="margin-top: 5px;" placeholder="New Password">
                        </div>
                        <div>
                        <input type="password" name="cnfpass" class="form-control" style="margin-top: -5px;" placeholder="Confirm Password">
                        </div>
                        <button class="w-100 btn btn-lg btn-danger" type="submit">Submit</button>

                    </div>
                </form>
            </main>
        </div>

        <!---Footer--->

        <%@include file="footer.jsp" %>
    </body>
</html>
