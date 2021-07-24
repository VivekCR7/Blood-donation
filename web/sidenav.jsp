<head>    
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

</head>

<body class="">
    <!-- [ Pre-loader ] start -->
    <div class="loader-bg">
        <div class="loader-track">
            <div class="loader-fill"></div>
        </div>
    </div>
    <!-- [ Pre-loader ] End -->

    <!-- [ navigation menu ] start -->
    <nav class="pcoded-navbar menupos-fixed menu-light brand-blue ">
        <div class="navbar-wrapper ">
            <div class="navbar-brand header-logo">
                <a href="admin.jsp" class="b-brand">
                    <img src="./assets/images/logo.png" alt="" class="logo images" style="margin-left: -10px;margin-top: 5px;">
                    <img src="./assets/images/logo-icon.ico" alt="" class="logo-thumb images" style="margin-left: -7px;">
                </a>
                <a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
            </div>
            <div class="navbar-content scroll-div">
                <ul class="nav pcoded-inner-navbar">
                    <li class="nav-item pcoded-menu-caption">
                        <label>Navigation</label>
                    </li>
                    <li class="nav-item">
                        <a href="admin.jsp" class="nav-link"><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="a_dnr_details.jsp" class="nav-link"><span class="pcoded-micon"><i class="feather icon-activity"></i></span><span class="pcoded-mtext">Donor Details</span></a>
                    </li>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-droplet"></i></span><span class="pcoded-mtext">Receiver</span></a>
                        <ul class="pcoded-submenu">
                            <li class=""><a href="rec_details.jsp" class="">Details</a></li>
                            <li class=""><a href="rec_pending.jsp" class="">Pending</a></li>
                            <li class=""><a href="rec_completed.jsp" class="">Completed</a></li>
                        </ul>
                    </li>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link"><span class="pcoded-micon"><i class="feather icon-globe"></i></span><span class="pcoded-mtext">Organization</span></a>
                        <ul class="pcoded-submenu">
                            <li class=""><a href="org_details.jsp" class="">Details</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="maintain_bloodstock.jsp" class="nav-link"><span class="pcoded-micon"><i class="feather icon-package"></i></span><span class="pcoded-mtext">Maintain Bloodstock</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="manage_cities.jsp" class="nav-link"><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Manage Cities</span></a>
                    </li>
            </div>
        </div>
    </nav>
    <!-- [ navigation menu ] end -->

    <!-- [ Header ] start -->
    <header class="navbar pcoded-header navbar-expand-lg navbar-light headerpos-fixed">
        <div class="m-header">
            <a class="mobile-menu" id="mobile-collapse1" href="#!"><span></span></a>
            <a href="admin.jsp" class="b-brand">
                <img src="./assets/images/logo.svg" alt="" class="logo images">
                <img src="./assets/images/logo-icon.svg" alt="" class="logo-thumb images">
            </a>
        </div>
        <a class="mobile-menu" id="mobile-header" href="#!">
            <i class="feather icon-more-horizontal"></i>
        </a>
        <div class="collapse navbar-collapse">
            <a href="#!" class="mob-toggler"></a>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <div class="main-search open">
                        <div class="input-group">
                            <input type="text" id="m-search" class="form-control" placeholder="Search . . ." onkeyup="searchFun()">
                            <a href="#!" class="input-group-append search-close">
                                <i class="feather icon-x input-group-text"></i>
                            </a>
                            <span class="input-group-append search-btn btn btn-primary">
                                <i class="feather icon-search input-group-text"></i>
                            </span>
                        </div>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li>
                <li>
                    <div class="dropdown drp-user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon feather icon-settings"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-notification">
                            <div class="pro-head">
                                <span>Profile</span>

                                <a href="admin_logout" class="dud-logout" title="Logout">
                                    <i class="feather icon-log-out"></i>
                                </a>
                            </div>

                            <div class="card-body">
                                <center>
                                    <div class="usre-image">
                                        <img src="./assets/images/widget/img-round1.jpg" class="img-radius wid-100 m-auto" alt="User-Profile-Image">
                                    </div>
                                    <h6 class="f-w-600 m-t-25 m-b-10">
                                        <%
                                            ServletContext sc = getServletContext();
                                            String username = (String) sc.getAttribute("username");
                                            out.print(username);
                                        %></h6>
                                    <p>Active | Male | Born 23.05.1992</p>
                                </center>
                                <hr>
                                <a href="auth-signin.html" class="dropdown-item"><i class="feather icon-edit"></i> Edit</a>
                                <a href="auth-signin.html" class="dropdown-item"><i class="feather icon-lock"></i> Lock Screen</a>
                            </div>
                        </div>
                </li>
            </ul>

        </div>
    </header>
