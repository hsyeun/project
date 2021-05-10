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

});
</script>

<body>
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
    <tr>
      <th scope="row">1000</th>
      <td>핸드폰 번호가 변경되었는데...</td>
      <td>대기중 답변완료</td>
      <td>2021-05-15</td>
    </tr>
  </tbody>
</table>
				
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