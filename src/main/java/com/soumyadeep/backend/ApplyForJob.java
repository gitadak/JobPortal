package com.soumyadeep.backend;

import com.soumyadeep.connection.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ApplyForJob extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session=req.getSession();
        String email=(String) session.getAttribute("session_email");
        
        String jid=req.getParameter("jobid");
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
        String date1=sdf1.format(d);
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        String time1=sdf2.format(d);
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            /*create table applied_jobs(id int auto_increment, email varchar(100), jobid varchar(100), date1 varchar(100), time1 varchar(100), primary key(id));*/
            PreparedStatement ps=con.prepareStatement("insert into applied_jobs(email, jobid, date1, time1) values(?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, jid);
            ps.setString(3, date1);
            ps.setString(4, time1);
            int i=ps.executeUpdate();
            if(i>0)
            {
                con.commit();
                
                req.setAttribute("success_message", "You have successfully applied for job...!!");
                
                RequestDispatcher rd1=req.getRequestDispatcher("success.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("job-description.jsp?jid="+jid);
                rd2.include(req, resp);
            }
            else
            {
                con.rollback();
                
                req.setAttribute("error_message", "Job not applied due to some error...!!");
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("job-description.jsp?jid="+jid);
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {
            try
            {
                con.rollback();
                
                req.setAttribute("error_message", "Job not applied due to some error...!!");
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("job-description.jsp?jid="+jid);
                rd2.include(req, resp);
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
            e.printStackTrace();
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
