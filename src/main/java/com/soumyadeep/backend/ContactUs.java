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

public class ContactUs extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String name1=req.getParameter("name1");
        String email1=req.getParameter("email1");
        String subject1=req.getParameter("subject1");
        String message1=req.getParameter("message1");
        
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
            
            /*create table contact_us(id int auto_increment, name varchar(100), email
 			varchar(100), subject varchar(200), message varchar(500), date1 varchar(100),
 			time1 varchar(100), primary key(id));*/
            PreparedStatement ps=con.prepareStatement("insert into contact_us(name, email, subject, message, date1, time1) values(?,?,?,?,?,?)");
            ps.setString(1, name1);
            ps.setString(2, email1);
            ps.setString(3, subject1);
            ps.setString(4, message1);
            ps.setString(5, date1);
            ps.setString(6, time1);
            
            int i=ps.executeUpdate();
            if(i>0)
            {
                con.commit();
                
                String subject11="Thank you";
                String message11="Thank you for contacting us, our team will contact you as soon as possible...!!";
                SendConfirmationMail.sendConfirmationMail(email1, subject11, message11);
                
                //resp.sendRedirect("contact-us.jsp");
                
                req.setAttribute("success_message", "Your Message has been sended successfully");
                
                RequestDispatcher rd1=req.getRequestDispatcher("success.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("contact-us.jsp");
                rd2.include(req, resp);
            }
            else
            {
                con.rollback();
                
                //resp.sendRedirect("contact-us.jsp");
                
                req.setAttribute("error_message", "Your Message has not been submitted due to some error...!!");
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("contact-us.jsp");
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            
            try
            {
                con.rollback();
            
                //resp.sendRedirect("contact-us.jsp");
                
                req.setAttribute("error_message", e.getMessage());
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("contact-us.jsp");
                rd2.include(req, resp);
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
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doService(req, resp);
    }
}
