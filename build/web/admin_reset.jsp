<%-- 
    Document   : admin_reset
    Created on : Mar 5, 2021, 1:21:44 PM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="Flash Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
        <meta name="keywords"
              content="admin templates, bootstrap admin templates, bootstrap 4, dashboard, dashboard templets, sass admin templets, html admin templates, responsive, bootstrap admin templates free download,premium bootstrap admin templates, Flash Able, Flash Able bootstrap admin template">


        <!-- Favicon icon -->
        <link rel="icon" href="./assets/images/favicon.ico" type="image/x-icon">
        <!-- fontawesome icon -->
        <link rel="stylesheet" href="./assets/fonts/fontawesome/css/fontawesome-all.min.css">
        <!-- animation css -->
        <link rel="stylesheet" href="./assets/plugins/animation/css/animate.min.css">

        <!-- vendor css -->
        <link rel="stylesheet" href="./assets/css/style.css">
        <script>
            function validation() {
                var username = document.form12.username.value;
                var pass = document.form12.pass.value;
                var cnfpass = document.form12.cnfpass.value;
                if (username === null || username === "") {
                    document.getElementById("username").innerHTML = "**UserName can't be blank";
                    document.getElementsByName("username")[0].style.borderColor = "red";
                    document.getElementsByName('username')[0].focus();
                    return false;
                }
                if (pass === null || pass === "") {
                    document.getElementById("pass").innerHTML = "**Password can't be blank";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (pass.length < 6)
                {
                    document.getElementById("pass").innerHTML = "***Password must be at least 6 characters long.";
                    document.getElementsByName("pass")[0].style.borderColor = "red";
                    document.getElementsByName("pass")[0].focus();
                    return false;
                }
                if (cnfpass === null || cnfpass === "") {
                    document.getElementById("cnfpass").innerHTML = "**Confirm Password can't be blank";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                } else if (pass !== cnfpass)
                {
                    document.getElementById("cnfpass").innerHTML = "***Confirm Password should match with the Password";
                    document.getElementsByName("cnfpass")[0].style.borderColor = "red";
                    document.getElementsByName("cnfpass")[0].focus();
                    return false;
                }
                return true;
            }
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("admin_reset.jsp");
                }

            }
            checkEvt();
        </script>
    </head>
    <body>
        <%
            String msg = request.getParameter("msg");
            if ("invalidusername".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-warning alert-dismissible fade show" style="margin-top: 12px;margin-bottom: -10px;">
                <strong>Invalid! USERNAME</strong>.
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
            if ("valid".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show" style="margin-top: 12px; margin-bottom: -10px">
                <strong>Success!</strong> Password Reset successful! <a href="admin_login.jsp" class="alert-link">Click here to login.</a>.
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
            if ("exception".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-top: 12px;margin-bottom: -10px;">
                <strong>Oops!</strong> Something went wrong!!! 
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
        </div>
        <%
            }
        %>
        <div class="auth-wrapper">
            <div class="auth-content container">
                <div class="card">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="card-body">
                                <img src="./images/logo-dark.png" alt="" class="img-fluid mb-4">
                                <form name="form12" method="post" action="admin_reset" onsubmit="return validation()">
                                    <h4 class="mb-3 f-w-400">Reset your Password</h4>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="feather icon-user"></i></span>
                                        </div>

                                        <input type="text" name="username" class="form-control" placeholder="Username">

                                    </div>
                                    <span id="username" style="color: red; font-weight: bold;"></span>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="feather icon-lock"></i></span>
                                        </div>
                                        <input type="password" name="pass" class="form-control" placeholder="Password">

                                    </div>
                                    <span id="pass" style="color: red; font-weight: bold;"></span>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="feather icon-lock"></i></span>
                                        </div>
                                        <input type="password" name="cnfpass" class="form-control" placeholder="Confirm Password">

                                    </div>
                                    <span id="cnfpass" style="color: red; font-weight: bold;"></span><br>
                                    <button class="btn btn-primary mb-4">Reset</button>
                                    <p class="mb-2">Already have an account? <a href="admin_login.jsp" class="f-w-400">Log in</a></p>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6 d-none d-md-block">
                            <img src="./images/auth-bg.jpg" alt="" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ auth-signup ] end -->

        <!-- Required Js -->
        <script src="./assets/js/vendor-all.min.js"></script>
        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
