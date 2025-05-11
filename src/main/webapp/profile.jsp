<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="com.soumyadeep.backend.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/CheckCookie"/>

<jsp:declaration>Connection con=null;</jsp:declaration>
   
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String emaill=(String) session.getAttribute("session_email");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    if(fields==null || fields.equals(""))
    {
        fields="--- Not Available ---";
    }
    String about = (String) session.getAttribute("session_about");
    String skills = (String) session.getAttribute("session_skills");

    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome : <jsp:expression>name</jsp:expression></title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
        <div class="row">
            
            <div class="col-md-2"> </div>

            <div class="col-md-8 profile_row">

                <div class="row" style="border: 1px solid blue; box-shadow: 0px 0px 2px blue; border-radius: 3px">
                    <div class="col-md-2">
                        <a href="edit-profile-pic.jsp" style="font-size: 16px; float: right"> <span class="fa fa-pencil-alt"></span></a>
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="100" width="100" style="border-radius: 50px"/>
                    </div>
                    <div class="col-md-10">
                        <h3 style="color: blue"> <jsp:expression> name.toUpperCase()</jsp:expression> <a href="edit-profile-about.jsp" style="font-size: 16px; float: right"> <span class="fa fa-pencil-alt"></span> </a> </h3>
                        <h5><jsp:expression>about</jsp:expression></h5><br>
                        <span class="profile_details"> Skills : </span> <jsp:expression>skills</jsp:expression> <br> <br>
                        <span class="profile_details"> Gender : </span> <jsp:expression> gender</jsp:expression> <br>
                        <span class="profile_details"> City : </span> <jsp:expression> city</jsp:expression> <br>
                        <span class="profile_details"> Fields : </span> <jsp:expression> fields</jsp:expression> <br>
                    </div>
                </div>

                <div class="row" style="border: 1px solid blue; box-shadow: 0px 0px 2px blue; border-radius: 3px; margin-top: 45px">
                    <div class="col-md-12">
                        <h4> Education Details <a href="add-profile-education.jsp" style="font-size: 16px; float: right"> <span class="fa fa-plus"></span> </a></h4>
                        <jsp:scriptlet>
                            String school="", degree="", grade="", year="", id="";
                            String email=(String)session.getAttribute("session_email");
                            try
                            {
                                con = DbConnection.getConnect();
            					/*create table education(id int auto_increment, email varchar(100), school varchar(100), degree varchar(100)
								, year varchar(10), grade varchar(10), description varchar(3000), primary key(id));*/
                                PreparedStatement ps=con.prepareStatement("select * from education where email=?");
                                ps.setString(1, email);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id=rs.getString("id");
                                    school=rs.getString("school");
                                    degree=rs.getString("degree");
                                    grade=rs.getString("grade");
                                    year=rs.getString("year");
                        </jsp:scriptlet>
                            
                            <div class="row" style=" border: 1px solid blue; border-radius: 5px">
                                <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/school.png" height="70" /> </div>
                                <div class="col-md-10">
                                    <a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 16px; float: right"> <span class="fa fa-pencil-alt"></span> </a>
                                    <b> <span class="fa fa-home">&nbsp;</span> <jsp:expression>school</jsp:expression> <br> </b>
                                <span class="fa fa-book"></span> &nbsp; <jsp:expression> degree </jsp:expression> <span style="color: #858585">(<jsp:expression> year </jsp:expression>)</span> <br>
                                <span class="fa fa-file-alt"></span> &nbsp; <jsp:expression> grade </jsp:expression>% <br>
                                </div>
                        </div> <br>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();                          	
                                out.print(e);
                            }
                            finally
                            {
                                try
                                {
                                    con.close();
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            }
                        </jsp:scriptlet>
                        </div>
                    </div> <br> <br>
                    <div class="row"  style="border: 1px solid blue; box-shadow: 0px 0px 2px blue; border-radius: 3px">
                        
                        <div class="col-md-12">
                            <h4> Experience Details <a href="add-profile-experience.jsp" style="font-size: 16px; float: right"> <span class="fa fa-plus"></span> </a> </h4>
                        <jsp:scriptlet>
                            String company1="", location1="", jobtitle1="", year1="", id1="";
                            try
                            {
                                con = DbConnection.getConnect();
            
                                PreparedStatement ps=con.prepareStatement("select * from experience where email=?");
                                ps.setString(1, email);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id1=rs.getString("id");
                                    company1=rs.getString("company");
                                    location1=rs.getString("location");
                                    jobtitle1=rs.getString("job_title");
                                    year1=rs.getString("year");
                        </jsp:scriptlet>
                            
                            <div class="row" style="border-radius: 5px; border: 1px solid blue">
                                <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/office.png" height="70" style="padding-top: 8px"/> </div>
                                <div class="col-md-10">
                                    <a href="edit-profile-experience.jsp?id=<jsp:expression>id1</jsp:expression>" style="font-size: 16px; float: right"> <span class="fa fa-pencil"></span> </a>
                                    <b> <span class="fa fa-home">&nbsp;</span> <jsp:expression>company1</jsp:expression> <br> </b>
                                <span class="fas fa-map-marker-alt"></span> &nbsp; <jsp:expression>location1</jsp:expression> <span style="color: #858585">(<jsp:expression> year1 </jsp:expression>)</span> <br>
                                <span class="fas fa-industry"></span> &nbsp; <jsp:expression>jobtitle1</jsp:expression><br>
                                </div>
                        </div> <br>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                                out.print(e);
                            }
                            finally
                            {
                                try
                                {
                                    con.close();
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            }
                        </jsp:scriptlet>
					</div>
                    </div> <br> <br>
                    
                    <div class="row"  style="border: 1px solid blue; box-shadow: 0px 0px 2px blue; border-radius: 3px">
                        
                        <div class="col-md-12">
                            <h4> Resume Details </h4>
                            <div class="row" style="background-color: #ececec">
                            <div class="col-md-12">
                                <a href="upload-resume.jsp" style="text-decoration: none"> <span class="fa fa-pencil-alt"></span>&nbsp;&nbsp; Upload Resume </a>
                            <jsp:scriptlet>
                            String file_name=null;
                                try
                                {
                                    Connection con=DbConnection.getConnect();
                                    PreparedStatement ps=con.prepareStatement("select * from resumes where email=?");
                                    ps.setString(1, email);
                                    ResultSet rs=ps.executeQuery();
                                    if(rs.next())
                                    {
                                        file_name=rs.getString("path");
                                        </jsp:scriptlet>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="DownloadResume?fn=<jsp:expression>file_name</jsp:expression>" class="btn btn-success"> Download Resume </a>
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
                        <div class="row">
                            <div class="col-md-12">
                                <a href="resume-builder-details.jsp" style="text-decoration: none"> <span class="fa fa-plus">&nbsp;&nbsp;</span> Resume Builder </a>
                            <jsp:scriptlet>
                            
                            File f=new File(PathDetails.RESUME_BUILDER_PATH+emaill+".pdf");
                            if(f.exists())
                            {
                            </jsp:scriptlet>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="DownloadResumeBuilder?fn=<jsp:expression>email</jsp:expression>.pdf" class="btn btn-success"> Download Resume </a>

                            <jsp:scriptlet>
                            }
                            </jsp:scriptlet>
                        </div>
                        </div>
                        </div>
                        
                    </div> <br> <br>
                <div class="row" style="background-color: #ececec">
                    <div class="col-md-2"> </div>
                    <div class="col-md-8"> 
                        <input type="submit" class="btn btn-outline-secondary" value="Follow" /> 
                    </div>
                    <div class="col-md-2"> </div>
                </div>

            </div>

            <div class="col-md-2"> </div>
        </div>

		<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>
