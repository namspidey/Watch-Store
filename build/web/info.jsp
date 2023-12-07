<%-- 
    Document   : info
    Created on : Jul 7, 2023, 9:22:54 AM
    Author     : namde
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Info</title>
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
    background-color: #00ccff;
    color: white;
}
    </style> 
   </head>
    <body>
        <div class="glasses" style="margin-top: 20px">
        <div class="container" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="titlepage">
                        <h2>Best Seller</h2>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${requestScope.listBS}" var="c">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                        <div class="glasses_box">
                            <figure>
                                <a href="single?id=${c.id}&cid=${c.cid}">
                                    <img src="${c.img}" alt="#" style="text-align: center; display: block ;max-width: 348px;max-height: 230px;width: auto;height: auto; margin-left: auto;margin-right: auto" />
                                </a>
                            </figure>
                            <h3> 
                                <fmt:formatNumber value="${c.price}" type="currency" currencySymbol="" minFractionDigits="0"></fmt:formatNumber> <span class="blu"> VNÐ</span>
                                </h3>
                                <p>${c.name}</p>
                        </div>
                    </div>
                </c:forEach>
                <div class="col-md-12">
                    <a class="read_more" href="allproduct">Read More</a>
                </div>
            </div>
        </div>
            </div>
    </body>
</html>
