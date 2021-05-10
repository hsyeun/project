<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- Animate.css -->
<link rel="stylesheet" href="/moa/css/woo/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="/moa/css/woo/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="/moa/css/woo/css/bootstrap.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="/moa/css/woo/css/flexslider.css">
<!-- Flaticons  -->
<!-- <link rel="stylesheet" href="/moa/css/woo/css/font/flaticon.css"> -->
<!-- Owl Carousel -->
<link rel="stylesheet" href="/moa/css/woo/css/owl.carousel.min.css">
<link rel="stylesheet" href="/moa/css/woo/css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/moa/css/woo/css/style.css">
<link rel="stylesheet" type="text/css" href="/moa/css/woo/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/woo/css/user.css">
<script src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/woo/js/w3color.js"></script>
<!-- Modernizr JS -->
<script src="/moa/js/woo/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<!-- jQuery -->
<script src="/moa/js/woo/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/moa/js/woo/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/moa/js/woo/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/moa/js/woo/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/moa/js/woo/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="/moa/js/woo/js/owl.carousel.min.js"></script>
<!-- Counters -->
<script src="/moa/js/woo/js/jquery.countTo.js"></script>


<!-- MAIN JS -->
<script src="/moa/js/woo/js/main.js"></script>
<head>
<jsp:include page="../a_nav/head.jsp">
	<jsp:param name="" value="" />
</jsp:include>
</head>

<body>

	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>


	<div id="wrap">
		<div id="colorlib-page">
			<div class="col">
				<div id="colorlib-aside" class="border js-fullheight">
					<div class="text-center">
						<h1 id="colorlib-logo">
							<a href="index.html">마이페이지</a>
						</h1>
					</div>
					<div class="col">
						<ul>
							<li><a href="#" id="check" class="check">구매확인/취소</a></li>
							<li><a href="#" data-nav-section="wish">찜 목록</a></li>
							<li><a href="#" data-nav-section="myre">나의 리뷰</a></li>
							<li><a href="#" data-nav-section="review">리뷰 작성</a></li>
							<li><a href="#" data-nav-section="myone">나의 1:1 문의</a></li>
							<li><a href="#" data-nav-section="change">회원정보 수정</a></li>
							<li><a href="#" data-nav-section="out">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 게시판 목록 영역 -->

		<h3 style="margin-left: 320px; padding-top: 20px;">나의 리뷰</h3>
		<div style="margin-left: 320px; margin-bottom: 0x;">
			<table border="1" summary="게시판 목록">


				<table class="table table-hover w3-center">
					<thead class="w3-text-center">
						<tr>
							<th class="w3-center">글번호</th>
							<th class="w3-center" style="padding-left: 10px;">전 시 명</th>
							<th class="w3-center">제  목</th>
							<th class="w3-center">별  점</th>
							<th class="w3-center">작성날짜</th>
						</tr>
					</thead>
					<tbody>


						<tr>

							<td align="center">100001</td>

							<td align="center">공명 : 자연이 주는 울림</td>

							<td align="center">느꼄본걸 적어 본다</td>

							<td align="center">★ ★ ★ ★ ★</td>
							
							<td align="center">2021.05.05</td>


						</tr>

						<tr>

							<td align="center">100002</td>

							<td align="center">볼로냐 일러스트 원화전</td>

							<td align="center">재밌는 이야기</td>

							<td align="center">★ ★ ★ ☆ ☆</td>
							
							<td align="center">2021.05.10</td>


						</tr>

						<tr>

							<td align="center">100003</td>

							<td align="center">초대의 감각</td>

							<td align="center">감가이란</td>

							<td align="center">★ ★ ★ ★ ☆</td>
							
							<td align="center">2021.04. 18</td>


						</tr>

					</tbody>
				</table>
				<tfoot>
				</tfoot>

			</table>
		</div>
	</div>
	<footer class="py-5 bg-dark " style="margin-bottom: 0%;">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>
</body>
</html>

