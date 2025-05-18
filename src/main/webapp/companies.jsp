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
		<title>Associated Companies</title>
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
					<h2>Our Partners</h2>
					<div class="row">
                    <jsp:scriptlet>
                        String c_id="", c_name="", c_email="", c_logo="", c_phoneno;
                        try
                        {
                            Connection con=DbConnection.getConnect();
                            
                            /*create table company_reg(id int auto_increment, c_name varchar(100), c_email varchar(100), c_password varchar(100), c_logo varchar(100), c_phoneno varchar(15), primary key(id));*/
                            PreparedStatement ps=con.prepareStatement("select * from company_reg");
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            {
                                c_id=rs.getString("id");
                                c_name=rs.getString("c_name");
                                c_email=rs.getString("c_email");
                                c_logo=rs.getString("c_logo");
                                c_phoneno=rs.getString("c_phoneno");
                     </jsp:scriptlet>
                            
                            <div class="col-md-12 display_job_div">
                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="images/<%= c_logo %>" height="50" width="50"/>
                                    </div>
                                    <div class="col-md-10">
                                        <b> <jsp:expression>c_name</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d;"> (<jsp:expression>c_email</jsp:expression>)</span> <br> <br>
                                    <span class="fa fa-phone-alt"></span> &nbsp; <span style="color: #9f9d9d"> Phone No : </span> <span> <jsp:expression>c_phoneno</jsp:expression> </span> <br>
                                    <br><a style="text-decoration: none" href="company-jobs.jsp?c_email=<jsp:expression>c_email</jsp:expression>"> See All Jobs of this company </a>
                                    </div>
                                </div>
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