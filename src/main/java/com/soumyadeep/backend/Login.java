package com.soumyadeep.backend;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.soumyadeep.connection.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        //PrintWriter out=resp.getWriter();
        
        String email2=req.getParameter("email1");
        String pass2=req.getParameter("pass1");
        String remme2=req.getParameter("rememberme1");
        String name2="", gender2="", city2="", fields2="";
        
        Connection con = null;
        try
        {
            con=DbConnection.getConnect();
            
            PreparedStatement ps=con.prepareStatement("select * from register where email=? and password=?");
            ps.setString(1, email2);
            ps.setString(2, pass2);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                name2=rs.getString("name");
                gender2=rs.getString("gender");
                city2=rs.getString("city");
                fields2=rs.getString("fields");
                
                HttpSession session=req.getSession();
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                session.setAttribute("session_fields", fields2);
                
                String about="", skills="";
                PreparedStatement ps2=con.prepareStatement("select * from about_user where email=?");
                ps2.setString(1, email2);
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                {
                    about=rs2.getString("about");
                    skills=rs2.getString("skills");
                }
                
                session.setAttribute("session_about", about);
                session.setAttribute("session_skills", skills);
                
                String filename="";
                PreparedStatement ps3=con.prepareStatement("select * from profile_pics where email=?");
                ps3.setString(1, email2);
                ResultSet rs3=ps3.executeQuery();
                while(rs3.next())
                {
                    filename=rs3.getString("path");
                }
                session.setAttribute("session_profilepic", filename);
                
                //resp.sendRedirect("profile.jsp");
                if(remme2==null || remme2.equals("null"))
                {
                    remme2="";
                }
                if(remme2.equals("rememberme"))
                {
                    Cookie ck1=new Cookie("cookie_email", email2);
                    ck1.setMaxAge(60*60*24*365);
                    resp.addCookie(ck1);
                    
                    Cookie ck2=new Cookie("cookie_status", "true");
                    ck2.setMaxAge(60*60*24*365);
                    resp.addCookie(ck2);
                }
                
                RequestDispatcher rd=req.getRequestDispatcher("GetUserData");
                rd.include(req, resp);
                
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                //resp.sendRedirect("login.jsp");
                RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("menubar.jsp");
                rd2.include(req, resp);
                
                req.setAttribute("error_message", "Invalid email id and password...!!");
                RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4=req.getRequestDispatcher("logindiv.jsp");
                rd4.include(req, resp);
                
                RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
            }
        }
        catch(Exception e)
        {
            //out.print("Exception : "+e);
            
            RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2=req.getRequestDispatcher("menubar.jsp");
            rd2.include(req, resp);

            req.setAttribute("error_message", e.getMessage());
            RequestDispatcher rd3=req.getRequestDispatcher("error.jsp");
            rd3.include(req, resp);

            RequestDispatcher rd4=req.getRequestDispatcher("logindiv.jsp");
            rd4.include(req, resp);

            RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
            rd5.include(req, resp);
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
