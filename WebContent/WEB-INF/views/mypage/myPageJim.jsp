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

		<h2 class="w3-margin-bottom" style="margin-left: 310px;">찜목록</h2>
		<div class="row d-flex" style="margin-left: 310px;">

			<div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
				<div class="blog-entry justify-content-end">
					<img src="/moa/img/mypage/image_1.jpg" width="350">
					<div class="text mt-3 float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-3">
								<span class="day">12</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">March</span>
							</div>
						</div>
						<h4 class="heading">Why Lead Generation is Key for Business
							Growth</h4>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a class="btn btn-secondary">찜취소 <span
									class="ion-ios-arrow-round-forward"></span></a>
							</p>
							<p class="ml-auto mb-0"></p>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
				<div class="blog-entry justify-content-end">
					<img src="/moa/img/mypage/image_4.jpg" width="350">
					<div class="text mt-3 float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-3">
								<span class="day">10</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">March</span>
							</div>
						</div>
						<h4 class="heading">Why Lead Generation is Key for Business
							Growth</h4>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="#" class="btn btn-secondary">찜취소 <span
									class="ion-ios-arrow-round-forward"></span></a>
							</p>
							<p class="ml-auto mb-0"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
				<div class="blog-entry">
					<img src="/moa/img/mypage/img-6.jpg" width="350">
					<div class="text mt-3 float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-3">
								<span class="day">05</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">March</span>
							</div>
						</div>
						<h4 class="heading">Why Lead Generation is Key for Business
							Growth</h4>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="#" class="btn btn-secondary">찜취소 <span
									class="ion-ios-arrow-round-forward"></span></a>
							</p>
							<p class="ml-auto mb-0"></p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
				<div class="blog-entry justify-content-end">
					<img src="/moa/img/mypage/img-6.jpg" width="350">
					<div class="text mt-3 float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-3">
								<span class="day">12</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">March</span>
							</div>
						</div>
						<h4 class="heading">Why Lead Generation is Key for Business
							Growth</h4>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="#" class="btn btn-secondary">찜취소 <span
									class="ion-ios-arrow-round-forward"></span></a>
							</p>
							<p class="ml-auto mb-0"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
				<div class="blog-entry justify-content-end">
					<img src="/moa/img/mypage/image_5.jpg" width="350">
					<div class="text mt-3 float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-3">
								<span class="day">10</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">March</span>
							</div>
						</div>
						<h4 class="heading">Why Lead Generation is Key for Business
							Growth</h4>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="#" class="btn btn-secondary">찜취소 <span
									class="ion-ios-arrow-round-forward"></span></a>
							</p>
							<p class="ml-auto mb-0"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
				<div class="blog-entry">
					<img src="/moa/img/mypage/image_6.jpg" width="350">
					<div class="text mt-3 float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-3">
								<span class="day">05</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">March</span>
							</div>
						</div>
						<h4 class="heading">Why Lead Generation is Key for Business
							Growth</h4>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="#" class="btn btn-secondary">찜취소 <span
									class="ion-ios-arrow-round-forward"></span></a>
							</p>
							<p class="ml-auto mb-0"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	<footer class="py-5 bg-dark " style="margin-bottom: 0%;">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>
	</div>
</body>
</html>