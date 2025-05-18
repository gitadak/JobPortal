<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/CheckCookie"/>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
    String about = (String) session.getAttribute("session_about");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    if(about==null || about.equals(""))
    {
        about="";
    }
    String skills = (String) session.getAttribute("session_skills");
    if(skills==null || skills.equals(""))
    {
        skills="";
    }

    if (name == null || name.equals(""))
    {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Profile about</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		
        <script>
            function changeGender()
            {
                document.getElementById('chnggendertf').value = document.getElementById('chnggender').value;
            }
            function changeCity()
            {
                document.getElementById('chngcitytf').value = document.getElementById('chngcity').value;
            }
        </script>
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
                        <h2> Personal Details </h2> <br>
                        <form action="EditProfileAbout" method="POST">
                            <h5><b> <jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("session_email") </jsp:expression>)</h5> <br>
                            <i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;
                            <input type="text" value="<jsp:expression> name</jsp:expression>" name="name1" class="textfield_design" placeholder="Enter Name"/> <br> <br>
                            <i class="fa fa-venus-mars" aria-hidden="true"></i>&nbsp;
                            <input id="chnggendertf" type="text" value="<jsp:expression> gender</jsp:expression>" name="gender1" class="textfield_design" style="width: 400px" placeholder="Select Gender" readonly />
                                <select id="chnggender" style="width: 195px" onchange="changeGender()">
                                    <option disabled> Select Gender </option>
                                    <option> Male </option>
                                    <option> Female </option>
                                </select>
                                <br> <br>
                                <i class="fas fa-map-marker-alt" aria-hidden="true"></i>&nbsp;&nbsp;
                                <input id="chngcitytf" type="text" value="<jsp:expression> city</jsp:expression>" name="city1" class="textfield_design" style="width: 400px" placeholder="Select City" readonly />
                                <select id="chngcity" style="width: 195px" onchange="changeCity()">
                                    <option disabled> Select City </option>
                                    <option value="Chandigarh"> Chandigarh </option>
                                    <option value="Panchkula"> Panchkula </option>
                                    <option value="Mohali"> Mohali </option>
                                </select>
                                <br> <br>
                                <i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;
                                <input type="text" value="<jsp:expression>about</jsp:expression>" name="about1" class="textfield_design" placeholder="About" /> <br> <br>
                                <i class="fa fa-book" aria-hidden="true"></i>&nbsp;&nbsp;
                            <textarea placeholder="Skills" name="skills1" style="padding: 5px 10px; width: 600px; height: 100px; border-radius: 5px; border: 1px solid gray;"><jsp:expression>skills</jsp:expression></textarea> <br> <br>
                                <input type="submit" value="Update" class="btn btn-danger" />
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"> </div>
            </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>