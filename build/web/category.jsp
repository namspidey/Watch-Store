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
                window.location.href = "dele?id=" + id;
            }
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
                        
                        <a href="#addCategoryModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Category</span></a>
                        <a href="listcrud" class="btn btn-success"  style="background-color: #34ce57"> <span>Product</span></a>
                        
                        
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover" >
                <thead>
                    <tr>

                        <th>Category ID</th>

                        <th>Name</th>
                        <th>Actions</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.list}" var="c">
                        <tr>

                            <td>${c.cid}</td>
                            <td>${c.name}</td>
                            <td>
                                <a href="edit?cid=${c.cid}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#" onclick="doDelete('${c.cid}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
        </div>
    </div>
    <!-- Edit Modal HTML -->
    <div id="addCategoryModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="add" method="get">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add Category</h4>

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="cname" required>
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
    <div id="editCategoryModal" class="modal fade">
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
    <div id="deleteCategoryModal" class="modal fade">
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
    
   
    
    
</body>
</html>

