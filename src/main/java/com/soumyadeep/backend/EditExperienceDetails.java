package com.soumyadeep.backend;

import com.soumyadeep.connection.DbConnection;
import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditExperienceDetails extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        //PrintWriter out=resp.getWriter();
        
        String id2=req.getParameter("id1");
        String company2=req.getParameter("company1");
        String location2=req.getParameter("location1");
        String year2=req.getParameter("year1");
        String job_title2=req.getParameter("job_title1");
        String description2=req.getParameter("description1");
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps=con.prepareStatement("update experience set company=?, location=?, year=?, job_title=?, description=? where id=?");
            ps.setString(1, company2);
            ps.setString(2, location2);
            ps.setString(3, year2);
            ps.setString(4, job_title2);
            ps.setString(5, description2);
            ps.setString(6, id2);
            
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
                
                RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-experience.jsp");
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
            //out.print("Exception "+e);
            RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-experience.jsp");
            rd2.include(req, resp);
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
