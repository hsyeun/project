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

public class QnaListDetailAdmin implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String view = "review/qnaListDetailAdmin";
		
		String sid= (String) req.getSession().getAttribute("SID");
		if(sid == null) {
			req.setAttribute("isRedirect", true);
			view = "/moa/main.moa";
		}
		
		String nowPage = req.getParameter("nowPage");
		int bno = Integer.parseInt(req.getParameter("bno"));
			
		ReviewDao rDao = new ReviewDao();
		ReviewVO rVO = rDao.getBnoInfo(bno);
		
		ReviewVO uVO = null;
		if(rVO.getReply().equals("Y")) {
			uVO = rDao.getUpnoInfo(bno);
		}
		
		rVO.setId(rDao.getAdminMnoId(rVO.getMno()));
		req.setAttribute("DATA1", rVO);
		req.setAttribute("DATA2", uVO);
		
		req.setAttribute("nowPage", nowPage);
		return view;
	}

}
