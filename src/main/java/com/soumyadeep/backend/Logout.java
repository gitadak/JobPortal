package com.soumyadeep.backend;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Logout extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Cookie[] ck=req.getCookies();
        for(Cookie cookie : ck)
        {
            cookie.setMaxAge(0);
            resp.addCookie(cookie);
        }
        
        HttpSession session=req.getSession();
        session.invalidate();
        
        resp.sendRedirect("login.jsp");
    }
}
