package com.mono.moa.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.MemberDao;

public class LoginProc implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sid = req.getParameter("id");
		String spw = req.getParameter("pw");
		
		if( (sid+spw).equals("adminadmin") ) {
			req.getSession().setAttribute("SID", sid);
			req.setAttribute("isRedirect", true);
			return "/moa/review/qnaListAdmin.moa";
		}
		
		MemberDao mDao = new MemberDao();
		int cnt = mDao.getLogin(sid, spw);
		
		String view = "/moa/main.moa";
		
		if(cnt == 1) {
			req.getSession().setAttribute("SID", sid);
			req.setAttribute("isRedirect", true);
		} else {
			view = "/member/login";
			req.setAttribute("MSG", "fail");
		}
		return view;	
	}

}
