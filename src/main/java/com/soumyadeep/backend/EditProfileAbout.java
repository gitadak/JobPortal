package com.soumyadeep.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.soumyadeep.connection.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditProfileAbout extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2=(String)session.getAttribute("session_email");
        
        String name2=req.getParameter("name1");
        String city2=req.getParameter("city1");
        String gender2=req.getParameter("gender1");
        String about2=req.getParameter("about1");
        String skills2=req.getParameter("skills1");
        
        Connection con = null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps1=con.prepareStatement("update register set name=?, city=?, gender=? where email=?");
            ps1.setString(1, name2);
            ps1.setString(2, city2);
            ps1.setString(3, gender2);
            ps1.setString(4, email2);
            int i1=ps1.executeUpdate();
            
            PreparedStatement ps2=con.prepareStatement("update about_user set about=?, skills=? where email=?");
            ps2.setString(1, about2);
            ps2.setString(2, skills2);
            ps2.setString(3, email2);
            int i2=ps2.executeUpdate();

            if(i1>0 && i2>0)
            {
                con.commit();
                
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                
                session.setAttribute("session_about", about2);
                session.setAttribute("session_skills", skills2);
                
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                con.rollback();
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-about.jsp");
                rd2.include(req, resp);
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
