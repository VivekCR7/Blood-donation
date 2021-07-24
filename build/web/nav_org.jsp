<head>
    <style>
        .nav-item{
            color: white;
        }
    </style>
    <link rel="icon" href="./assets/images/homefavicon.ico" type="image/x-icon">
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="./assets/css/style4.css">

    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

    <%
        String eemail = request.getParameter("email");
        if (eemail.equals("null")) {
            response.sendRedirect("Org_signin.jsp");
        }
    %>

<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>ORGANIZATION</h3>
            <strong style="margin-left:-10px;">ORG</strong>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
                <a href="org_fpage.jsp?email=<%out.print(eemail);%>">
                    <i class="fas fa-home"></i>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fas fa-hospital"></i>
                    Camp
                </a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li>
                        <a href="add_camp.jsp?email=<%out.print(eemail);%>">Add Camp</a>
                    </li>
                    <li>
                        <a href="view_camp.jsp?email=<%out.print(eemail);%>">View Camp</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="dnr_details.jsp?email=<%out.print(eemail);%>">
                    <i class="fas fa-user"></i>
                    Donor Details
                </a>
            </li>
            <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-asterisk"></i>
                        Blood Requests
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="rec_request.jsp?email=<%out.print(eemail);%>">Pending</a>
                        </li>
                        <li>
                            <a href="rec_requestcomp.jsp?email=<%out.print(eemail);%>">Completed</a>
                        </li>
                    </ul>
                </li>
        </ul>
    </nav>

    <!-- Page Content  -->
    <div id="content">
        <nav class="navbar navbar-expand-lg navbar bg-dark">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn" style="background-color: #fff">
                    <i class="fas fa-align-left"></i>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-right:-35px;">
                    <i class="fas fa-align-justify"></i>
                </button>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-list-4" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbar-list-4" >
                    <ul class="navbar-nav ml-auto" style="margin-right:70px;">
                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg" width="40" height="40" class="rounded-circle">
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                                <a class="dropdown-item" href="org_edit.jsp?email=<%=eemail%>">Edit Profile</a>
                                <a class="dropdown-item" href="org_reset.jsp?email=<%=eemail%>">Reset Password</a>
                                <a class="dropdown-item" href="org_logout">Log Out</a>
                            </div>
                        </li>   
                    </ul>
                </div>
            </div>
        </nav>

        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>
        </head>
