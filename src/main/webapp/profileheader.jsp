<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/CheckCookie"/>

<jsp:scriptlet>
    String name=(String)session.getAttribute("session_name");
    //String gender=(String)session.getAttribute("session_gender");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<title> Welcome : <jsp:expression> name </jsp:expression> </title>
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
		<div class="row gradient-background">
			<div class="col-md-4">
				<a href="index.jsp" style="text-decoration: none">
					<img src="images/CareerVaultLogo.webp" style="border-radius: 50%" alt="Logo" height="50"/>
					<span class="logo_text_design">Career Vault</span>
				</a>
			</div>
           	<div class="col-md-4" style="text-align: center">
                <h3> <span style="color: yellow"> Hi, <a href="profile.jsp" class="profile_name"> <jsp:expression> name </jsp:expression> </a> </span> </h3>
            </div>
            <div class="col-md-4" style="text-align: right; padding-right: 70px">
                <a href="logout" class="hyperlinks_design">Logout</a>
            </div>
		</div>
    </body>
</html>