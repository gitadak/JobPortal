<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/CheckCookie"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Error page</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
        <jsp:scriptlet>
            String message=(String)request.getAttribute("error_message");
        </jsp:scriptlet>
    	<div class="alert alert-danger alert-dismissible fade show" style="text-align: center" role="alert">
            <strong> Error :: </strong> <jsp:expression>message</jsp:expression>
        	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    	</div>
	</body>
</html>