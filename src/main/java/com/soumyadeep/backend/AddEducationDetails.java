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

public class AddEducationDetails extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        //PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2=(String)session.getAttribute("session_email");
        
        String school2=req.getParameter("school1");
        String degree2=req.getParameter("degree1");
        String year2=req.getParameter("year1");
        String grade2=req.getParameter("grade1");
        String description2=req.getParameter("description1");
        
        Connection con = null;
        PreparedStatement ps = null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            ps=con.prepareStatement("insert into education(email, school, degree, year, grade, description) values(?,?,?,?,?,?)");
            ps.setString(1, email2);
            ps.setString(2, school2);
            ps.setString(3, degree2);
            ps.setString(4, year2);
            ps.setString(5, grade2);
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
                
                RequestDispatcher rd2=req.getRequestDispatcher("add-profile-education.jsp");
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
                ps.close();
                con.close();
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
        }
    }
}
