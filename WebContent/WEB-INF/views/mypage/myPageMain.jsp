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


		<div id="colorlib-main" class="myMain">
			<div class="gallary-header text-center">

				회원님의 잔여 포인트 : <input type="text" name="point" id="point"
					class=" w3-input w3-border w3-border-grey w3-margin-top "
					placeholder="10,000 P"
					style="text-align: right; width: 200px; margin-left: 600px;">
			</div>

		</div>
		<div class="packages-content">

			<div class="w3-margin-left col-md-4 col-sm-6 w3-margin-top">
				<div class="single-package-item">
					<h3>
						최근 본 전시 <span class="pull-right "></span>
					</h3>
					<div class="packages-para">
						<img src="/moa/img/mypage/cover_bg_1.jpg" width="150"> <img
							src="/moa/img/mypage//blog-4.jpg" width="150">
					</div>
					<!--/.single-package-item-txt-->

				</div>

				<h3>
					최근 본 이벤트 <span class="pull-right w3-margin-top"></span>
				</h3>
				<img src="/moa/img/mypage//blog-3.jpg" width="150"> <img
					src="/moa/img/mypage//blog-2.jpg" width="150">
			</div>
			<!--/.single-package-item-txt-->

			<div class="w3-margin-left col-md-4 col-sm-6 w3-margin-top">
				<h3>
					찜 목록 <span class="pull-right"></span>
				</h3>
				<img src="/moa/img/mypage//blog-1.jpg" width="150"> <img
					src="/moa/img/mypage//img_bg_2.jpg" width="150">

				<div class="about-btn">
					<button
						class="w3-color-black w3-margin-top w3-margin-bottom  about-view packages-btn">
						더보기</button>
				</div>
				<!--/.about-btn-->
			</div>
			<!--/.single-package-item-txt-->
		</div>
	</div>

	<footer class="py-5 bg-dark " style="margin-bottom: 0%;">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>

</body>
</html>