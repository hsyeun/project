package com.mono.moa.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet({"/css/*", "/js/*", "/img/*"})
public class Resrc extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		String url = req.getRequestURI(); 
				
		url = url.substring(url.indexOf("/", 1));
		
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/resources" + url);
		try {
			rd.forward(req, resp);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
