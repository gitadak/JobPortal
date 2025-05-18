package com.soumyadeep.backend;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.soumyadeep.connection.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class AddExperienceDetails extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        //PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2=(String)session.getAttribute("session_email");
        
        String company2=req.getParameter("company1");
        String location2=req.getParameter("location1");
        String year2=req.getParameter("year1");
        String jobtitle2=req.getParameter("jobtitle1");
        String description2=req.getParameter("description1");
        
        Connection con = null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps=con.prepareStatement("insert into experience(email, company, location, year, job_title, description) values(?,?,?,?,?,?)");
            ps.setString(1, email2);
            ps.setString(2, company2);
            ps.setString(3, location2);
            ps.setString(4, year2);
            ps.setString(5, jobtitle2);
            ps.setString(6, description2);
            
            int i=ps.executeUpdate();
            if(i>0)
            {
            	con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else
            {
            	con.rollback();
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("add-profile-experience.jsp");
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
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
        }
    }
}
