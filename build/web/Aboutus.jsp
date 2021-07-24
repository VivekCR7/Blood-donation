<%-- 
    Document   : Aboutus
    Created on : Dec 19, 2020, 9:39:59 PM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        
        <%@include file="csscript.jsp" %>
        
    </head>
    <body style="margin-right: 12px;">

        <!---Navbar--->
        <header>
        <%@include file="nav_about.jsp" %>
        </header>

        <main>
            <div style="margin-left: 20px">
                <h1 style="
                    color: #dc3545;
                    ">
                    About Us
                </h1> 
                <hr>
                <h5>This project is build by</h5>
                    <b>SANKALP TIWARI</b><br>
                    <b>MAYUR KESARI</b><br>
                    <b>NITESH SOLANKI</b><br>
                    2020-2021<br>
                    Under the guidance of<br>
                    <b>Rashmi Pathak</b>
                    <hr>
                <p>Project on<br>
                    <b>Web Based Online Blood Donation System<br></b>
                </p>
                <hr> 
            </div>
        </main>

        <!---Footer--->

        <%@include file="footer.jsp" %>

    </body>
</html>
