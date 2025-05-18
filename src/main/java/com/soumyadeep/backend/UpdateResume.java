package com.soumyadeep.backend;

import com.soumyadeep.connection.DbConnection;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

//Enable file upload handling
@MultipartConfig(
 fileSizeThreshold = 1024 * 1024, // 1MB
 maxFileSize = 1024 * 1024 * 10,  // 10MB
 maxRequestSize = 1024 * 1024 * 50 // 50MB
)

public class UpdateResume extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String file_name=null;
        try
        {
            // Get the file part from the request
            Part filePart = req.getPart("uploadresume"); // "uploadprofilepic" should match the input name in your form
            file_name = extractFileName(filePart); // Extract the file name

            // Get the real path to the 'resumes' folder inside the web application
            String uploadPath = getServletContext().getRealPath("/resumes");
            
            // Ensure the directory exists
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Create directory if it does not exist
            }

            // Create the file in the specified directory
            File fileToSave = new File(uploadDir, file_name);
            
            // Write the file to the specified location
            filePart.write(fileToSave.getAbsolutePath());
            //System.out.println("File uploaded to: " + fileToSave.getAbsolutePath());
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        HttpSession session=req.getSession();
        String email=(String)session.getAttribute("session_email");
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps1=con.prepareStatement("select * from resumes where email=?");
            ps1.setString(1, email);
            
            ResultSet rs=ps1.executeQuery();
            if(rs.next())
            {
                //update
                PreparedStatement ps2=con.prepareStatement("update resumes set path=? where email=?");
                ps2.setString(1, file_name);
                ps2.setString(2, email);
                
                int i=ps2.executeUpdate();
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
                    
                    RequestDispatcher rd2=req.getRequestDispatcher("upload-resume.jsp");
                    rd2.include(req, resp);
                }
            }
            else
            {
                //insert
                PreparedStatement ps3=con.prepareStatement("insert into resumes(email, path) values(?,?)");
                ps3.setString(1, email);
                ps3.setString(2, file_name);
                
                int i=ps3.executeUpdate();
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
                    
                    RequestDispatcher rd2=req.getRequestDispatcher("upload-resume.jsp");
                    rd2.include(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            
            try
            {
                con.rollback();
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
                    
            RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2=req.getRequestDispatcher("upload-resume.jsp");
            rd2.include(req, resp);
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
	
    // Helper method to extract the file name from the Part
    private String extractFileName(Part part)
    {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items)
        {
            if (item.trim().startsWith("filename"))
            {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return null;
    }
}
