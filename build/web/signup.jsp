<%-- 
    Document   : signup
    Created on : Jun 14, 2023, 2:39:28 PM
    Author     : namde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.login-form {
    width: 400px;
    margin: 30px auto;
}
.login-form form {        
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .login-btn {
    border-radius: 2px;
}
.input-group-prepend .fa {
    font-size: 18px;
}
.login-btn {
    font-size: 15px;
    font-weight: bold;
  	min-height: 40px;
}
.social-btn .btn {
    border: none;
    margin: 10px 3px 0;
    opacity: 1;
}
.social-btn .btn:hover {
    opacity: 0.9;
}
.social-btn .btn-secondary, .social-btn .btn-secondary:active {
    background: #507cc0 !important;
}
.social-btn .btn-info, .social-btn .btn-info:active {
    background: #64ccf1 !important;
}
.social-btn .btn-danger, .social-btn .btn-danger:active {
    background: #df4930 !important;
}
.or-seperator {
    margin-top: 20px;
    text-align: center;
    border-top: 1px solid #ccc;
}
.or-seperator i {
    padding: 0 10px;
    background: #f7f7f7;
    position: relative;
    top: -11px;
    z-index: 1;
} 
.btn-primary{
    background: #33ccff;
}

</style>
</head>
<body>
<div class="login-form">
    <form action="signup" method="get">
        <h2 class="text-center">Sign up</h2>
        <h4 class="text-center" style="color: red">${requestScope.b}</h4>
        <h4 class="text-center" style="color: red">${requestScope.c}</h4>
        <h4 class="text-center" style="color: blue">${requestScope.e}</h4>
        <div class="form-group">
        	<div class="input-group">
                <div class="input-group-prepend">
                                       
                </div>
                <input type="text" class="form-control" name="user" placeholder="Username" required="required"  >				
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                        
                </div>
                <input type="text" class="form-control" name="fullname"  placeholder="Full name"  required="required"  >				
            </div>
        </div>
		<div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                      
                </div>
                <input type="password" class="form-control" name="pass"  placeholder="Password"  required="required"  >				
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                      
                </div>
                <input type="password" class="form-control" name="confirmpass"  placeholder="Confirm password"  required="required"  >				
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                        
                </div>
                <input type="text" class="form-control" name="phone"  placeholder="Phone"  required="required"  >				
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                       
                </div>
                <input type="email" class="form-control" name="email"  placeholder="Email"  required="required"  >				
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                       
                </div>
                <input type="text" class="form-control" name="address"  placeholder="Address"  required="required"  >				
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                                       
                </div>
                <input type="date" class="form-control" name="birth"  placeholder="Birthday"  required="required"  >				
            </div>
        </div>
        
        <div class="form-group" >
            <input type="submit" class="btn btn-primary login-btn btn-block"  value="Sign up"/>
        </div>
        
		
    </form>
        <h4 class="text-center text-muted "> <a href="login.jsp"><u>Login now</u></a></h4>
</div>
</body>
</html>
