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

public class QnaListDetail implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "review/qnaListDetail";
		
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
		if(rVO.getUpno()==0) {
			uVO = rDao.getUpnoInfo(bno);
		}
		
		req.setAttribute("DATA1", uVO);
		req.setAttribute("DATA", rVO);
		req.setAttribute("PAGE", nowPage);
		
		return view;
	}

}
