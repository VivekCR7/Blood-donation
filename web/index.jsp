<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage Page</title>

        <%@include file="csscript.jsp" %>

        <style>
            /* GLOBAL STYLES
-------------------------------------------------- */
            /* Padding below the footer and lighter body text */

            body {
                padding-bottom: 3rem;
                color: #5a5a5a;
            }


            /* CUSTOMIZE THE CAROUSEL
            -------------------------------------------------- */

            /* Carousel base class */
            .carousel {
                margin-bottom: 4rem;
            }
            /* Since positioning the image, we need to help out the caption */
            .carousel-caption {
                bottom: 3rem;
                z-index: 10;
            }

            /* Declare heights because of positioning of img element */
            .carousel-item {
                height: 32rem;
            }
            .carousel-item > img {
                position: absolute;
                top: 0;
                left: 0;
                min-width: 100%;
                height: 32rem;
            }


            /* MARKETING CONTENT
            -------------------------------------------------- */

            /* Center align the text within the three columns below the carousel */
            .marketing .col-lg-4 {
                margin-bottom: 1.5rem;
                text-align: center;
            }
            .marketing h2 {
                font-weight: 400;
            }
            /* rtl:begin:ignore */
            .marketing .col-lg-4 p {
                margin-right: .75rem;
                margin-left: .75rem;
            }
            /* rtl:end:ignore */


            /* Featurettes
            ------------------------- */

            .featurette-divider {
                margin: 5rem 0; /* Space out the Bootstrap <hr> more */
            }

            /* Thin out the marketing headings */
            .featurette-heading {
                font-weight: 300;
                line-height: 1;
                /* rtl:remove */
                letter-spacing: -.05rem;
            }


            /* RESPONSIVE CSS
            -------------------------------------------------- */

            @media (min-width: 40em) {
                /* Bump up size of carousel content */
                .carousel-caption p {
                    margin-bottom: 1.25rem;
                    font-size: 1.25rem;
                    line-height: 1.4;
                }

                .featurette-heading {
                    font-size: 50px;
                }
            }

            @media (min-width: 62em) {
                .featurette-heading {
                    margin-top: 7rem;
                }
            }
            @media (min-width: 992px)
            {
                .col-lg-4 {
                    flex: 0 0 auto;
                    width: 31.3333333333%;
                }}
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

    </head>

    <body style="margin-right: 12px;">

        <header>
            <!---navbar--->
            <%@include file="navbar.jsp" %>
        </header>

        <main>

            <!---Slider--->

            <div id="myCarousel" class="carousel slide" style="margin-right: -12px;" data-bs-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
                    <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" style="margin-top: 6px;">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="images\slide1.png"
                             alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images\slide2.jpg"
                             alt="Second slide">

                        <div class="container">
                            <div class="carousel-caption">
                                <h1 style="color: black;margin-left: -300px;">Blood Availability</h1>
                                <p><a class="btn btn-lg btn-danger" href="nearby_bloodbank.jsp" role="button" style="margin-left:-300px;">Check &raquo;</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images\slide3.jpg"
                             alt="Third slide">
                        <div class="container">
                            <div class="carousel-caption text-end">
                                <p><a class="btn btn-lg btn-danger" href="check_camp.jsp" role="button" style="margin-top: -50px;margin-right: -180px;">Ongoing Camp &raquo;</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </a>
            </div>


            <!-- Marketing messaging and featurettes
            ================================================== -->

            <div class="container marketing">

                <!-- Three columns of text below the carousel -->
                <div class="row">
                    <div class="col-lg-4" style="
                         border-radius: 15px;
                         background: #e7e7e7;
                         box-shadow:  30px 30px 60px #c4c4c4,
                         -30px -30px 60px #ffffff;">
                        <img src="images\circle1.png" class="bd-placeholder-img rounded-circle" style="
                             margin-top: 10px;" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img"  preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em"></text></svg>
                        <hr>
                        <h2>Organization</h2>
                        <hr>
                        <p>Organization can register itself then it can do it. It can also search for donor location wise and if needed then it can also make request for blood.</p>
                        <p><a class="btn btn-dark" href="org_signup.jsp" role="button">Sign up &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4" style="
                         margin-left: 30px;
                         margin-right: 30px;
                         border-radius: 15px;
                         background: #e7e7e7;
                         box-shadow:  30px 30px 60px #c4c4c4,
                         -30px -30px 60px #ffffff;">
                        <img src="images\circle2.png" class="bd-placeholder-img rounded-circle" style="
                             margin-top: 10px;" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em"></text></img>
                        <hr>
                        <h2>Donor</h2>
                        <hr>
                        <p>Person who is interested in donating their blood so they can register themselves through this website. If any requirement comes then they will be contacted and they can donate their blood.</p>
                        <p><a class="btn btn-dark" href="Donor_signup.jsp" role="button">Sign up &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4"  style="
                         border-radius: 15px;
                         background: #e7e7e7;
                         box-shadow:  30px 30px 60px #c4c4c4,
                         -30px -30px 60px #ffffff;
                         ">
                        <img src="images\circle3.png" class="bd-placeholder-img rounded-circle" style="
                             margin-top: 10px;" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img"  preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em"></text></svg>
                        <hr>
                        <h2>Receiver</h2>
                        <hr>
                        <p>Person who is in need of blood and can get the blood once register onto the website. He/she can get the location of nearby blood bank available.</p>
                        <p><a class="btn btn-dark" href="Receiver_signup.jsp" role="button">Sign up &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                </div><!-- /.row -->
                <hr>
                <!--BLOOD TABLE-->
                <h1 style="color:#bf0404;text-align: center;">Know More About Blood</h1><br>
                <div class='col-sm-6' style="
                     margin-left: auto;
                     margin-right: auto;
                     ">
                    <table class="table table-responsive table-bordered table-hover">
                        <tbody>
                            <tr>
                                <th colspan="3" style='color:white;background-color:#bf0404;'>Compatible Blood Type Donors</th>
                            </tr>
                            <tr>
                                <td style="
                                    background: red;
                                    color: white;"><b>Blood Type</b></td>
                                <td style="
                                    background: red;color: white;
                                    "><b>Donate Blood To</b></td>
                                <td style="
                                    background: red;color: white;
                                    "><b>Receive Blood From</b></td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>A+</b></span></td>
                                <td>A+ AB+</td>
                                <td>A+ A- O+ O-</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>O+</b></span></td>
                                <td>O+ A+ B+ AB+</td>
                                <td>O+ O-</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>B+</b></span></td>
                                <td>B+ AB+</td>
                                <td>B+ B- O+ O-</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>AB+</b></span></td>
                                <td>AB+</td>
                                <td>Everyone</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>A-</b></span></td>
                                <td>A+ A- AB+ AB-</td>
                                <td>A- O-</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>O-</b></span></td>
                                <td>Everyone</td>
                                <td>O-</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>B-</b></span></td>
                                <td>B+ B- AB+ AB-</td>
                                <td>B- O-</td>
                            </tr>
                            <tr>
                                <td><span style="color: #961e1b;"><b>AB-</b></span></td>
                                <td>AB+ AB-</td>
                                <td>AB- A- B- O-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            <hr>
            <!--BLOOD TABLE-->
            <h1 style="color:#bf0404;text-align: center;">FREQUENCY OF BLOOD TYPES</h1><br>
            <div class='col-sm-6'style="
                 margin-left: auto;
                 margin-right: auto;
                 ">
                <table class="table table-responsive table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th colspan="3" style='color:white;background-color:#bf0404;'>FREQUENCY OF BLOOD TYPES</th>
                        </tr>

                        <tr>
                            <td style="color: red;"><span ><b>O+ 1 person in 3</b></span></td>
                            <td style="color: red;"><b>O+ 1 person in 3</b></td>
                        </tr>
                        <tr>
                            <td style="color: red;"><span ><b>B+ 1 person in 12</b></span></td>
                            <td style="color: red;"><b>AB+ 1 person in 29</b></td>
                        </tr>
                        <tr>
                            <td style="color: red;"><span ><b>O- 1 person in 15</b></span></td>
                            <td style="color: red;"><b>A- 1 person in 16</b></td>

                        </tr>
                        <tr>
                            <td style="color: red;"><span ><b>B- 1 person in 67</b></span></td>
                            <td style="color: red;"><b>AB- 1 person in 167</b></td>
                        </tr>

                    </tbody>
                </table>
            </div>

        <hr>      
        <!--BLOOD TABLE-->
        <h1 style="color:#bf0404;text-align: center;">EXAMPLES OF BLOOD USE</h1><br>
        <div class='col-sm-6'style="
             margin-left: auto;
             margin-right: auto;
             ">
            <table class="table table-responsive table-bordered table-hover ">
                <tbody>
                    <tr>
                        <th colspan="3" style='color:white;background-color:#bf0404;'>EXAMPLES OF BLOOD USE</th>
                    </tr>

                    <tr>
                        <td style="color: red;"><span ><b>1. Automobile Accident</b></span></td>
                        <td style="color: red;"><b>50 units of blood</b></td>
                    </tr>
                    <tr>
                        <td style="color: red;"><span ><b>2. Heart Surgery</b></span></td>
                        <td style="color: red;"><b>6 units of blood / 6 units of platelets</b></td>
                    </tr>
                    <tr>
                        <td style="color: red;"><span ><b>3. Organ Transplant</b></span></td>
                        <td style="color: red;"><b>40 units of blood / 30 units of platelets</b></td>

                    </tr>
                    <tr>
                        <td style="color: red;"><span ><b>4. 20 bags of cryoprecipitate</b></span></td>
                        <td style="color: red;"><b>25 units of fresh frozen plasma</b></td>
                    </tr>
                    <tr>
                        <td style="color: red;"><span ><b>5. Bone Marrow Transplant</b></span></td>
                        <td style="color: red;"><b>120 units of platelets/ 20 units of blood</b></td>
                    </tr>
                    <tr>
                        <td style="color: red;"><span ><b>6. Burn Victims</b></span></td>
                        <td style="color: red;"><b>20 units of platelets</b></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

    <h1 style="color:#bf0404;text-decoration: none;margin-top: -70px;">Why to donate blood?</h1>
    Donating blood regularly has proved beneficial not only for the recipient but also the donor. 
    It is helpful for the vital organs, and it reduces risk for chronic diseases such as cancer and stroke.

    For certain treatments like chemotherapy, blood is required on a daily basis, whereas victims of accident may require
    up to 100 units of blood transfusion. In India, blood shortage is more than 2 million pint and counting.<br>
    <a href="whydonate.jsp">click here to know more....</a>
    <hr>

    </div>

    <!---Footer--->

    <%@include file="footer.jsp" %>

    </body>
    </html>
