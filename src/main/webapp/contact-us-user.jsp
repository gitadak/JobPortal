<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>
    
<jsp:scriptlet>
    String name1=(String) session.getAttribute("session_name");
    String email1=(String) session.getAttribute("session_email");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Contact Us User</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
    <body>
        <div class="reg_div_design">
            <form method="POST" action="ContactUs">
                <br> <h2> Contact Us </h2> <br>
                <input type="text" placeholder="Enter Name" name="name1" value="<jsp:expression>name1</jsp:expression>" class="reglog_tf_design" readonly /> <br> <br>
                <input type="text" placeholder="Enter Email" name="email1" value="<jsp:expression>email1</jsp:expression>" class="reglog_tf_design" readonly /> <br> <br>
                <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" /> <br> <br>
                <textarea placeholder="Enter Message" name="message1" style="padding: 5px 10px; width: 350px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>
                <input type="submit" value="Send" class="btn btn-primary" /> <br> <br> <br>
            </form>
        </div>
    </body>
</html>