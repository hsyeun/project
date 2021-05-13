package com.mono.moa.controller.subpage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.EventDao;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.EventVO;

public class EventPage implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "subpage/eventpage";
		String spage = req.getParameter("nowPage");
		int nowPage;
		try {
			nowPage = Integer.parseInt(spage);
		}catch(Exception e) {
			nowPage = 1;
		}
		
		EventDao eDao = new EventDao();
		int total = eDao.getTotal();
		
		PageUtil page = new PageUtil(nowPage, total, 3, 3);
		ArrayList<EventVO> list = eDao.getList(page);
		
		req.setAttribute("LIST", list);
		req.setAttribute("PAGE", page);
		
		return view;
	}

}
