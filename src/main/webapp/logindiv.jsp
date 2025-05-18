<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login Section</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
    <body>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="reg_div_design" style="margin-top: 40px; margin-bottom: 40px">
                    <form method="POST" action="login">
                        <br> <h2> Login Here </h2> <br>
                        <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" /> <br> <br>
                        <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" /> <br> <br>
                        <input type="checkbox" name="rememberme1" value="rememberme" /> Remember Me <br> <br>
                        <input type="submit" value="Login" class="btn btn-primary" /> <br> <br> <br>
                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </body>
</html>