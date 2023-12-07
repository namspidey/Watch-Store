<%-- 
    Document   : home
    Created on : Jun 10, 2023, 11:32:53 AM
    Author     : namde
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Home</title>
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
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
    
    <script type="text/javascript"> 
        function setCheck(obj){
                var fries = document.getElementsByName('brand');
                if ((obj.id=='c0') && (fries[0].checked==true))
                {
                    for (var i = 1; i < fries.length; i++)
                        fries[i].checked = false;
                } else{
                    for (var i = 1; i < fries.length; i++) {
                        if (fries[i].checked==true) {
                            fries[0].checked=false;
                            break;
                        }
                    }
                }
                document.getElementById('f1').submit();
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
                           
                        </div>
                     </div>
                     
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                      <nav class="navigation navbar navbar-expand-md navbar-dark " >
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                          <div class="collapse navbar-collapse" id="navbarsExample04" >
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
      
      
      <!-- about section -->
      <!-- Our  Glasses section -->
    
      <div class="glasses" style="margin-top: 20px">
            <div class="container">
            
        </div>
            <form action="home">
                <li class="nav-item d_none login_btn" style="padding-left : 20px" >

                    <input style="border-radius: 10px"  type="text" oninput="searchByName(this)" placeholder="${searchName}" name="searchName">  
                    <button style="border-radius: 10px;width: 30px" type="submit" > <i class="fa fa-search" aria-hidden="true"></i></button>

                </li>
                
                <br>
            </form>
        <div class="container-brand">
            <div class="tab">            

                <ul style="list-style: none outside none; margin-left: 20px; padding: 0;display: inline-block;">
                    <li style="float: left;"><h1>Category: </h1></li>
                        <c:forEach items="${requestScope.listCate}" var="c">
                        <li  style="float: left; margin: 0 10px;">
                            <a class="${c.cid==id?"active":""}" href="home?id=${c.cid}">${c.name}</a>
                        </li>
                        </c:forEach>
                </ul>
            </div>
        </div>
            <div class="container-brand">
            <div class="tab">            

                <ul style="list-style: none outside none; margin-left: 20px; padding: 0;display: inline-block;">
                    <li style="float: left;"><h1>Brand: </h1></li>
                    <form id="f1" action="home">
                        <li style="float: left;"><h1>
                        <input type="checkbox" id="c0" name="brand" 
                               ${chid[0]?"checked":""}
                               value="${0}" onclick="setCheck(this)"/>All<br/>
                        
                        <c:forEach begin="0" end="${listBrand.size()-1}"  var="i">
                            <input type="checkbox" id="cm" name="brand"
                                   ${listBrand.get(i)==brand?"checked":""}
                                   value="${listBrand.get(i)}" 
                                   ${chid[i+1]?"checked":""}   onclick="setCheck(this)" />
                            ${listBrand.get(i)}
                            <br/>
                        </c:forEach>
                            </h1></li>
                    </form>

                        
                </ul>
            </div>
        </div>
        <div class="container-brand">
            <div class="tab"> 
                
                <form action="home" method="get">
                <ul style="list-style: none outside none; margin-left: 20px; padding: 0;display: inline-block;">
                    <li style="float: left;"><h1>Price: </h1></li>                       
                            <li  style="float: left; margin: 0 10px;">
                                <input type="num" name="pfrom" placeholder="${from}" style="width: 100px">
                            </li>
                        <li  style="float: left; margin: 0 10px;"><h3>To</h3></li>
                            <li  style="float: left; margin: 0 10px;">
                                <input type="num" name="pto" placeholder="${to}" style="width: 100px">
                            </li>
                        <li  style="float: left; margin: 0 10px;"><h3> VND</h3> </li>
                        <li  style="float: left; margin: 0 10px;">
                                    <h3> <select name="type">
                                            <option value="1">Up</option>
                                            <option value="0">Down</option>
                                </select></h3> 
                        </li>
                        <li style="float: left;"><button style="width: 30px" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button></li>
                </ul>
                </form>
                
                
            </div>
                                         
        </div>
        <div class="container-fluid">
            <c:set var="page" value="${requestScope.page}"/>
            <div class="pagination">              
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <a class="${i==page?"active":""}" href="home?${path}&page=${i}">${i}</a>
                    </c:forEach>               
            </div>
            <div id="content" class="row">

                <c:forEach items="${requestScope.list}" var="c" >  
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
        <div class="container">
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <div class="titlepage">
                        <h2>New watches</h2>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${requestScope.listNew}" var="c">
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
            
      <!-- end Our  Glasses section -->
      <!-- Our shop section -->
      <div id="about" class="shop">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-5">
                  <div  class="shop_img">
                     <figure><img src="images/kisspng-watch-strap-jewellery-web-banner-cocktail-jewelry-watches-5a865eed5ea5e1.2380881915187555653877.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-7 padding_right0">
                  <div class="max_width">
                     <div class="titlepage">
                        <h2>Best Watches  At Our shop</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
                        <a class="read_more" href="allproduct">Shop Now</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end Our shop section -->
      <!-- clients section -->
      
      <!-- end clients section -->
      <!-- contact section -->
      
      <!-- end contact section -->
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
      <script>
         // This example adds a marker to indicate the position of Bondi Beach in Sydney,
         // Australia.
         function initMap() {
           var map = new google.maps.Map(document.getElementById('map'), {
             zoom: 11,
             center: {lat: 40.645037, lng: -73.880224},
             });
         
         var image = 'images/maps-and-flags.png';
         var beachMarker = new google.maps.Marker({
             position: {lat: 40.645037, lng: -73.880224},
             map: map,
             icon: image
           });
         }
      </script>
      <script>
          function searchByName(param){
                            var txtSearch = param.value;
                            $.ajax({
                                url: "/demoProject/searchAjax",
                                type: "get", 
                                data: {
                                    searchName: txtSearch
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                    
                                }
                            });
                        }
      </script>
      <!-- google map js -->
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
      <!-- end google map js --> 
   </body>
</html>


