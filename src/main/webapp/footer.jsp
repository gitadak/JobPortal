<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/CheckCookie"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Footer</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div class="row gradient-background" id="footermenubar">
			<div class="col-md-6" style="color: white; text-align: center">
			Copyright : @SoumyadeepAdak
			</div>
			<div class="col-md-3">
				<ul>
					<li> <a href="simple-job-search.jsp"> Search Jobs </a> </li>
					<li> <a href="companies.jsp"> Companies </a> </li>
				</ul>
			</div>
			<div class="col-md-3">
				<ul>
					<li> <a href="index.jsp"> Home </a> </li>
					<li> <a href="about-us.jsp"> About Us </a> </li>
					<li> <a href="contact-us.jsp"> Contact Us </a> </li>
				</ul>
			</div>
		</div>
	</body>
</html>