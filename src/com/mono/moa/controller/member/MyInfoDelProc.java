package com.mono.moa.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.MemberDao;

public class MyInfoDelProc implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String view = "/moa/main.moa";
		req.setAttribute("isRedirect", true);
		
		String sid = req.getParameter("id");
		
		MemberDao mDao = new MemberDao();
		int cnt = mDao.delMember(sid);
		
		if(cnt==1) {
			req.getSession().removeAttribute("SID");
		}
		
		return view;
	}

}
