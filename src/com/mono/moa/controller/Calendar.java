package com.mono.moa.controller;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

public class Calendar implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "main";
		
		/*
			전시번호, 전시이름, 시작일
		 */
//		int cal = (int) req.getAttribute("CAL");
		
		ExinfoDao eDao = new ExinfoDao();
		ArrayList<String> elist = eDao.getJson();
		req.setAttribute("ARR", elist);
		
		/*
		 * int total = eDao.getTotal(); 
		 * PageUtil page = new PageUtil(1, total);
		 */
		
		String sno = req.getParameter("exino");	
		
		// 파라미터로 전달받은 전시번호
		int mno = Integer.parseInt(sno);
		
		
	
		
		return view;
	}

}
