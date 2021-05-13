package com.mono.moa.controller.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.ReviewDao;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.ReviewVO;

public class QnaDelAdmin implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReviewDao rDao = new ReviewDao();
		int bno = Integer.parseInt(req.getParameter("bno"));	
		rDao.delQna(bno);
		rDao.delAdminReply(bno);
		
		req.setAttribute("isRedirect", true);
		String view = "/moa/review/qnaListAdmin.moa";
		
		String sid= (String) req.getSession().getAttribute("SID");
		if(sid == null) {
			view = "/moa/main.moa";
		}

		return view;
	}

}
