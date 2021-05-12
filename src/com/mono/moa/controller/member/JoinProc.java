package com.mono.moa.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.*;
import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

public class JoinProc implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO mVO = new MemberVO();
		
		mVO.setName(req.getParameter("name"));
		mVO.setId(req.getParameter("id"));
		mVO.setPw(req.getParameter("pw"));
		mVO.setTel(req.getParameter("tel"));
		mVO.setEmail(req.getParameter("email"));
		mVO.setGen(req.getParameter("gen"));
		mVO.setBirth(req.getParameter("birth"));
		
		MemberDao mDao = new MemberDao();
		PointDao pDao = new PointDao();
		int cnt = 0;
		cnt = mDao.addMember(mVO);

		String view = "/moa/main.moa";
		req.setAttribute("isRedirect", true);
		if(cnt==1) {
			req.getSession().setAttribute("SID", mVO.getId());
			cnt = pDao.getPoint(mVO.getId());
		} else {
			view = "/moa/member/join.moa";
		}
		return view;
	}

}
