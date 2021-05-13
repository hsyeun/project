package com.mono.moa.controller.menupage;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.mono.moa.controller.*;
import com.mono.moa.dao.*;
import com.mono.moa.util.*;
import com.mono.moa.vo.*;

public class Menu_2 implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "menupage/menu2";
		
		//페이징 처리
		String spage = req.getParameter("nowPage");
		int nowPage;
		try {
			nowPage = Integer.parseInt(spage);
		} catch(Exception e){
			nowPage = 1;
		}
		
		ExinfoDao eDao = new ExinfoDao();
		
		int total = eDao.getTotal();
		
		PageUtil page = new PageUtil(nowPage, total, 9, 3);
		
		
		//특정값 처리
		String sno = req.getParameter("exiecno");
		
		ExinfoVO eVO = null;
		if(sno != null || sno == "1") {
			// 파라미터로 전달받은 전시번호
			int mno = Integer.parseInt(sno);
			
			eVO = eDao.getTmInfo(mno);
			
			System.out.println("########## mno : " + mno);
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
