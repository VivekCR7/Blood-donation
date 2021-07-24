<%-- 
    Document   : main_nav
    Created on : Mar 7, 2021, 7:05:09 PM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <style>
        .bg-custom-1 {
            background-color: #85144b;
        }

        .bg-custom-2 {
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
        }
    </style>
    
    <%
    String eemail = request.getParameter("email");
    if(eemail.equals("null")){
        response.sendRedirect("Donor_signin.jsp");
    }
    %>
    
<nav class="navbar navbar-dark bg-dark navbar-expand-sm" style="height:55px;">
    <a class="navbar-brand" href="#" style="margin-left:70px;">
        <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/logo_white.png" width="30" height="30" alt="logo">
        DONOR
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-list-4" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbar-list-4" >
        <ul class="navbar-nav ms-auto" style="margin-right:70px;">
            <li class="nav-item dropdown " >
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg" width="40" height="40" class="rounded-circle">
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="dnr_edit.jsp?email=<%=eemail%>">Edit Profile</a>
                    <a class="dropdown-item" href="dnr_reset.jsp?email=<%=eemail%>">Reset Password</a>
                    <a class="dropdown-item" href="dnr_logout">Log Out</a>
                </div>
            </li>   
        </ul>
    </div>
</nav>
<!-- Required Js -->
        <script src="./assets/js/vendor-all.min.js"></script>
        <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>
