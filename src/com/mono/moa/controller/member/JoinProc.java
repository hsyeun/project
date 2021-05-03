package com.mono.moa.controller.member;

import java.util.ArrayList;

import javax.servlet.http.*;

import com.mono.moa.controller.*;
import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

public class JoinProc implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
	
		String sname = req.getParameter("name");
		String sid = req.getParameter("id");
		String spw = req.getParameter("pw");
		String stel = req.getParameter("tel");
		String semail = req.getParameter("email");
		String sgen = req.getParameter("gen");
		String sbirth = req.getParameter("birth");
		
		MemberVO mVO = new MemberVO();
		mVO.setName(sname);
		mVO.setId(sid);
		mVO.setPw(spw);
		mVO.setTel(stel);
		mVO.setEmail(semail);	
		mVO.setGen(sgen);
		mVO.setBirth(sbirth);

		MemberDao mDao = new MemberDao();
		mDao.addMember(mVO);
	
		String view = "/moa/member/memberList.moa";
		req.setAttribute("isRedirect", true);
				
		return view;
	}
}