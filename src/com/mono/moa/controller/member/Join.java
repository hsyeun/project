package com.mono.moa.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;

public class Join implements Controller {

	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String view = "member/join";
		return view;
	}

}
