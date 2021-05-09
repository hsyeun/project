package com.mono.moa.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.MemberDao;
import com.mono.moa.vo.MemberVO;

public class MyInfoEdit implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "member/myInfoEdit";
	
		String sid = (String) req.getSession().getAttribute("SID");
		if(sid == null) {
			req.setAttribute("isRedirect", true);
			view = "/moa/main.moa";
		}
		
		MemberDao mDao = new MemberDao();
		MemberVO mVO = mDao.getIdInfo(sid);
		
		req.setAttribute("DATA", mVO);
		return view;
	}

}
