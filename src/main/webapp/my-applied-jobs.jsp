<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<!DOCTYPE html>
<jsp:declaration>
String email;
</jsp:declaration>
<jsp:scriptlet>
    email=(String)session.getAttribute("session_email");
</jsp:scriptlet>
<html>
	<head>
		<meta charset="UTF-8">
		<title>My Applied Jobs</title>
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
				<div class="col-md-6 scroll-feature">
                        <h2> My Applied Jobs </h2>
					<div class="row">
                        <jsp:scriptlet>
                        String jobid="",job_profile="", company="", experience="", description="", date1="", time1="";
                        try
                        {
                            Connection con=DbConnection.getConnect();
                            
                            PreparedStatement ps=con.prepareStatement("select * from applied_jobs where email=?");
                            ps.setString(1, email);
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                jobid=rs.getString("jobid");
                                
                                PreparedStatement ps2=con.prepareStatement("select * from jobs where id=?");
                                ps2.setString(1, jobid);
                                ResultSet rs2=ps2.executeQuery();
                                while(rs2.next())
                                {
                                    job_profile=rs2.getString("job_profile");
                                    company=rs2.getString("company");
                                    experience=rs2.getString("experience");
                                    description=rs2.getString("description");
                                    date1=rs2.getString("date1");
                                    time1=rs2.getString("time1");
                                </jsp:scriptlet>
                            
                            <div class="col-md-12 display_job_div">
                                <b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> &amp; <jsp:expression>time1</jsp:expression>)</span> <br>
                            	<span> <span class="fa fa-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression> </span> <br>
                                <span> <span class="fa fa-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                                <span> <span class="fa fa-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> </span> <br>
                                <br><a href="job-description.jsp?jid=<jsp:expression>jobid</jsp:expression>" style="text-decoration: none"> See Full Details </a>
                            </div>
                            
                        <jsp:scriptlet>
                                }
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

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>