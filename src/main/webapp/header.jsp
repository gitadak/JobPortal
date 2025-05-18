<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/CheckCookie"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Header</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
			<div class="row gradient-background">
				<div class="col-md-10">
					<a href="index.jsp" style="text-decoration: none">
						<img src="images/CareerVaultLogo.webp" style="border-radius: 50%" alt="Logo" height="50"/>
						<span class="logo_text_design">Career Vault</span>
					</a>
				</div>
				<div class="col-md-2" style="padding-top: 30px; text-align: right;">
					<a href="./login.jsp" class="hyperlinks_design">Login</a>
					<span style="color: yellow;">|</span>
					<a href="./register.jsp" class="hyperlinks_design">Register</a>
				</div>
			</div>
	</body>
</html>