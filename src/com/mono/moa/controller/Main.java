package com.mono.moa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main implements Controller {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String view = "main";
<<<<<<< HEAD

=======
		
>>>>>>> branch 'branch' of https://github.com/sooyeun-han/project.git
		return view;
	} 

}
