package com.mono.moa.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.dao.MemberDao;

@WebServlet("/member/idCheck.cls")
public class IdCheck extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
			
			String sid = req.getParameter("id");
			MemberDao mDao = new MemberDao();
			int cnt = mDao.getIdCnt(sid);
			String result = "NO";
			if(cnt == 0) {
		
				result = "OK";
			}

			PrintWriter pw = resp.getWriter();
			
			pw.println("{");
			pw.println("\"result\" : \"" + result + "\"");
			pw.println("}");
			
			
		}
	
}
