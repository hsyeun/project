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

public class QnaWriteProc implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "review/qnaList";
		
		String sid= (String) req.getSession().getAttribute("SID");
		if(sid == null) {
			req.setAttribute("isRedirect", true);
			view = "/moa/main.moa";
		}
		
		String spage = req.getParameter("nowPage");
		int nowPage;
		try {
			nowPage = Integer.parseInt(spage);
		} catch (Exception e) {
			nowPage = 1;
		}
		
		ReviewDao rDao = new ReviewDao();
		
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		
		rDao.addQna(sid, title, body);
		
		int total = rDao.getTotalCnt(sid);
		PageUtil page = new PageUtil(nowPage, total, 1, 3);
		
		ArrayList<ReviewVO> list = rDao.getPageList(sid, page);
		req.setAttribute("LIST", list);
		req.setAttribute("PAGE", page);

		return view;
	}

}
