package com.mono.moa.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;

public class MyPageJim implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "/mypage/myPageJim";
		/*
		 * req.getSession().removeAttribute("SID"); req.setAttribute("isRedirect",
		 * true);
		 */
		
		return view;
	}

}
