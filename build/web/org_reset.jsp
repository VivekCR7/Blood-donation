<%-- 
    Document   : org_reset
    Created on : Mar 12, 2021, 12:46:30 AM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Organization Edit</title>
        <link rel="stylesheet" href="style.css">
        <%@include file="nav_org.jsp" %>
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
                    document.getElementById("email").innerHTML = "**Password can't be blank";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (pass.length < 6)
                {
                    document.getElementById("email").innerHTML = "***Password must be at least 6 characters long.";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (cnfpass === null || cnfpass === "") {
                    document.getElementById("email").innerHTML = "**Confirm Password can't be blank";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                } else if (pass !== cnfpass)
                {
                    document.getElementById("email").innerHTML = "***Confirm Password should match with the Password";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                }
                return true;
            }
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
            String email = request.getParameter("email");
        %>
        <div class="form1">    
            <main class="form-signin">
                <div>
                    <form name="form1" class="text-center" method="get" action="org_forgot" onsubmit="return validate()">
                        <div class="shadow p-3 mb-5 bg-white rounded" id="shadow">
                            <img class="mb-4" src="images/signin.png" alt="" width="72" height="57">
                            <h1 class="h3 mb-3 fw-normal" style="color: #212529">RESET PASSWORD</h1>
                            <hr>
                            <div>
                                <span id="email" style="color: red; font-weight: bold;"></span>
                                <input type="text" name="email" value="<%out.print(email);%>" hidden="">
                                <input type="email" value="<%out.print(email);%>" disabled="" class="form-control" placeholder="Email">
                            </div>
                            <div>
                                <input type="password" name="pass" class="form-control" style="margin-top: 5px;" placeholder="New Password">
                            </div>
                            <div>
                                <input type="password" name="cnfpass" class="form-control" style="margin-top: -5px;" placeholder="Confirm Password">
                            </div>
                            <button class="w-100 btn btn-lg btn-dark" type="submit" >Submit</button>
                        </div>
                    </form>
                </div>
            </main>
        </div> 
    </body>
</html>
