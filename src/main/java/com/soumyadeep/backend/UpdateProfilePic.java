package com.soumyadeep.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.soumyadeep.connection.DbConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/*// Define the servlet URL mapping
@WebServlet("/UpdateProfilePic")*/

// Enable file upload handling
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 10,  // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)

public class UpdateProfilePic extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("session_email");

        String fileName = null;
        try
        {
           /* // Get the file part from the request
            Part filePart = req.getPart("uploadprofilepic");  // "uploadprofilepic" should be the name attribute in the form
            fileName = extractFileName(filePart);  // Extract file name from the file part
            System.out.println(fileName);
            // Define the path where the file will be saved
            String uploadPath = PathDetails.PROFILE_PIC_PATH + fileName;

            System.out.println(uploadPath);
            // Write the file to the desired location
            filePart.write(uploadPath);*/
        	
            // Get the file part from the request
            Part filePart = req.getPart("uploadprofilepic"); // "uploadprofilepic" should match the input name in your form
            fileName = extractFileName(filePart); // Extract the file name

            // Get the real path to the 'profilepics' folder inside the web application
            String uploadPath = getServletContext().getRealPath("/profilepics");
            
            // Ensure the directory exists
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Create directory if it does not exist
            }

            // Create the file in the specified directory
            File fileToSave = new File(uploadDir, fileName);
            
            // Write the file to the specified location
            filePart.write(fileToSave.getAbsolutePath());
            //System.out.println("File uploaded to: " + fileToSave.getAbsolutePath());
            //C:\Users\DELL\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\JobPortal\profilepics
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        Connection con = null;
        try
        {
            // Establish database connection
            con = DbConnection.getConnect();
            con.setAutoCommit(false);

            // Update profile picture path in the database
            PreparedStatement ps = con.prepareStatement("UPDATE profile_pics SET path=? WHERE email=?");
            ps.setString(1, fileName);
            ps.setString(2, email);

            int i = ps.executeUpdate();
            if (i > 0)
            {
                // Update session with the new profile picture
                session.setAttribute("session_profilepic", fileName);
                con.commit();
                resp.sendRedirect("edit-profile-pic.jsp");
            }
            else
            {
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-pic.jsp");
                rd2.include(req, resp);
            }
        }
        catch (Exception e)
        {
            try
            {
                con.rollback();

                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-pic.jsp");
                rd2.include(req, resp);
            }
            catch (Exception ee)
            {
                ee.printStackTrace();
            }
            e.printStackTrace();
        }
        finally
        {
            try
            {
                if (con != null)
                {
                    con.close();
                }
            }
            catch (Exception e)
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
