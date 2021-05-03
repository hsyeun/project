<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Calendar cal = Calendar.getInstance();
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null){
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
}else{}

//년도/월 셋팅

cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;


//오늘 날짜 저장.

Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css">
<script type="text/javascript" src="/cafe/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/cafe/js/w3color.js"></script>
<style type="text/css">
	.rebtn {
		padding: 3px 10px;
	}
	 body {
        scrollbar-face-color: #F6F6F6;
        scrollbar-highlight-color: #bbbbbb;
        scrollbar-3dlight-color: #FFFFFF;
        scrollbar-shadow-color: #bbbbbb;
        scrollbar-darkshadow-color: #FFFFFF;
        scrollbar-track-color: #FFFFFF;
        scrollbar-arrow-color: #bbbbbb;
        margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
        }
	td {
		font-family: "돋움"; font-size: 9pt; color:#595959;
	}

	th {
		font-family: "돋움"; font-size: 9pt; color:#000000;
	}

	select {
		font-family: "돋움"; font-size: 9pt; color:#595959;
	}

	.divDotText {
        overflow:hidden;
        text-overflow:ellipsis;
	}

	A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
	A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
	A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
	A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		// 여러태그를 동시에 이벤트를 처리하는 방법
		$('.w3-button').click(function(){
			var tid = $(this).attr('id');
			var url = '';
			switch(tid){
			case 'hbtn':
				url = '/cafe/main.cafe';
				break;
			case 'lbtn':
				url = '/cafe/member/login.cafe';
				break;
			case 'jbtn':
				url = '/cafe/member/join.cafe';
				break;
			case 'outbtn':
				url = '/cafe/member/logout.cafe';
				break;
			case 'wbtn':
				url = '/cafe/reBoard/reBoardWrite.cafe'; // 원글 쓰기 버튼 이벤트 처리
				break;
			}
			$(location).attr('href', url);
		});
		
		$('.rebtn').click(function(){
			var tid = $(this).attr('id');
			var pre = tid.substring(0,1);	//id의 앞글자 추출
			var tno = tid.substring(1);		//글번호 추출
			
			if(pre == 'r'){
				var tmp1 = '#t' + tno;
				var tmp2 = '#a' + tno;
				var title = $(tmp1).html();
				$('#upno').val(tno);
				$('#nowPage').val((row == '${PAGE.endCont}') ? 'L${PAGE.nowPage}' : '${PAGE.nowPage}');
				$('#title').val(title);
				
				$('#frm').submit();
				return;
				
			} else if (pre == 'e'){
				$('#rno').val(tno);
				$('#nowPage').val('${PAGE.nowPage}');
				
				$('#frm').attr('action', '/cafe/board/boardEdit.cafe');
				$('#frm').submit();
			} else if (pre == 'd'){
				$('#rno').val(tno);
				
				$('#frm').attr('action','/cafe/reBoard/reBoardDel.cafe');
				$('#frm').submit(); 
			}
		});
		
		// 페이지 버튼 이벤트 처리
		$('.pbtn').click(function(){
			var spage = $(this).html();
			
			switch(spage){
			case 'pre':
				$('#nowPage').val('${PAGE.startPage - 1}');
				break;
			case 'next':
				$('#nowPage').val('${PAGE.endPage + 1}');
				break;
			default:
				$('#nowPage').val(spage);
			}
			$('#frm').attr('action', '/cafe/board/boardList.cafe');
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
<c:if test="${not empty param.msg}">
	<script type="text/javascript">
		alert('수정작업에 실패했습니다!');
	</script>
</c:if>
	<form method="POST" action="/cafe/board/boardReply.cafe" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="rno" id="rno">
		<input type="hidden" name="upno" id="upno">
		<input type="hidden" name="title" id="title">
	</form>
	<div class="w3-content mxw750 w3-margin-top">
		<header class="w3-col w3-card-4 mgb20">
			<h1 class="w3-green w3-center w3-padding mg0">댓글 게시판</h1>
			<nav class="w3-bar w3-pale-yellow">
				<div class="w3-col w150 w3-left w3-button w3-small w3-amber" id="hbtn">home</div>
<c:if test="${not empty SID}">
				<div class="w3-col w150 w3-left w3-button w3-small w3-lime w3-right" id="wbtn">글작성</div>
				<div class="w3-col w150 w3-left w3-button w3-small w3-light-green w3-right" id="outbtn">logout</div>
</c:if>
<c:if test="${empty SID}">
				<div class="w3-col w150 w3-left w3-button w3-small w3-deep-orange w3-right" id="lbtn">login</div>
				<div class="w3-col w150 w3-left w3-button w3-small w3-yellow w3-right" id="jbtn">join</div>
</c:if>
		</nav>
		</header>
		
<c:forEach var="data" items="${LIST}">
		<div class="w3-col" style="padding-left: ${(data.step <= 2) ? data.step * 70 : 140}px">
			<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
				<div class="w3-col w120 w3-center pdAll10">
					<img src="/cafe/img/avatar/${data.avatar}" class="inblock w3-circle avtBox100 border3px w3-card-2" id="a${data.rno}">
					<span class="w3-col mgt10 ft10"><b>${data.id}</b></span>
				</div>
				<div class="w3-rest w3-padding h100per">
					<div class="w3-col w3-border-bottom w3-border-grey">
						<div class="w3-col w3-border-bottom">
							<span class="mgt10 ft10"><b id="t${data.bno}">${data.title}</b></span>
							<span class="w3-right mgb10 ft10">${data.sdate}</span>
						</div>
						<div class="w3-col w3-margin-top">
							<span class="w3-col w3-padding ft12 bdminH">${data.body}</span>
						</div>
					</div>
					<div class="w3-col mgt10" id="row${data.rno}">
						<span class="w3-button w3-blue w3-small w3-left w3-round-medium rebtn" id="r${data.bno}">댓글달기</span><!-- r100001 -->
		<c:if test="${SID eq data.id}">
						<span class="w3-button w3-green w3-small w3-right w3-round-medium mgl10 rebtn" id="e${data.bno}">수정하기</span>
						<span class="w3-button w3-red w3-small w3-right w3-round-medium rebtn" id="d${data.bno}">삭제하기</span>
		</c:if>			
					</div>
				</div>
			</div>
		</div>
</c:forEach>

	<!-- 페이징처리 -->
		<div class="w3-center w3-margin-bottom">
			<div class="w3-bar w3-border w3-round w3-margin-top">
	<c:if test="${PAGE.startPage == 1}">
				<span class="w3-bar-item w3-grey">pre</span>
	</c:if>
	<c:if test="${PAGE.startPage != 1}">
				<span class="w3-bar-item w3-button w3-hover-aqua pbtn">pre</span>
	</c:if>
<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
	<c:if test="${PAGE.nowPage == page}">
				<span class="w3-bar-item w3-button w3-hover-aqua w3-blue pbtn">${page}</span>
	</c:if>
	<c:if test="${PAGE.nowPage != page}">
				<span class="w3-bar-item w3-button w3-hover-aqua pbtn">${page}</span>
	</c:if>
</c:forEach>
	<c:if test="${PAGE.endPage == PAGE.totalPage}">
				<span class="w3-bar-item w3-grey">next</span>
	</c:if>
	<c:if test="${PAGE.endPage != PAGE.totalPage}">
				<span class="w3-bar-item w3-button w3-hover-aqua pbtn">next</span>
	</c:if>
			</div>
	</div>
	</div>
	

  <!---------------캘린더---------------->	
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
	<DIV id="content" style="width:712px;">
	<table width="100%" border="0" cellspacing="1" cellpadding="1">
		<tr>
			<td align ="right">
			<input type="button" onclick="javascript:location.href='<c:url value='/CalendarExam2.jsp' />'" value="오늘"/>
			</td>
		</tr>
	</table>

<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
<tr>
	<td height="60">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td align="center" >
					<a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
						<b>&lt;&lt;</b><!-- 이전해 -->
					</a>

                    <%if(month > 0 ){ %>

                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">

                           <b>&lt;</b><!-- 이전달 -->

                    </a>

                    <%} else {%>

                           <b>&lt;</b>

                    <%} %>

                    &nbsp;&nbsp;

                    <%=year%>년

                   

                    <%=month+1%>월

                    &nbsp;&nbsp;

                    <%if(month < 11 ){ %>

                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">

                           <!-- 다음달 --><b>&gt;</b>

                    </a>

                    <%}else{%>

                           <b>&gt;</b>

                    <%} %>

                    <a href="<c:url value='/CalendarExam2.jsp' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">

                           <!-- 다음해 --><b>&gt;&gt;</b>

                    </a>

             </td>

       </tr>

       </table>

 

</td>

</tr>

</table>

<br>

<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">

<THEAD>

<TR bgcolor="#CECECE">

       <TD width='100px'>

       <DIV align="center"><font color="red">일</font></DIV>

       </TD>

       <TD width='100px'>

       <DIV align="center">월</DIV>

       </TD>

       <TD width='100px'>

       <DIV align="center">화</DIV>

       </TD>

       <TD width='100px'>

       <DIV align="center">수</DIV>

       </TD>

       <TD width='100px'>

       <DIV align="center">목</DIV>

       </TD>

       <TD width='100px'>

       <DIV align="center">금</DIV>

       </TD>

       <TD width='100px'>

       <DIV align="center"><font color="#529dbc">토</font></DIV>

       </TD>

</TR>

</THEAD>

<TBODY>

<TR>

<%

 

//처음 빈공란 표시

for(int index = 1; index < start ; index++ )

{

  out.println("<TD >&nbsp;</TD>");

  newLine++;

}

 

for(int index = 1; index <= endDay; index++)

{

       String color = "";

 

       if(newLine == 0){          color = "RED";

       }else if(newLine == 6){    color = "#529dbc";

       }else{                     color = "BLACK"; };

 

       String sUseDate = Integer.toString(year); 

       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);

       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

 

       int iUseDate = Integer.parseInt(sUseDate);

      

      

       String backColor = "#EFEFEF";

       if(iUseDate == intToday ) {

             backColor = "#c9c9c9";

       }

       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");

       %>

       <font color='<%=color%>'>

             <%=index %>

       </font>

 

       <%

      

       out.println("<BR>");

       out.println(iUseDate);

       out.println("<BR>");

      

      

       //기능 제거 

       out.println("</TD>");

       newLine++;

 

       if(newLine == 7)

       {

         out.println("</TR>");

         if(index <= endDay)

         {

           out.println("<TR>");

         }

         newLine=0;

       }

}

//마지막 공란 LOOP

while(newLine > 0 && newLine < 7)

{

  out.println("<TD>&nbsp;</TD>");

  newLine++;

}

%>

</TR>

 

</TBODY>

</TABLE>

</DIV>

</form>
</body>
</html>