package com.mono.moa.controller;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.mono.moa.util.*;
import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

public class Main implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String view = "main";
		ExinfoDao eDao = new ExinfoDao();
		
		int total = eDao.getTotal();
		
		PageUtil page = new PageUtil(1, total);
		
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
		
//		req.setAttribute("DATA", eVO);
		
		return view;
	} 

}
