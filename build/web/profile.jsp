<%-- 
    Document   : profile
    Created on : Jun 18, 2023, 11:54:58 PM
    Author     : namde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Single</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>sungla</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <!-- Navigation-->
        <header>
            <!-- header inner -->
            <div class="header" style="background: #03cafc">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="index.html"><img src="images/logo.png" alt="#" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                            <nav class="navigation navbar navbar-expand-md navbar-dark ">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarsExample04">
                                    <ul class="navbar-nav mr-auto" ">
                              <li class="nav-item active" >
                                 <a class="nav-link" href="home">Home</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="about.jsp">About</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="allproduct">Our Watch</a>
                              </li>
                              
                              <li class="nav-item">
                                 <a class="nav-link" href="show">Cart</a>
                              </li>
                            <c:if test="${sessionScope.account==null}">  
                              <li class="nav-item d_none login_btn">
                                 <a class="nav-link" href="login">Login</a>
                              </li>
                              <li class="nav-item d_none" >
                                 <a class="nav-link" href="signup.jsp">Register</a>
                              </li>
                            </c:if>
                            <c:if test="${sessionScope.account!=null}">
                              <li class="nav-item d_none login_btn">
                                 <a class="nav-link" href="profile?user=${sessionScope.account.username}">${sessionScope.account.fullname}</a>
                              </li>
                              <li class="nav-item d_none">
                                 <a class="nav-link" href="logout">Logout</a>
                              </li>    
                            </c:if>  
                              
<!--                              <li class="nav-item d_none sea_icon">
                                 <a class="nav-link" href="#"><i class="fa fa-shopping-bag" aria-hidden="true"></i><i class="fa fa-search" aria-hidden="true"></i></a>
                              </li>-->
                                
                           </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <div class="about" >
            <section class="py-5">
                <div style="padding-left: 150px">
                    <h1>User profile</h1><br/>
                    <form action="changeProfile">
                    <div style="padding-left: 50px">
                        <h2>ID: &nbsp; ${requestScope.u.id} </h2><br/>
                        <h2>Username: &nbsp;${requestScope.u.username}</h2><br/>
                        <h2>Full name: &nbsp;${requestScope.u.fullname}</h2><br/>
                        <h2>Password: &nbsp;<input type="password"  readonly="" value="${requestScope.u.pass}"></h2> <button><a href="changePass.jsp">Change pass</a></button> <br>
                        
                        <h2>Phone number: &nbsp;<input type="text" name="phoneChange" value="${requestScope.u.phone}"></h2><br/>
                        <h2>Email: &nbsp;<input type="text" name="emailChange" value="${requestScope.u.email}"></h2><br/>
                        <h2>Birthday: &nbsp;${requestScope.u.birthday}</h2><br/>
                        <h2>Address: &nbsp;<input type="text" name="addressChange" value="${requestScope.u.address}"></h2><br/>
                        <button type="submit">
                                Change Info
                            </button>
                    </div>
                    </form><br>
                        <div style="padding-left: 50px">
                            
                        </div>
                </div>
            </section>
        </div>
        
                <footer>
            <div class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <ul class="location_icon">
                                <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i></a><br> Location</li>
                                <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a><br> +01 1234567890</li>
                                <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a><br> demo@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
