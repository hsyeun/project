<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String active = request.getParameter("active"); %>
<script>
	$(document).ready(function(){
		if('${SID}'){
			$('.navShow').children().eq(0).css('display', 'none');
			$('.navShow').children().eq(2).css('display', 'none');
			
		} else {
			$('.navShow').children().eq(1).css('display', 'none');
			$('.navShow').children().eq(3).css('display', 'none');
		}
		
		switch('<%=active%>'){
		case '로그인' : $('.navShow').children().eq(0).addClass('active'); break;
		case '회원가입' : $('.navShow').children().eq(2).addClass('active'); break;
		case '마이페이지' : $('.navShow').children().eq(3).addClass('active'); break;
		}
	});
	
</script>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="f-size" href="/moa/main.moa">MOA</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto navShow">
                <li class="nav-item"><a class="nav-link <%=active %>" href="/moa/member/login.moa">로그인</a></li>
                <li class="nav-item"><a class="nav-link <%=active %>" href="/moa/member/logout.moa">로그아웃</a></li>                  
                <li class="nav-item"><a class="nav-link <%=active %>" href="/moa/member/join.moa">회원가입</a></li>
                <li class="nav-item"><a class="nav-link <%=active %>" href="/moa/member/myPage.moa">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link <%=active %>" href="#">고객센터</a></li>
                <li class="nav-item"><a class="nav-link <%=active %>"  href="#">이벤트</a></li>
            </ul>
        </div>
        <div class="gnb">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link gnb-hover" href="#">일반 전시</a></li>                  
                <li class="nav-item"><a class="nav-link gnb-hover" href="#">미술전</a></li>
                <li class="nav-item"><a class="nav-link gnb-hover" href="#">테마전</a></li>
            </ul>
        </div>
    </div>
</nav>