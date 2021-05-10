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
			
@WebServlet("/member/loginFindIdProc.cls")
public class LoginFindIdProc extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
			
			
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			MemberDao mDao = new MemberDao();
			int cnt = mDao.getTelCnt(tel);
			PrintWriter pw = resp.getWriter();
			
			String result = "NoCnt";
			if(cnt==0) {
				pw.print("{");
				pw.print("\"result\": \"" + result + "\"");
				pw.print("}");
				return;
			}
			
			MemberVO mVO = mDao.getTelInfo(name, tel);

			System.out.println(mVO.getEmail());
			int num = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
					
			MailUtil.gmailSend("인증번호 안내", "고객님의 임시 패스워드는" + num + "입니다", mVO.getEmail());
			
			String result1 = Integer.toString(num);
			String result2 = mVO.getId();
			System.out.println("인증번호 : " + result1);
			System.out.println("아이디 : " + result2);
			
			pw.print("{");
			pw.print("\"result1\": \"" + result1 + "\", ");
			pw.print("\"result2\": \"" + result2 + "\"");
			pw.print("}");
			
		}	
}
