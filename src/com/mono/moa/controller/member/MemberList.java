package com.mono.moa.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.mono.moa.controller.*;
import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

public class MemberList implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		MemberDao mDao = new MemberDao();
		ArrayList<MemberVO> list = mDao.getMembList();
		req.setAttribute("LIST", list);
		return "member/memberList";
	}
}