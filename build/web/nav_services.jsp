<!doctype html>
<html>
    <head>
        <style>
            .navbar-dark .navbar-brand {
                color: #4A0100;
                font-weight: 700;
            }
            .navbar-dark .navbar-nav .nav-link {
                color: #4A0100;
                font-weight: 500;

            }
            .navbar-dark .navbar-brand:focus, .navbar-dark .navbar-brand:hover {
                color: #4A0100;
            }
        </style>

        <script src="jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js" defer></script>
        <script>
            $(".nav a").on("click", function () {
                $(".nav").find(".active").removeClass("active");
                $(this).parent().addClass("active");
            });
        </script>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-danger" style="background-color: #FE2C54!important;margin-right: -12px;">


            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">BLOOD DONATION SYSTEM</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" 
                        aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle " href="#" id="navbarDropdownMenuLink" role="button" 
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Log In
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="Donor_signin.jsp">Donor Login</a></li>
                                <li><a class="dropdown-item" href="Receiver_signin.jsp">Receiver Login</a></li>
                                <li><a class="dropdown-item" href="Org_signin.jsp">Organization Login</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" role="button" 
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Services
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="Receiver_signup.jsp">Raise Request for blood</a></li>
                                <li><a class="dropdown-item" href="Donor_signup.jsp">Donor Registration</a></li>
                                <li><a class="dropdown-item" href="org_signup.jsp">Organization Registration</a></li>
                                <div class="dropdown-divider"></div>
                                <li><a class="dropdown-item" href="nearby_bloodbank.jsp">Blood Availability</a></li>
                                <li><a class="dropdown-item" href="check_camp.jsp">Ongoing Camp Details</a></li>
                                <li><a class="dropdown-item" href="without_reg.jsp">Request Without Registration</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Aboutus.jsp">About Us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>