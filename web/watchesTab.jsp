<%-- 
    Document   : watches
    Created on : Jun 18, 2023, 8:02:31 PM
    Author     : namde
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <!-- basic -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

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
    <style>
        table{
            border-collapse: collapse
        }
        .content{
            margin: auto;
            width: 80%;
            float: left;
            margin-left: 30px;
            height: auto
        }
        .pagination {
            display: inline-block;
        }
        .pagination a {
            color: black;
            font-size: 22px;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }
        .pagination a.active {
            background-color: aqua;
            color: black;
        }
        .pagination a:hover:not(.active) {
            background-color: chocolate;
        
            
            

}
.container-brand{
    display: flex ;
    
    
}
.tab a{
    text-decoration: none;
    font-size: 20px;
    
}
.tab a.active{
    background-color: aqua;
    color: black;
}
    </style>
    <script type="text/javascript">
        function change() {
            document.getElementById("f1").submit();
        }
    </script>
</head>
<!-- body -->
<body class="main-layout position_head">
    <!-- loader  -->

    <!-- end loader -->
    <!-- header -->
    <header>
        <!-- header inner -->
        <div class="header">
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
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item ">
                                        <a class="nav-link" href="home">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about.html">About</a>
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link" href="allproduct">Our Watch</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Cart</a>
                                    </li>
                                    
                                    <c:if test="${sessionScope.account==null}">  
                                        <li class="nav-item d_none login_btn">
                                            <a class="nav-link" href="login">Login </a>
                                        </li>
                                        <li class="nav-item d_none">
                                            <a class="nav-link" href="#">Register</a>
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
                                    
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- end header inner -->
    <!-- end header -->
    <!-- Our  Glasses section -->
    <div class="glasses">
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="titlepage">
                        <h2>Our Watches</h2>
                        <p>
                        </p>
                    </div>
                </div>
            </div>
        </div>
<!--        
        <c:set var="cid" value="${requestScope.cid}"></c:set>
        <form id="f1" action="allproduct">
                Dong dong ho:
                <select name="key" onchange="change()">
                    <option value="0" >All</option>
                <c:forEach items="${requestScope.listc}" var="c">
                    <option ${(c.cid==cid)?'selected':''} value="${c.cid}">${c.name}</option>
                </c:forEach>
            </select>
        </form>-->
        
        <form action="search">
            <li class="nav-item d_none login_btn" style="padding-left : 20px" >

                <input style="border-radius: 10px"  type="text" placeholder="Search" name="searchName">  
                <button style="border-radius: 10px" type="submit" >Search <i class="fa fa-search" aria-hidden="true"></i></button>

            </li>
            <br>
            </form>
        <div class="container-brand">
        <div class="tab">            
            <c:set var="cid" value="${requestScope.id}"/>             
                <ul style="list-style: none outside none; margin-left: 20px; padding: 0;display: inline-block;">
                    <li style="float: left;"><h1>Category: </h1></li>
                    <c:forEach items="${requestScope.listCate}" var="c">
                    <li  style="float: left; margin: 0 10px;">
                        <a class="${c.cid==id?"active":""}" href="tab?id=${c.cid}">${c.name}</a>
                    </li>
                    </c:forEach>
                </ul>
        </div>
            </div>
        <div class="container-fluid">
            <c:set var="page" value="${requestScope.page}"/>
            <div class="pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <a class="${i==page?"active":""}" href="tab?page=${i}&id=${id}">${i}</a>
                        </c:forEach>
                </div>
            <div class="row">
                
                <c:forEach items="${requestScope.list1}" var="c" >  
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                        <div class="glasses_box"  >
                            <figure>
                                <a href="single?id=${c.id}&cid=${c.cid}">
 <!--                                   <img src="${c.img}" alt="#" style="width: 348px;height: 275px" />-->
                                    <img src="${c.img}" alt="#" style="text-align: center;
                                         display: block ;
                                         max-width: 348px;
                                         max-height: 230px;
                                         width: auto;
                                         height: auto;
                                         margin-left: auto;
                                         margin-right: auto" />
                                </a>
                            </figure>
                            <h3> <fmt:formatNumber value="${c.price}" type="currency" currencySymbol="" minFractionDigits="0"></fmt:formatNumber> <span class="blu"> VNÐ</span></h3>
                            <p>${c.name}</p>
                        </div>
                    </div>
                </c:forEach>    
            </div>
        </div>
    </div>
    <!-- end Our  Glasses section -->
    <!--  footer -->
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
    <!-- end footer -->
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>


