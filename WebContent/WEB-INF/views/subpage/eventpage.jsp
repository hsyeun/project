<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<style type="text/css">
.hr2{
	border: 0;
}
.won{
	text-decoration: line-through;
}
</style>
   <jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
</head>   
<script type="text/javascript">
	$(document).ready(function(){
		$('img').mouseover(function(){
			$(this).css('cursor','pointer')
		});
		$('img').mouseout(function(){
			$(this).css('cursor','none')
		});
		$('.title').mouseover(function(){
			$(this).css('cursor','pointer')
			$(this).css('text-decoration','underline')
		});
		$('.title').mouseout(function(){
			$(this).css('cursor','none')
			$(this).css('text-decoration','none')
		});
		
		
		
		$(document).ready(function() {
			if(${PAGE.startPage} == 1){
				$('#pre').removeClass('page-item');
			}
			if(${PAGE.endPage} == ${PAGE.totalPage}){
				$('#nex').removeClass('page-item');
			}	
			if($('#pnum${PAGE.nowPage}>a').html()== ${PAGE.nowPage}){
				$('#pnum${PAGE.nowPage}>a').addClass('w3-blue');
			}
			
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
				}
				$('#frm').attr('action', '/moa/review/qnaList.moa');
				$('#frm').submit();
			});
			
			$('.trow').click(function(){		
				$('#nowPage').val(${PAGE.nowPage});
				
				var bno = $(this).attr('id');
				bno = bno.substring(1);
				$('#bno').val(bno);
				$('#frm').submit();
			});
	});
</script>
<body>
<form method="POST" action="/moa/review/qnaListDetail.moa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="bno" id="bno">
</form>
<!-- Navigator -->
   <jsp:include page="../a_nav/nav.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
   
   

	<div class="w3-content mxw900 ">
      <hr class="w3-darkgrey ">
      <div class="w3-content mxw900 ">
         <div class="w3-content m3 w3-margin-top w3-margin-bottom inblock">
            <h1 class="w3-col w3-margin-top w3-margin-left mgb60 inblock w3-left ">이벤트</h1>
         </div>
         <hr class="hr2 w3-margin-top">
      </div>
      <div class="w3-content w3-margin w3-center">
    
      <div class="w3-content inblock  w3-round w3-margin-top  w3-padding w3-text-left">
		 <div class="w3-margin-right">
		  <img src="../img/exh_img_title/yeon.jpg" class="img-rounded w3-round" alt="Cinque Terre" width="200" height="236"> 
		  <h5 class="w3-margin-top w3-margin-left w3-text-grey title">부드러운 미래</h5>
		  <p class=" w3-margin-top w3-margin-left">수연 개인전</p>            
		  <p class=" w3-margin-left inblock won"> 20000</p>            
		  <p class=" w3-margin-left inblock">10000</p>            
		  <p class=" w3-margin-left w3-text-grey">2021.05.05 ~ 2021.07.15</p>            
		</div>
      </div>
      <div class="w3-content inblock  w3-round w3-margin-top  w3-padding w3-text-left">
		 <div class="w3-margin-left ">
		  <img src="../img/exh_img_title/delight.jpg" class="img-rounded w3-round" alt="Cinque Terre" width="200" height="236"> 
		  <h5 class="w3-margin-top w3-margin-left w3-text-grey title">서울 딜라이트 2021</h5>
		  <p class="w3-margin-top w3-margin-left">서울</p>            
		  <p class="w3-margin-top w3-margin-left">25000  1+1 </p>            
		  <p class="w3-margin-left w3-text-grey">2021.05.10 ~ 2021.07.30 </p>            
		</div>
      </div>
      <div class="w3-content inblock  w3-round w3-margin-top  w3-padding w3-text-left">
		 <div class="pdl0 w3-padding-left">
		  <img src="../img/exh_img_title/trip.jpg" class="img-rounded w3-round" alt="Cinque Terre" width="200" height="236"> 
		  <h5 class="w3-margin-top w3-margin-left w3-text-grey title">이토록 아름다운( The Nature Art )</h5>
		  <p class="w3-margin-top w3-margin-left">요시히로, 에이스트릭스</p>            
		  <p class=" w3-margin-left inblock won">20000 </p>            
		  <p class="w3-margin-left inblock">10000</p>            
		  <p class="w3-margin-left w3-text-grey">2021.05.15 ~ 2021.08.15</p>            
		</div>
      
      </div>
     	<ul class="pagination justify-content-center">
								<li class="page-item" id="pre"><a class="page-link"
									href="#" aria-label="Previous"> <span aria-hidden="true">«</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<c:forEach var="page" begin="${PAGE.startPage}"
									end="${PAGE.endPage}">
									<li class="page-item" id="pnum${page}"><a
										class="page-link" href="#">${page}</a></li>
								</c:forEach>
								<li class="page-item" id="nex"><a class="page-link"
									href="#" aria-label="Next"> <span aria-hidden="true">»</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
     	
     </div>
      <hr class="hr2 w3-margin-top w3-margin-bottom">
      <hr class="w3-darkgrey w3-margin-top w3-margin-bottom">
	</div>
   
  <!-- Footer-->
   <footer class="py-5 bg-dark">
       <jsp:include page="../a_nav/footer.jsp">
         <jsp:param name="" value="" />
      </jsp:include>
   </footer>  
</body>
</html>