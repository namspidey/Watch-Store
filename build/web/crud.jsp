<%-- 
    Document   : crud
    Created on : Jul 2, 2023, 9:52:26 AM
    Author     : namde
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin CRUD</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);

        }
        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn-group {
            float: right;
        }
        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }
        table.table td a:hover {
            color: #2196F3;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #F44336;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }
        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }
        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }
        .pagination li.active a:hover {
            background: #0397d6;
        }
        .pagination li.disabled i {
            color: #ccc;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }
        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }
        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }
        .custom-checkbox label:before{
            width: 18px;
            height: 18px;
        }
        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }
        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }
        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }
        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }
        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }
        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }
        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }
        .modal .modal-content {
            border-radius: 3px;
        }
        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }
        .modal .modal-title {
            display: inline-block;
        }
        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }
        .modal textarea.form-control {
            resize: vertical;
        }
        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }
        .modal form label {
            font-weight: normal;
        }
        h2,
        h5,
        .h2,
        .h5 {
            font-family: inherit;
            font-weight: 600;
            line-height: 1.5;
            margin-bottom: .5rem;
            color: #32325d;
        }

        h5,
        .h5 {
            font-size: .8125rem;
        }

        @media (min-width: 992px) {

            .col-lg-6 {
                max-width: 50%;
                flex: 0 0 50%;
            }
        }

        @media (min-width: 1200px) {

            .col-xl-3 {
                max-width: 25%;
                flex: 0 0 25%;
            }

            .col-xl-6 {
                max-width: 50%;
                flex: 0 0 50%;
            }
        }


        .bg-danger {
            background-color: #f5365c !important;
        }



        @media (min-width: 1200px) {

            .justify-content-xl-between {
                justify-content: space-between !important;
            }
        }


        .pt-5 {
            padding-top: 3rem !important;
        }

        .pb-8 {
            padding-bottom: 8rem !important;
        }

        @media (min-width: 768px) {

            .pt-md-8 {
                padding-top: 8rem !important;
            }
        }

        @media (min-width: 1200px) {

            .mb-xl-0 {
                margin-bottom: 0 !important;
            }
        }




        .font-weight-bold {
            font-weight: 600 !important;
        }


        a.text-success:hover,
        a.text-success:focus {
            color: #24a46d !important;
        }

        .text-warning {
            color: #fb6340 !important;
        }

        a.text-warning:hover,
        a.text-warning:focus {
            color: #fa3a0e !important;
        }

        .text-danger {
            color: #f5365c !important;
        }

        a.text-danger:hover,
        a.text-danger:focus {
            color: #ec0c38 !important;
        }

        .text-white {
            color: #fff !important;
        }

        a.text-white:hover,
        a.text-white:focus {
            color: #e6e6e6 !important;
        }

        .text-muted {
            color: #8898aa !important;
        }

        @media print {
            *,
            *::before,
            *::after {
                box-shadow: none !important;
                text-shadow: none !important;
            }

            a:not(.btn) {
                text-decoration: underline;
            }

            p,
            h2 {
                orphans: 3;
                widows: 3;
            }

            h2 {
                page-break-after: avoid;
            }

            

            body {
                min-width: 992px !important;
            }
        }

        figcaption,
        main {
            display: block;
        }

        main {
            overflow: hidden;
        }

        .bg-yellow {
            background-color: #ffd600 !important;
        }






        .icon {
            width: 3rem;
            height: 3rem;
        }

        .icon i {
            font-size: 2.25rem;
        }

        .icon-shape {
            display: inline-flex;
            padding: 12px;
            text-align: center;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
        }
    </style>

    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Are you sure to delete category with id = " + id)) {
                window.location.href = "delete?id=" + id;
            }
        }
        
        function doThongKe(){
            document.getElementById("thongke").submit();
        }
        
        google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

// Set Data
const data = google.visualization.arrayToDataTable([
  ['Month', 'quantity'],
  ['Thang 7',${requestScope.num1}],
  ['Thang 6',${requestScope.num2}],
  ['Thang 5',${requestScope.num3}],
  
  
]);

// Set Options
const options = {
  title:'So luong san pham ban ra'
};

// Draw
const chart = new google.visualization.BarChart(document.getElementById('myChart'));
chart.draw(data, options);

}
    </script>
