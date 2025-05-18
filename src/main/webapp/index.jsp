<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
		<link rel="icon" type="image/x-icon" href="images/favicon.ico">
		<title>Job Portal Website</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<!-- <h1>Hello</h1> -->
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
				<img src="images/jobbanner.jpg" style="margin: 0px; padding: 0px" alt="Banner"/>
			</div>
			
			<!-- ==============search job div starts================= -->
			<div class="row" style="margin: 15px">
				<div class="col-md-2"></div>
				<div class="col-md-8 job_search_div">
					<h3> Find A Job at India's No.1 Job Site </h3>
                        <form action="search-jobs-result.jsp" method="POST">
                            <input type="text" name="technology1" placeholder="Technology..." class="textfield_design" />
                            <input type="text" name="location1" placeholder="Location..." class="textfield_design" />
                            <input type="submit" value="Search" class="btn btn-primary" style="margin-top: -3px" />
                        </form>
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
				<div class="col-md-6 scroll-feature">
					<div class="row">
                        <jsp:scriptlet>
                            String id,job_profile, company, experience, description, date1, time1;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                /*create table jobs(id int auto_increment, job_profile varchar(100), company varchar(100), experience varchar(100), 
                                salary varchar(100), no_of_openings varchar(100), job_location varchar(100), time_venue varchar(100), description varchar(3000), 
                                c_email varchar(100), c_person_name varchar(100), c_person_profile varchar(100), c_phone_no varchar(100), date1 varchar(100), 
                                time1 varchar(100), primary key(id));*/
                                PreparedStatement ps=con.prepareStatement("select * from jobs");
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id=rs.getString("id");
                                    job_profile=rs.getString("job_profile");
                                    company=rs.getString("company");
                                    experience=rs.getString("experience");
                                    description=rs.getString("description");
                                    date1=rs.getString("date1");
                                    time1=rs.getString("time1");
                                    </jsp:scriptlet>
                            
                            <div class="col-md-12 display_job_div">
                                <b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> &amp; <jsp:expression>time1</jsp:expression>)</span> <br>
                            	<span> <span class="fa fa-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression> </span> <br>
                                <span> <span class="fa fa-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                                <span> <span class="fa fa-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> </span> <br>
                                <br><a href="job-description.jsp?jid=<jsp:expression>id</jsp:expression>" style="text-decoration: none"> See Full Details </a>
                            </div>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        </jsp:scriptlet>
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
		</div>
		<jsp:include page="footer.jsp"></jsp:include>	
	</body>
</html>