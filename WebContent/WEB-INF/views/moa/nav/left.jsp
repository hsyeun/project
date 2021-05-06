<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%
		String active = request.getParameter("active");
		String joinClass = "";
		String memberClass = "";
		String faqClass = "";
		
		if(active.equals("join")) joinClass = "active";
		if(active.equals("member")) memberClass = "active";
		if(active.equals("faq")) faqClass = "active";
	%>
	
	<li>
        <a href="index.html" class="<%=joinClass%>"><i class="fa fa-dashboard fa-fw"></i> 회원가입</a>
    </li>
    <li>
        <a href="index.html" class="<%=memberClass%>"><i class="fa fa-dashboard fa-fw"></i> 회원리스트</a>
    </li>
    <li>
        <a href="index.html" class="<%=faqClass%>"><i class="fa fa-dashboard fa-fw"></i> FAQ</a>
    </li>  