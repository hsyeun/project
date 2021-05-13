package com.mono.moa.controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.BoardDao;
import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.BoardVO;

public class AllBoardList implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="board/allboardlist";
		String spage = req.getParameter("nowPage");
		int nowPage = 1;
		try {
			nowPage = Integer.parseInt(spage);
		}catch(Exception e ) {
			
		}
		
		BoardDao bDao = new BoardDao();
		int total = bDao.getTotal();
		
		PageUtil page = new PageUtil(nowPage, total, 4,4);
		
		ArrayList<BoardVO> list = bDao.getList(page);
		
		System.out.println("################ : " + list.get(0).getNbody());
		
		/* String code = bDao.getBoardList(); */
		
		req.setAttribute("LIST", list);
		req.setAttribute("PAGE", page);
		
		
		return view;
	}

}
