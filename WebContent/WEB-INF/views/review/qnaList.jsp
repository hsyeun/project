<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>

<script>
$(document).ready(function() {
	if(${PAGE.startPage} == 1){
		$('#pre').removeClass('page-item');
	};
	if(${PAGE.endPage} == ${PAGE.totalPage}){
		$('#nex').removeClass('page-item');
	};	
	if($('#pnum${PAGE.nowPage}>a').html()== ${PAGE.nowPage}){
		$('#pnum${PAGE.nowPage}>a').addClass('w3-blue');
	};
	
	$('.page-item').click(function(){
		var sid = $(this).attr('id');
		
		switch(sid){
		case 'pre':
				$('#nowPage').val('${PAGE.startPage - 1}');
			break;
		case 'nex':
				$('#nowPage').val('${PAGE.endPage + 1}');
			break;
		default:
			tmp=$(this).children().html();
				$('#nowPage').val(tmp);
				break;
		};
		$('#frm').attr('action', '/moa/review/qnaList.moa');
		$('#frm').submit();
	});
	
	$('.trow').click(function(){
		
	});
	
});
</script>


<body>

<form method="POST" action="/cafe/reBoard/reBoardReply.cafe" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="rno" id="rno">
		<input type="hidden" name="upno" id="upno">
		<input type="hidden" name="title" id="title">
</form>


<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="마이페이지"/>
	</jsp:include>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">

			<div class="row">
				<div class="col-lg-12 mb-4">	
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                   My Page
                </h1>
                <ol class="breadcrumb mb-4">
                   
                </ol>
                <!-- Content Row-->
                <div class="row">
                    <!-- Sidebar Column-->
                    <div class="col-lg-3 mb-4">
                        <div class="list-group">
                            <a class="list-group-item" href="index.html">메인</a>
                            <a class="list-group-item" href="about.html">구매확인/취소</a>
                            <a class="list-group-item" href="services.html">찜목록</a>
                            <a class="list-group-item" href="contact.html">나의리뷰</a>
                            <a class="list-group-item" href="portfolio-1-col.html">리뷰작성</a>
                            <a class="list-group-item" href="portfolio-2-col.html">나의 1:1문의</a>
                            <a class="list-group-item" href="/moa/member/myInfo.moa">나의정보</a>
                            <a class="list-group-item" href="/moa/member/myInfoEdit.moa">회원정보 수정</a>
                            <a class="list-group-item" href="/moa/member/myInfoDel.moa">회원탈퇴</a>   
                        </div>
                    </div>
                    <!-- Content Column-->
                    	<div class="col-lg-8 mb-4">
					
					<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">글번호</th>
      <th scope="col">제목</th>
      <th scope="col">상태</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  <tbody>
 <c:forEach var="data" items="${LIST}" varStatus="idx">
 
    <tr class="trow" id="b${data.bno}">
      	  <th scope="row">${data.bno}</th>
	      <td>${data.title}</td>
	      <td>${data.reply.equals('Y') ? '답변완료' : '미답변'}</td>
	      <td>${data.sdate}</td>   
    </tr>

</c:forEach> 
<%-- 관리자 답변 토글
 <c:if test="${data.upno !=''}">
    <tr class="trow w3-hide w3-border-blue" id="u${data.upno}">
      <td colspan="4">${data.body}</td>
      <td>${data.sdate}</td>
    </tr>
 </c:if>
--%>

   
  </tbody>
</table>
				<ul class="pagination justify-content-center">
                    <li class="page-item" id="pre">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
                    <li class="page-item" id="pnum${page}"><a class="page-link"  href="#">${page}</a></li>  
</c:forEach>                                     
                    <li class="page-item" id="nex">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">»</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
				</div>

                </div>
            </div>	
		</div>
				
			
			</div>
	</section>

<!-- Footer-->
<footer class="py-5 bg-dark">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>