package com.soumyadeep.backend;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DownloadResumeBuilder extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String file_name = req.getParameter("fn");
        File file = new File(PathDetails.RESUME_BUILDER_PATH + file_name);
        
        // Check if file exists
        if (!file.exists()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Set content type based on file extension
        String mimeType = getServletContext().getMimeType(file.getAbsolutePath());
        if (mimeType == null) {
            mimeType = "application/octet-stream"; // Fallback to binary type
        }

        // Set response headers
        resp.setContentType(mimeType);
        resp.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
        resp.setContentLength((int) file.length());

        // Stream the file content to the response
        try (FileInputStream fis = new FileInputStream(file);
             OutputStream out = resp.getOutputStream()) {
            
            byte[] buffer = new byte[4096]; // 4KB buffer
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
