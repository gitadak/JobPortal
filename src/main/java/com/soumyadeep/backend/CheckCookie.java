package com.soumyadeep.backend;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckCookie extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session=req.getSession();
        
        String email=(String) session.getAttribute("session_email");
        
        if(email==null ? email==null : email.trim().equals("null"))
        {
            Cookie[] ck=req.getCookies();
            if(ck != null)
            {
                for(Cookie cookie : ck)
                {
                    if(cookie.getName().equals("cookie_email"))
                    {
                        email=cookie.getValue();

                        req.setAttribute("email1", email);

                        RequestDispatcher rd=req.getRequestDispatcher("GetUserData");
                        rd.include(req, resp);
                    }
                }
            }
            else
            {
                resp.sendRedirect("index.jsp");
            }
            //System.out.println("i am on CheckCookie page : "+email);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doService(req, resp);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doService(req, resp);
    }
}
