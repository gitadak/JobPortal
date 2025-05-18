<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<!DOCTYPE html>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
</jsp:scriptlet>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
        <script>
        	//AJAX - Asynchronous JavaScript and XML
            function searchJobByTech(tech)
            {
                //alert(tech);
                
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByTechnology?technology="+tech, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
            function searchJobByLocation(location)
            {
                var obj;
                // 1. creates an XMLHttpRequest Object
                if(window.XMLHttpRequest)
                {
                    obj=new XMLHttpRequest();   //for latest browsers
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }
                
                // 2. specify the request
                obj.open("POST", "JobSearchByLocation?location="+location, true);
                
                // 3. sends the request to the server
                obj.send();
                
                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function()
                {
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
        </script>
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

                <!-- ==============search job div starts================= -->
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 job_search_div" style="margin: 10px 0 10px 0">
                        <h3> Find A Job at India's No.1 Job Site </h3>
                        <input type="text" placeholder="Technology..." class="textfield_design" onkeyup="searchJobByTech(this.value)" /> <br> <br>
                        OR <br> <br>
                        <input type="text" placeholder="Location..." class="textfield_design" onkeyup="searchJobByLocation(this.value)" /> <br> <br>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <!-- ==============search job div ends================= -->

                <div class="row">
					<div class="col-md-3">
    					<a href=""> <img class="comapny_images" src="images/microsoft.png" alt="Microsoft"/> </a><br>
    					<a href=""> <img class="comapny_images" src="images/infosys.jpg" alt="Infosys"/> </a><br>
    					<a href=""> <img class="comapny_images" src="images/google.webp" alt="Google"/> </a><br>
    					<a href=""> <img class="comapny_images" src="images/IBM.jpg" alt="IBM"/> </a><br>
    					<a href=""> <img class="comapny_images" src="images/wipro.png" alt="Wipro"/> </a><br>
					</div>
                    <div class="col-md-6" style="background-color: #f9f8f9; margin-top: 10px">
                        <div class="row">
                            <div class="col-md-12">
                                <span id="respgenerated"> </span>
                            </div>
                        </div>
                    </div>
					<div class="col-md-3">
    					<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/capgemini.jpeg" alt="Capgemini"/> </a><br>
    					<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/TCS.png" alt="TCS"/> </a><br>
    					<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/deloitte.png" alt="Deloitte"/> </a><br>
    					<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/NRIFT.jpeg" alt="NRIFT"/> </a><br>
    					<a href=""> <img class="comapny_images" style="margin-left: 150px" src="images/accenture.png" alt="Accenture"/> </a><br>
					</div>
                </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>