package com.mono.moa.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.MemberDao;
import com.mono.moa.util.MailUtil;
import com.mono.moa.vo.MemberVO;

@WebServlet("/member/loginFindProc.cls")
public class LoginFindProc extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
				
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			MemberDao mDao = new MemberDao();
			MemberVO mVO = mDao.getTelInfo(name, tel);
			req.setAttribute("DATA", mVO);
			System.out.println(mVO.getEmail());
			int num = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
					
			MailUtil.gmailSend("인증번호 안내", "고객님의 인증번호는" + num + "입니다", mVO.getEmail());
			
			String result = Integer.toString(num);
			System.out.println(result);
			PrintWriter pw = resp.getWriter();
			
			pw.println("{");
			pw.println("\"result\" : \"" + num + "\"");
			pw.println("}");
		}	
}
