<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/CheckCookie"/>

<!DOCTYPE html>

<jsp:declaration>
    String jobid;
</jsp:declaration>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
    
    jobid=request.getParameter("jid");
</jsp:scriptlet>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Job Description</title>
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
                    <div class="col-md-6" style="border: 1px solid gray; margin: 10px 0 10px 0; border-radius: 5px">
                        <div class="row">
                            <table class="table table-hover">
                        <jsp:scriptlet>
                        String id = "", job_profile = "", company = "", experience = "", description = "", date1 = "", time1 = "",
                        salary = "", no_of_openings = "", job_location = "", time_venue = "", c_email = "",
                        c_person_name = "", c_person_profile = "", c_phone_no = "";
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                PreparedStatement ps=con.prepareStatement("select * from jobs where id=?");
                                ps.setString(1, jobid);
                                ResultSet rs=ps.executeQuery();
                                if(rs.next())
                                {
                                    job_profile=rs.getString("job_profile");
                                    company=rs.getString("company");
                                    experience=rs.getString("experience");
                                    description=rs.getString("description");
                                    date1=rs.getString("date1");
                                    time1=rs.getString("time1");
                                    salary=rs.getString("salary");
                                    no_of_openings=rs.getString("no_of_openings");
                                    job_location=rs.getString("job_location");
                                    time_venue=rs.getString("time_venue");
                                    c_email=rs.getString("c_email");
                                    c_person_name=rs.getString("c_person_name");
                                    c_person_profile=rs.getString("c_person_profile");
                                    c_phone_no=rs.getString("c_phone_no");
                                }
                              }
                              catch(Exception e)
                              {
                                  e.printStackTrace();
                              }
                           </jsp:scriptlet>
                            
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> &amp; <jsp:expression>time1</jsp:expression>)</span> <br></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-home"></span></td>
                                    <td width="150"><span style="color: #9f9d9d"> Company : </span></td>
                                    <td><jsp:expression>company</jsp:expression><br></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-briefcase"></span></td>
                                    <td><span style="color: #9f9d9d"> Experience : </span></td>
                                    <td><jsp:expression>experience</jsp:expression><br></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-list-alt"></span></td>
                                    <td><span style="color: #9f9d9d"> Job Description : </span></td>
                                    <td><jsp:expression>description</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-usd"></span></td>
                                    <td><span style="color: #9f9d9d"> Salary : </span></td>
                                    <td><jsp:expression>salary</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-th"></span></td>
                                    <td><span style="color: #9f9d9d">  No. Of Openings :</span></td>
                                    <td><jsp:expression>no_of_openings</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-map-marker"></span></td>
                                    <td><span style="color: #9f9d9d"> Job Location : </span></td>
                                    <td><jsp:expression>job_location</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-location-arrow"></span></td>
                                    <td><span style="color: #9f9d9d"> Time / Venue : </span></td>
                                    <td><jsp:expression>time_venue</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><b>Company Details</b></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-file"></span></td>
                                    <td><span style="color: #9f9d9d"> Company Name : </span></td>
                                    <td><jsp:expression>company</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-user"></span> </td>
                                    <td><span style="color: #9f9d9d"> Person Name : </span></td>
                                    <td><jsp:expression>c_person_name</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>)</td>
                                </tr>
                                <tr>
                                    <td><span class="fa fa-phone-alt"></span></td>
                                    <td><span style="color: #9f9d9d"> Phone No. : </span></td>
                                    <td><jsp:expression>c_phone_no</jsp:expression></td>
                                </tr>
                            <jsp:scriptlet>
                                    if (email == null ? email == null : email.trim().equals("null")) {
                            </jsp:scriptlet>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><a href="login.jsp" class="btn btn-primary">Login to Apply</a></td>
                            </tr>
                            <jsp:scriptlet>
            } else {
                                        Connection con1=null;
                                        try
                                        {
                                            con1=DbConnection.getConnect();
                                            PreparedStatement ps1=con1.prepareStatement("select * from applied_jobs where email=? and jobid=?");
                                            ps1.setString(1, email);
                                            ps1.setString(2, jobid);
                                            ResultSet rs1=ps1.executeQuery();
                                            if(rs1.next())
                                            {
                                                </jsp:scriptlet>
                            
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <span style="color: red; padding: 3px;"> Already applied to this job </span> <br> <br>
                                    <form action="DeleteMyJobApplication" method="post">
                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
                                        <input type="submit" value="Delete this Application" class="btn btn-danger" />
                                    </form>
                                </td>
                            </tr>
                            
                        <jsp:scriptlet>
                                            }
                                            else
                                            {
                                                </jsp:scriptlet>
                            
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <form action="ApplyForJob" method="post">
                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
                                        <input type="submit" value="Apply" class="btn btn-primary" />
                                    </form>
                                </td>
                            </tr>
                            
                        <jsp:scriptlet>
                                            }
                                        }
                                        catch(Exception e)
                                        {
                                            e.printStackTrace();
                                        }
                            </jsp:scriptlet>
                            
                            <jsp:scriptlet>
                }
                            </jsp:scriptlet>
                            
                        </table>
                            
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