<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<jsp:scriptlet>
	String email=(String)session.getAttribute("session_email");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>About Us</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div class="container-fluid">
            <jsp:scriptlet>
                if(email == null ? email == null : email.trim().equals("null"))
                {
            </jsp:scriptlet>
                	<jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else
                {
            </jsp:scriptlet>
                    <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
			<jsp:include page="menubar.jsp"></jsp:include>
			
			<div class="row">
				<div class="col-md-3">
    				<a href=""> <img class="comapny_images" src="images/microsoft.png" alt="Microsoft"/> </a><br>
    				<a href=""> <img class="comapny_images" src="images/infosys.jpg" alt="Infosys"/> </a><br>
    				<a href=""> <img class="comapny_images" src="images/google.webp" alt="Google"/> </a><br>
    				<a href=""> <img class="comapny_images" src="images/IBM.jpg" alt="IBM"/> </a><br>
    				<a href=""> <img class="comapny_images" src="images/wipro.png" alt="Wipro"/> </a><br>
				</div>
				<div class="col-md-6">
                        <p>Welcome to Career Vault, the premier job portal designed to help professionals and companies connect in a fast-paced world. We offer a user-friendly platform to explore thousands of job opportunities and career growth possibilities.</p> <br> <br>
                        
                        <h2> Our Mission </h2>
                        <ul>
                            <li>Empower job seekers with the tools and resources to find their dream jobs.</li>
                            <li>Provide companies with a trusted platform to find top talent.</li>
                            <li>Foster long-lasting relationships between employees and employers.</li>
                            <li>Continuously innovate to create the best career development experience.</li>
                        </ul> <br> <br>
                        
                        <h2> Our Core Values </h2>
                        <p>At Career Vault, we believe in transparency, integrity, and innovation. Our platform is designed to provide users with trustworthy job listings and a seamless application process. We are committed to creating an environment where growth and opportunity are accessible to everyone.</p> <br> <br>
                        
                        <h2> Our Team </h2>
                        <p>Our dedicated team at Career Vault includes industry professionals from top organizations like Microsoft, Google, and Infosys. We work tirelessly to curate a job portal that prioritizes user experience and meaningful connections between job seekers and employers.</p>
                    </div>
				<div class="col-md-3">
    				<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/capgemini.jpeg" alt="Capgemini"/> </a><br>
    				<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/TCS.png" alt="TCS"/> </a><br>
    				<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/deloitte.png" alt="Deloitte"/> </a><br>
    				<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/NRIFT.jpeg" alt="NRIFT"/> </a><br>
    				<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/accenture.png" alt="Accenture"/> </a><br>
				</div>
			</div>	
		</div>
		<jsp:include page="footer.jsp"></jsp:include>	
	</body>
</html>