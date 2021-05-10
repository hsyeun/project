package com.mono.moa.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;

public class Qna implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "review/qna";
		
		if(req.getSession().getAttribute("SID") == null) {
			req.setAttribute("isRedirect", true);
			view = "/moa/main.moa";
		}
		
		return view;
	}

}
