<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String profile_pic = (String) session.getAttribute("session_profilepic");

    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add profile Experience</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
    <body>
        <jsp:include page="profileheader.jsp" />
        <jsp:include page="menubar.jsp" />

        <div class="row">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                    <div class="col-md-2">
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="100" style="border-radius: 50px"/>
                    </div>
                    <div class="col-md-10">
                        <h2> Add Experience Details </h2> <br>
                        <form action="AddExperienceDetails" method="POST">
                            <h5><b> <jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("session_email") </jsp:expression>)</h5> <br>
                            Company : <br> <input type="text" name="company1" class="textfield_design"/> <br> <br>
                            Location : <br> <input type="text" name="location1" placeholder="Eg. delhi" class="textfield_design" /> <br> <br>
                            Year : <br> <input type="text" name="year1" placeholder="Eg. 2001-2004" class="textfield_design" /> <br> <br>
                            Job Title : <br> <input type="text" name="jobtitle1" placeholder="Eg. Sr. Java Developer" class="textfield_design" /><br> <br>
                            Description : <br> <textarea placeholder="Your certifications, Activities and societies" name="description1" style="padding: 5px 10px; width: 600px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>
                            <input type="submit" value="Add Experience" class="btn btn-danger" />
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-2"> </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>