</head>
<body>


    <div class="container" style="width: 1200px">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6" >
                        <h2 style="color: white">Manage <b style="color: white">Product</b></h2>
                        
                    </div>
                    <div class="col-sm-6">
                        <a href="logout" class="btn btn-success"  style="background-color: red"> <span>Logout</span></a>
                        <a href="listuser" class="btn btn-success"  style="background-color: #34ce57"> <span>Users</span></a>
                        <a href="vieworder" class="btn btn-success"  style="background-color: #34ce57"> <span>Orders</span></a>
                        
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        <a href="category" class="btn btn-success"  style="background-color: #34ce57"> <span>Category</span></a>
                        
                        
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover" >
                <thead>
                    <tr>

                        <th>ID</th>

                        <th>Image</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Date created</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listall}" var="c">
                        <tr>

                            <td>${c.id}</td>
                            <td>
                                <img src="${c.img}" style="display: block ;max-width: 150px;max-height: 150px;width: auto;height: auto;text-align: center;">
                            </td>
                            <td>${c.name}</td>

                            <td>${c.brand}</td>
                            <td>${c.price}</td>
                            <td style="text-align: center;">${c.cid}</td>
                            <td>${c.date}</td>
                            <td>${c.quantity}</td>
                            <td>
                                <a href="update?id=${c.id}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#" onclick="doDelete('${c.id}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">

                <ul class="pagination">
                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                        <li class="${i==page?"disabled":""}"><a href="listcrud?&page=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- Edit Modal HTML -->
    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="add" method="get">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add Product</h4>

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <select name="cid">
                                <c:forEach items="${requestScope.listC}" var="c">
                                    <option  value="${c.cid}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="text" class="form-control" name="img" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" class="form-control" name="price" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" name="des" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Brand</label>
                            <input type="text" class="form-control" name="brand" required>
                        </div>	
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="number" class="form-control" name="quantity" required>
                        </div>	
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal HTML -->
    <div id="editEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="update" method="get">
                    <div class="modal-header">						
                        <h4 class="modal-title">Update Product</h4>

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" value="${requestScope.product.name}" required>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <select name="cid">
                                <option value="1">Smart</option>
                                <option value="2">Electronic</option>
                                <option value="3">Mechanical</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="text" class="form-control" name="img" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" class="form-control" name="price" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" name="des" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Brand</label>
                            <input type="text" class="form-control" name="brand" required>
                        </div>	
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="number" class="form-control" name="quantity" required>
                        </div>	
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Update">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <div id="deleteEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">						
                        <h4 class="modal-title">Delete Product</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <p>Are you sure you want to delete these Records?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-danger" value="Delete">
                    </div>
                </form>
            </div>
        </div>
    </div>
    
   
    <div class="main-content" style="margin-left: 100px">
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
          <h2 class="mb-5 text-black" >Stats Card</h2> 
          <h4>
          <form action="listcrud" id="thongke">
              <select  name="thongke" onchange="doThongKe()" >
                <option></option>  
                <option value="7">1 week</option>
                <option value="30">1 month</option>
                <option value="365">1 year</option>
          </select>
          </form>
          </h4>
        <div class="header-body">
          <div class="row">
            <div class="col-xl-3 col-lg-6" style="background-color: white">
              <div class="card card-stats mb-4 mb-xl-0" >
                  <div class="card-body" >
                  <div class="row">
                    <div class="col">
                      <h4 class="card-title text-uppercase text-muted mb-0">Best Seller Product</h4>
                      <span class="h3 font-weight-bold mb-0">${requestScope.productBS.name}</span>
                    </div>
                    <div class="col-auto">
                      <span class="h3 font-weight-bold mb-0">Number: ${requestScope.numProductBS}</span>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6" style="background-color: white;margin-left: 50px">
              <div class="card card-stats mb-4 mb-xl-0" >
                  <div class="card-body" >
                  <div class="row">
                    <div class="col">
                      <h4 class="card-title text-uppercase text-muted mb-0">Total Amount</h4>
                      <span class="h3 font-weight-bold mb-0">${requestScope.total} vnd</span>
                    </div>
                    <div class="col-auto">
                      <span class="h3 font-weight-bold mb-0">.</span>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
                    
            <div class="col-xl-3 col-lg-6" style="background-color: white;margin-left: 50px">
              <div class="card card-stats mb-4 mb-xl-0" >
                  <div class="card-body" >
                  <div class="row">
                    <div class="col">
                      <h4 class="card-title text-uppercase text-muted mb-0">Number of Order</h4>
                      <span class="h3 font-weight-bold mb-0">${requestScope.numO} </span>
                    </div>
                    <div class="col-auto">
                      <span class="h3 font-weight-bold mb-0">.</span>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
    
                    
                    <div id="myChart" style="width:100%; max-width:600px; height:500px;margin-left: 150px"></div>
</body>
</html>
