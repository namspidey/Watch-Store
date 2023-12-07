<%-- 
    Document   : single
    Created on : Jun 13, 2023, 1:11:30 AM
    Author     : namde
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

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
        
        <script type="text/javascript">
    function buy(id){
        var m=document.f.num.value;
        document.f.action="buy?id="+id+"&num="+m;
        document.f.submit();
    }
</script>   
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
                              <li class="nav-item " >
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
        <!-- Product section-->
        <div class="about">  
            <section class="py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${requestScope.product.img}" /></div>
                        <div class="col-md-6">
                            <div class="small mb-1">SKU: BST-498</div>
                            <h1 class="display-5 fw-bolder">${requestScope.product.name}</h1>
                            <div class="fs-5 mb-5">
                                <h1> <fmt:formatNumber value="${requestScope.product.price}" type="currency" currencySymbol="" minFractionDigits="0"></fmt:formatNumber> <span class="blu"> VNÐ</span></h1>

                            <p class="lead">Quantity:  ${requestScope.product.quantity} </p>
                                <br>
                            <p class="lead"> ${requestScope.product.des} </p>
                                <form name="f" action="buy" method="post">
                                    <div class="d-flex" style="margin-top: 20px">
                                    <input class="form-control text-center me-3" name="num" id="inputQuantity" type="num" value="1" style="max-width: 3rem" >
                                    <!--                                <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                                                        <i class="bi-cart-fill me-1"></i>
                                                                        Add to cart
                                                                    </button>-->

                                    <input type="button" onclick="buy('${requestScope.product.id}')" value="Add to cart"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Related items section-->
            <section class="py-5 bg-light">
                <div class="container px-4 px-lg-5 mt-5">
                    <h2 class="fw-bolder mb-4">Related products</h2>
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach items="${requestScope.listById}" var="c" begin="0" end="3" step="1">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="${c.img}" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h4 class="fw-bolder">${c.name}</h4>
                                        <!-- Product price-->
                                        <h5><fmt:formatNumber value="${c.price}" type="currency" currencySymbol="" minFractionDigits="0"></fmt:formatNumber><span class="blu"> VNÐ</span></h5>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="single?id=${c.id}&cid=${c.cid}">View more</a></div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
        <!-- Footer-->
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

