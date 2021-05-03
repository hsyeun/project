package com.mono.moa.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public interface Controller {
	String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
