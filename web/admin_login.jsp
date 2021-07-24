<%-- 
    Document   : admin_login
    Created on : Mar 5, 2021, 11:42:18 AM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
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
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("admin_login.jsp");
                }

            }
            checkEvt();
        </script>
    </head>
    <body>
        <%
            String msg = request.getParameter("msg");
            if ("invalid".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-top: 12px;margin-bottom: -10px;">
                <strong>Invalid!</strong> Email or Password.
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
            if ("registered".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-success alert-dismissible fade show" style="margin-top: 12px;margin-bottom: -10px;">
                <strong>Registered Successfully!</strong> Please Login!!! 
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
                                <h4 class="mb-3 f-w-400">Login into your account</h4>
                                <form method="post" action="admin_login">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="feather icon-user"></i></span>
                                        </div>
                                        <input type="text" name="username" class="form-control" placeholder="Username">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="feather icon-lock"></i></span>
                                        </div>
                                        <input type="password" name="pass" class="form-control" placeholder="Password">
                                    </div>

                                    <div class="form-group text-left mt-2">
                                        <div class="checkbox checkbox-primary d-inline">
                                            <input type="checkbox" name="checkbox-fill-1" id="checkbox-fill-a1" checked="">
                                            <label for="checkbox-fill-a1" class="cr"> Save credentials</label>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary mb-4">Login</button>
                                    <p class="mb-2 text-muted">Forgot password? <a href="admin_reset.jsp" class="f-w-400">Reset</a></p>
                                    <p class="mb-0 text-muted">Don’t have an account? <a href="admin_signup.jsp" class="f-w-400">Signup</a></p>
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
        <!-- [ auth-signin ] end -->

        <!-- Required Js -->
        <script src="./assets/js/vendor-all.min.js"></script>
        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
