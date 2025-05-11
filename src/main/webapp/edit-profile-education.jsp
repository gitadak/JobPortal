<%@page import="com.soumyadeep.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/CheckCookie"/>

<jsp:declaration>
	Connection con = null;
    String school="", degree="", year="", grade="", description="";
</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    
    String id=request.getParameter("id");
    
    try
    {
        con = DbConnection.getConnect();
        
        PreparedStatement ps=con.prepareStatement("select * from education where id=?");
        ps.setString(1, id);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            school=rs.getString("school");
            degree=rs.getString("degree");
            year=rs.getString("year");
            grade=rs.getString("grade");
            description=rs.getString("description");
        }
    }
    catch(Exception e)
    {
        try
        {
            con.rollback();
        }
        catch(Exception ee)
        {
            ee.printStackTrace();
        }
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
        	System.out.println("edit-educational-details.jsp");
            e.printStackTrace();
        }
    }
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
        <title>Edit Profile Education </title>

		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		
        <script>
            function submitFunction(val)
            {
                if(val==='update')
                {
                    document.editeduform.action="EditEducationDetails";
                    document.editeduform.submit();
                }
                if(val==='delete')
                {
                    document.editeduform.action="DeleteEducationDetails";
                    document.editeduform.submit();
                }
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
                        <h2> Edit Educational Details </h2> <br>
                        <h5><b> <jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("session_email") </jsp:expression>)</h5> <br>
                        <form name="editeduform" method="POST">
                                <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
                            School/College : <br> <input type="text" name="school1" class="textfield_design" value="<jsp:expression>school</jsp:expression>"/> <br> <br>
                            Degree : <br> <input type="text" name="degree1" placeholder="Eg. 10th or B.tech" class="textfield_design" value="<jsp:expression>degree</jsp:expression>"/> <br> <br>
                            Year : <br> <input type="text" name="year1" placeholder="Eg. 2001-2004" class="textfield_design" value="<jsp:expression>year</jsp:expression>"/> <br> <br>
                            Grade : <br> <input type="text" name="grade1" placeholder="Eg. 90" class="textfield_design" value="<jsp:expression>grade</jsp:expression>"/> % <br> <br>
                            Description : <br> <textarea placeholder="Your certifications, Activities and societies" name="description1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"><jsp:expression>description</jsp:expression></textarea> <br> <br>
                            <input type="submit" value="Update Education" class="btn btn-danger" onclick="submitFunction('update')" />
                            <input type="submit" value="Delete Education" class="btn btn-danger" onclick="submitFunction('delete')"/>
                        </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"> </div>
            </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>