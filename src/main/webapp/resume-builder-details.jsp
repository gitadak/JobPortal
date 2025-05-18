<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<jsp:include page="/CheckCookie"/>

<jsp:declaration>
    Connection con=null;
    String school="", degree="", year="", grade="", description="";
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String email= (String) session.getAttribute("session_email");
    String profile_pic = (String) session.getAttribute("session_profilepic");
</jsp:scriptlet>

<jsp:scriptlet>
    if (name == null || name.equals(""))
    {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Resume Builder Details</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
    <body>
        <jsp:include page="profileheader.jsp" />
        <jsp:include page="menubar.jsp" />

        <div class="row">
            <div class="col-md-1"> </div>
            <div class="col-md-10">
                <div class="row" style="border: 1px solid blue; box-shadow: 0px 0px 2px blue; border-radius: 5px">
                    <div class="col-md-2">
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="100" width="100" style="border-radius: 50px"/>
                        </div>
                        <div class="col-md-10">
                            <h2> Resume Builder Details </h2> <br>
                            <form action="ResumeBuilder" method="POST">
                                <input type="text" value="<jsp:expression>name</jsp:expression>" name="name1" class="textfield_design" readonly/> &nbsp; <a href="edit-profile-about.jsp" style="font-size: 12px;"> <span class="fa fa-pencil-alt"></span></a> <br> <br>
                            <input type="text" value="<jsp:expression>email</jsp:expression>" name="email1" class="textfield_design" readonly/> <br> <br>
                            <textarea name="address1" placeholder="Address" class="textarea_design"></textarea> <br> <br>
                            <textarea name="career1" placeholder="Career Objective" class="textarea_design"></textarea> <br> <br>
                                <b> Education Details :- </b> <br>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th> School/College</th>
                                        <th> Year </th>
                                        <th> degree </th>
                                        <th> Marks </th>
                                        <th></th>
                                    </tr>
                                <jsp:scriptlet>
                                String school = "", year = "", degree = "", grade = "", id="";
                                try {
                                    Connection con = DbConnection.getConnect();
                                    PreparedStatement ps = con.prepareStatement("select * from education where email=?");
                                    ps.setString(1, email);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                        id=rs.getString("id");
                                        school = rs.getString("school");
                                        year = rs.getString("year");
                                        degree = rs.getString("degree");
                                        grade = rs.getString("grade");
                                </jsp:scriptlet>
                                <tr>
                                    <td><jsp:expression>school</jsp:expression></td>
                                    <td><jsp:expression>year</jsp:expression></td>
                                    <td><jsp:expression>degree</jsp:expression></td>
                                    <td><jsp:expression>grade</jsp:expression></td>
                                    <td>
                                        <a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px;"> <span class="fa fa-pencil-alt"></span></a> </td>
                                    </tr>

                                <jsp:scriptlet>
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                </jsp:scriptlet>
                            </table> <br> <br>

                            <b> Experience Details :- </b> <br>
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th> Company </th>
                                    <th> Location </th>
                                    <th> Year </th>
                                    <th> Job Title </th>
                                    <th></th>
                                </tr>
                                <jsp:scriptlet>
                                String company = "", location = "", yearr = "", job_title = "", exid="";
                                try {
                                    Connection con = DbConnection.getConnect();
                                    PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
                                    ps.setString(1, email);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                        exid=rs.getString("id");
                                        company = rs.getString("company");
                                        location = rs.getString("location");
                                        yearr = rs.getString("year");
                                        job_title = rs.getString("job_title");
                                </jsp:scriptlet>


                                <tr>
                                    <td><jsp:expression>company</jsp:expression></td>
                                    <td><jsp:expression>location</jsp:expression></td>
                                    <td><jsp:expression>yearr</jsp:expression></td>
                                    <td><jsp:expression>job_title</jsp:expression></td>
                                    <td> <a href="edit-profile-experience.jsp?id=<jsp:expression>exid</jsp:expression>" style="font-size: 12px;"> <span class="fa fa-pencil-alt"></span></a> </td>
                                    </tr>
                                <jsp:scriptlet>
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                                </jsp:scriptlet>
                            </table><br> <br>
                            <textarea name="hobbies1" placeholder="Hobbies" class="textarea_design"></textarea> <br> <br>
                            <b> Personal Information :- </b> <br>
                            <input type="date" name="dob1" placeholder="Date Of Birth" class="textfield_design" /> <br> <br>
                            <input type="text" name="gendermaritial1" placeholder="Gender / Marital Status" class="textfield_design" /> <br> <br>
                            <input type="text" name="language1" placeholder="Language Proficiency" class="textfield_design" /> <br> <br>
                            <input type="submit" value="Build My Resume" class="btn btn-success" />
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-1"> </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>