package com.mono.moa.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.MemberDao;
import com.mono.moa.vo.MemberVO;

public class MyInfoEditProc implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		String sid = (String) req.getSession().getAttribute("SID");
		if(sid == null) {
			req.setAttribute("isRedirect", true);
			return "/moa/main.moa";
		}
		
		MemberVO mVO = new MemberVO();
		
		mVO.setName(req.getParameter("name"));
		mVO.setId(sid);
		mVO.setPw(req.getParameter("pw"));
		mVO.setTel(req.getParameter("tel"));
		mVO.setEmail(req.getParameter("email"));
		mVO.setGen(req.getParameter("gen"));
		mVO.setBirth(req.getParameter("birth"));
		
		MemberDao mDao = new MemberDao();
		int cnt = 0;
		cnt = mDao.editMember(mVO);

		String view = "";
		req.setAttribute("isRedirect", true);
		if(cnt==1) {
			view = "/moa/member/myInfo.moa";
		} else {
			view = "/moa/member/myInfoEdit.moa";
		}
		return view;
	}

}
