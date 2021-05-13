<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$('#nowPage').val('${PAGE.nowPage}');
		
		if('${PAGE.startPage}' == 1){
			$('').removeClass('page-item');	
		}
		if('${PAGE.endPage}' == '${PAGE.totalPage}'){
			$('').removeClass('page-item');	
		}
		if($('#pnum${PAGE.nowPage}>a').html()== '${PAGE.nowPage}'){
			$('#pnum${PAGE.nowPage}>a').addClass('w3-blue');
		}
		
		$('li').click(function(){
			var spage = $(this).html();
			
			switch(spage){
			case '&laquo;':
				$('#nowPage').val('${PAGE.startPage - 1}');
				break;
			case '&raquo;':
				$('#nowPage').val('${PAGE.endPage + 1}');
				break;
			default:
				$('#nowPage').val(spage);
			}
			$('#frm').attr('action', '/moa/menupage/menu1.moa');
			$('#frm').submit();
		});
	});
</script>
<body>

<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

<!-- 메뉴별 페이지 -->

<form method="POST" action="/moa/menupage/menu1.moa" id="frm" name="frm">
	<input type="hidden" name="nowPage" id="nowPage">
</form>


<section class="py-5 bg-light inGnbPage">
    <div class="container menu-h">
        <h2 class="mb-4">일반 전시</h2>
        <div class="row">
                
<c:forEach var="data" items="${LIST}">
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="${data.idir}${data.imgname}" alt="poster"></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">${data.exiname}</a></h4>
                        <p class="card-text">작가: ${data.exiperson}</p>
                        <p class="card-text">시작날짜: ${data.startdate}</p>
                        <p class="card-text">종료날짜: ${data.enddate}</p>
                    </div>
                </div>
            </div>
</c:forEach>

        </div>
        
        <!-- 페이징 처리 -->
        <div class="user-paging">
		  <ul class="pagination user-paging-btn">
		  
		    <li class="page-item disabled"  id="pre">
		      <a class="page-link pageLink">&laquo;</a>
		    </li>
		    <li class="page-item disabled">
		      <a class="page-link pageLink">&laquo;</a>
		    </li>

<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
		  <c:if test="${PAGE.nowPage == page}">
		    <li class="page-item active">
		      <a class="page-link pageLink">${page}</a>
		    </li>
		  </c:if>
		  <c:if test="${PAGE.nowPage != page}">
		    <li class="page-item">
		      <a class="page-link pageLink">${page}</a>
		    </li>
		  </c:if>
</c:forEach>
		  
		  <c:if test="${PAGE.endPage == PAGE.totalPage}">
		    <li class="page-item">
		      <a class="page-link pageLink">&raquo;</a>
		    </li>
		  </c:if>
		  <c:if test="${PAGE.endPage != PAGE.totalPage}">
		    <li class="page-item">
		      <a class="page-link pageLink">&raquo;</a>
		    </li>
		  </c:if>
		  
		  </ul>
		</div>
    </div>
</section>
<hr class="my-0">

<!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>