package com.soumyadeep.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.soumyadeep.connection.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String name2 = req.getParameter("name1");
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String gender2 = req.getParameter("gender1");
		String[] field2 = req.getParameterValues("field1");
		String city2 = req.getParameter("city1");
		
        String fields2="";
        if(field2!=null)
        {
            for(String s:field2)
            {
                fields2=fields2+","+s;
            }
        }
        fields2 = fields2.substring(1);
		
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
			//System.out.println("Connection created successfully");
			/*CREATE TABLE register (
    			id INT AUTO_INCREMENT,
    			name VARCHAR(50) NOT NULL,
    			email VARCHAR(100) NOT NULL UNIQUE,
    			password VARCHAR(20) NOT NULL,
    			gender VARCHAR(10) NOT NULL,
    			fields VARCHAR(200),
    			city VARCHAR(50) NOT NULL,
    			PRIMARY KEY (id)
				);*/
			PreparedStatement ps = con.prepareStatement("insert into register(name, email, password, gender, fields, city) values(?,?,?,?,?,?)");
			ps.setString(1, name2);
			ps.setString(2, email2);
			ps.setString(3, pass2);
			ps.setString(4, gender2);
			ps.setString(5, fields2);
			ps.setString(6, city2);
            int i1=ps.executeUpdate();
            
            /*create table about_user(id int auto_increment, email varchar(100) unique, about varchar(100), skills varchar(100), primary key(id));*/
            PreparedStatement ps2=con.prepareStatement("insert into about_user(email, about, skills) values(?,?,?)");
            ps2.setString(1, email2);
            ps2.setString(2, "");
            ps2.setString(3, "");
            int i2=ps2.executeUpdate();
			
            /*create table profile_pics(id int auto_increment, email varchar(100), path varchar(100), primary key(id));*/
            PreparedStatement ps3=con.prepareStatement("insert into profile_pics(email, path) values(?,?)");
            ps3.setString(1, email2);
            ps3.setString(2, "human.jpg");
            int i3=ps3.executeUpdate();
            
			if(i1>0 && i2>0 && i3>0)
			{
                con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                session.setAttribute("session_fields", fields2);
                
                session.setAttribute("session_about", "");
                session.setAttribute("session_skills", "");
                
                session.setAttribute("session_profilepic", "human.jpg");
                
                resp.sendRedirect("profile.jsp");
			}
			else
			{
				con.rollback();
				out.println("Registration failed");
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
                e.printStackTrace();
            }
        }
	}
}
