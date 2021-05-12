package com.mono.moa.controller.menupage;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.mono.moa.controller.*;
import com.mono.moa.dao.*;
import com.mono.moa.util.*;
import com.mono.moa.vo.*;

public class Menu_1 implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "menupage/menu1";

		String spage = req.getParameter("nowPage");
		int nowPage = 1;
		try {
			nowPage = Integer.parseInt(spage);
		} catch(Exception e){
			
		}
		
		ExinfoDao eDao = new ExinfoDao();
		
		int total = eDao.getTotal();
		
		PageUtil page = new PageUtil(nowPage, total, 9, 3);
		
		System.out.println("########## start page : " + page.getStartPage());
		
		String sno = req.getParameter("exino");
		
		ExinfoVO eVO = null;
		if(sno != null) {
			// 파라미터로 전달받은 전시번호
			int mno = Integer.parseInt(sno);
			
			eVO = eDao.getExInfo(mno);
			
			req.setAttribute("DATA", eVO);
		} else {
			// 가장 최근 전시번호
			ArrayList<ExinfoVO> list = eDao.getLatest(page);
//			int exino = eDao.getLatest();
//			eVO = eDao.getExInfo(exino);
			req.setAttribute("LIST", list);
		}
		
		req.setAttribute("PAGE", page);
		
		return view;
	}

}
