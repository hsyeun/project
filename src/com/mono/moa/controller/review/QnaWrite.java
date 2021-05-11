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

public class QnaWrite implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "review/qnaWrite";
		
		String sid= (String) req.getSession().getAttribute("SID");
		if(sid == null) {
			req.setAttribute("isRedirect", true);
			view = "/moa/main.moa";
		}
		
		String spage = req.getParameter("nowPage");
				
		ReviewDao rDao = new ReviewDao();
		
		int total = rDao.getTotalCnt(sid);
		
		//ArrayList<ReviewVO> list = rDao.getPageList(sid, page);
		//req.setAttribute("LIST", list);
		//req.setAttribute("PAGE", page);
		
		return view;
	}

}
