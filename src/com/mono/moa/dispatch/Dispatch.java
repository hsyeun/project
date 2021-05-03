package com.mono.moa.dispatch;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;

/**
 * 이 클래스는 확장자가 .cafe로 요청이 오는 경우 
 * Dispatch 시킬 서블릿 클래스이다.
 * @author	moa
 * @since	2021.05.03
 * @version	v.0.91
 * 
 * @see
 *			v.0.91 작업내용
 *				2021.04.21 - 클래스 작성
 *								init() 구현
 *								service() 구현	
 */
@WebServlet("*.moa")
public class Dispatch extends HttpServlet {
	
	public HashMap<String, Controller> map;
	
	public void init(ServletConfig config) throws ServletException {
		
		Properties prop = new Properties();
		FileInputStream fin = null;
		try {
			String path = this.getClass().getResource("").getPath();

			fin = new FileInputStream(path + "../resources/Moa.properties");

			prop.load(fin);
	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch(Exception e) {}
		}
	
		map = new HashMap<String, Controller>();
		
		Enumeration en = prop.keys();
		while(en.hasMoreElements()) {
		
			String key = (String) en.nextElement();
		
			String strClass = prop.getProperty(key);
		
			try {
				
				Class tmp = Class.forName(strClass);
			
				Object o = tmp.newInstance();
				map.put(key, (Controller) o);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void service(HttpServletRequest req, HttpServletResponse resp)
											throws ServletException, IOException {
		
		String full = req.getRequestURI();
		
		String domain = req.getContextPath();

		String real = full.substring(domain.length());

		Controller controller = map.get(real);
	
		Boolean bool = false;
		
		req.setAttribute("isRedirect", bool);
	
		String view = controller.exec(req, resp);
		
		bool = (Boolean) req.getAttribute("isRedirect");
		
		if(bool == null) {
			
			PrintWriter pw = resp.getWriter();
			pw.print(view);
		} else if(bool) {
			
			resp.sendRedirect(view);
		} else {
			
			String prefix = "/WEB-INF/views/moa/";
			String surffix = ".jsp";
			
			RequestDispatcher rd = req.getRequestDispatcher(prefix + view + surffix);
			rd.forward(req, resp);
		}
	}
}
