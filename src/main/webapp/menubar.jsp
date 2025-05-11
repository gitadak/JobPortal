<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<!DOCTYPE html>
<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NavBar</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
			<div class="row gradient-navbar">
				<div class="col-md-9" id="navbar">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="simple-job-search.jsp">Search Jobs</a></li>
						<li><a href="companies.jsp">Companies</a></li>
                    <jsp:scriptlet>
                        if (email == null ? email == null : email.trim().equals("null")) {
                    </jsp:scriptlet>
                    
                    <jsp:scriptlet>
                    } else {
                    </jsp:scriptlet>
                    <li> <a href="my-applied-jobs.jsp"> My Applied Jobs </a> </li>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>
					</ul>
				</div>
				<div class="col-md-3" id="navbar">
					<ul>
						<li><a href="about-us.jsp">About Us</a></li>
						<li><a href="contact-us.jsp">Contact Us</a></li>
					</ul>
				</div>
			</div>
	</body>
</html>