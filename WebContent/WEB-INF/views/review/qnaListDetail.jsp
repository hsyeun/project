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
	$('#qna').click(function(){
		$('#nowPage').val('${PAGE}');
		$('#frm').submit();
	});
});
</script>

<body>

<form method="GET" action="/moa/review/qnaList.moa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="bno" id="bno">
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
					<h1>My Page</h1>
					<ol class="breadcrumb mb-4">
					</ol>
					<!-- Content Row-->
					<div class="row">
						<!-- Sidebar Column-->
						<jsp:include page="../a_nav/member/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
						<div class="col-lg-8 mb-4">

							<table class="table">
								<thead>
									<tr>
										<th scope="col">글번호(${DATA.bno})</th>
										<th scope="col" colspan=2>제목 : ${DATA.title}</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody class="w3-margin-top">
									<tr>
										<th scope="row">${SID}님의 문의글</th>
										<td colspan=2>${DATA.body}</td>
										<td>${DATA.sdate}</td>
									</tr>
									<tr>
										<th scope="row">관리자 답변</th>
										<td colspan=2>${DATA1.body}</td>
										<td>${DATA1.sdate}</td>
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