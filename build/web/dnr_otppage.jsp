<%-- 
    Document   : dnr_otppage
    Created on : Jan 30, 2021, 8:10:48 PM
    Author     : Mayur Kesari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Otp Verification</title>

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
                var otp = document.form1.otp.value;

                if (otp === null || otp === "") {
                    document.getElementById("semail").innerHTML = "**OTP can't be blank";
                    document.getElementsByName("otp")[0].style.borderColor = "red";
                    return false;
                }

                if (otp.length < 6) {
                    document.getElementById("semail").innerHTML = "**Invalid";
                    document.getElementsByName("otp")[0].style.borderColor = "red";
                    return false;
                }
                return true;
            }
            function checkEvt() {
                var evTypep = window.performance.getEntriesByType("navigation")[0].type;
                if (evTypep == 'reload') {
                    window.location.replace("dnr_otppage.jsp");
                }

            }
            checkEvt();
        </script>
    </head>
    <body>
        <%
            session.setMaxInactiveInterval(300);
            String msg = request.getParameter("msg");
            try {
                if ("valid".equals(msg)) {
                    response.sendRedirect("Donor_signup.jsp?msg=valid");
                }
                if ("invalidotp".equals(msg)) {
        %>
        <div class="container">
            <div class="alert alert-danger alert-dismissible fade show" style="margin-top : 10px;">
                <strong>Please enter valid OTP.</strong> 
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                System.out.print(e);
                response.sendRedirect("Donor_signup.jsp?msg=exception");
            }
        %>
        <div class="container" style="margin-top : 10px; margin-bottom: -40px;">
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading">VERIFY YOUR E-MAIL ADDRESS</h4>
                <%
                    ServletContext sc = getServletContext();
                    String fname = (String) sc.getAttribute("fname");
                    String email = (String) sc.getAttribute("email");
                    if(fname.equals(null)){
                       response.sendRedirect("Donor_signup.jsp?msg=exception"); 
                    }
                    else if(email.equals(null)){
                       response.sendRedirect("Donor_signup.jsp?msg=exception"); 
                    }
                %>
                <p><strong><%out.print(fname);%></strong>, A text with a One Time Password (OTP) has been sent to your e-mail address : <strong><%out.print(email);%></strong>.</p>
                <hr>
                <p class="mb-0">Please, do not REFRESH or hit BACK button.</p>
            </div>
        </div>
        <div class="form1">    
            <main class="form-signin">
                <form name="form1" class="text-center" method="post" action="dnr_otp" onsubmit="return validate()">
                    <div class="shadow p-3 mb-5 bg-white rounded" id="shadow">
                        <img class="mb-4" src="images/otp.png" alt="" width="72" height="57" style="margin : 20px;">
                        <h1 class="h3 mb-3 fw-normal text-dark">OTP Verification</h1>
                        <hr>
                        <label for="inputEmail" class="visually-hidden">Enter OTP</label>
                        <input type="number" id="inputEmail" maxlength="6" class="form-control" name="otp" placeholder="Enter OTP" >
                        <span id="semail" style="color: red; font-weight: bold;"></span>
                        <br>
                        <button class="w-100 btn btn-lg btn-warning" type="submit">Verify</button>
                        <a href="resendOtp"><input type="button" id="forgot_pass" value="Resend OTP" class="w-100 btn btn-lg btn-secondary"></a>

                    </div>
                </form>
            </main>
        </div>
    </body>
</html>
