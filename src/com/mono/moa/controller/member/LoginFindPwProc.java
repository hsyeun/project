package com.mono.moa.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mono.moa.controller.Controller;
import com.mono.moa.dao.MemberDao;
import com.mono.moa.util.MailUtil;
import com.mono.moa.vo.MemberVO;
			
@WebServlet("/member/loginFindPwProc.cls")
public class LoginFindPwProc extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
			
			
			String id = req.getParameter("id");
			String tel = req.getParameter("tel");
			MemberDao mDao = new MemberDao();
			int cnt = mDao.getIdTelCnt(id, tel);
			PrintWriter pw = resp.getWriter();
			
			String result = "NoCnt";
			if(cnt==0) {
				pw.print("{");
				pw.print("\"result\": \"" + result + "\"");
				pw.print("}");
				return;
			}
			
			MemberVO mVO = mDao.getIdInfo(id);

			System.out.println(mVO.getEmail());

			
			Random rnd =new Random();
			StringBuffer buf =new StringBuffer();

			for(int i=0;i<10;i++){
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			}	String num = buf.toString();
			
					
			MailUtil.gmailSend("인증번호 안내", "고객님의 임시패스워드는" + num + "입니다", mVO.getEmail());
			
			String result1 = num;
			System.out.println("인증번호 : " + result1);
			
			pw.print("{");
			pw.print("\"result1\": \"" + result1 + "\"");
			pw.print("}");
			
			mVO.setPw(num);
			mVO.setGen(mVO.getGen().equals("남자") ? "M" : "F");	
			mDao.editMember(mVO);
		}	
}
