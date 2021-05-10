<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MOA project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content="">
	<meta property="og:image" content="">
	<meta property="og:url" content="">
	<meta property="og:site_name" content="">
	<meta property="og:description" content="">
	<meta name="twitter:title" content="">
	<meta name="twitter:image" content="">
	<meta name="twitter:url" content="">
	<meta name="twitter:card" content="">

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">
	
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
	
	<head><style>.dismissButton{background-color:#fff;border:1px solid #dadce0;color:#1a73e8;border-radius:4px;font-family:Roboto,sans-serif;font-size:14px;height:36px;cursor:pointer;padding:0 24px}.dismissButton:hover{background-color:rgba(66,133,244,0.04);border:1px solid #d2e3fc}.dismissButton:focus{background-color:rgba(66,133,244,0.12);border:1px solid #d2e3fc;outline:0}.dismissButton:hover:focus{background-color:rgba(66,133,244,0.16);border:1px solid #d2e2fd}.dismissButton:active{background-color:rgba(66,133,244,0.16);border:1px solid #d2e2fd;box-shadow:0 1px 2px 0 rgba(60,64,67,0.3),0 1px 3px 1px rgba(60,64,67,0.15)}.dismissButton:disabled{background-color:#fff;border:1px solid #f1f3f4;color:#3c4043}
</style><style>.gm-style .gm-style-mtc label,.gm-style .gm-style-mtc div{font-weight:400}.gm-style .gm-style-mtc ul,.gm-style .gm-style-mtc li{box-sizing:border-box}
</style><style>.gm-control-active>img{box-sizing:content-box;display:none;left:50%;pointer-events:none;position:absolute;top:50%;transform:translate(-50%,-50%)}.gm-control-active>img:nth-child(1){display:block}.gm-control-active:hover>img:nth-child(1),.gm-control-active:active>img:nth-child(1){display:none}.gm-control-active:hover>img:nth-child(2),.gm-control-active:active>img:nth-child(3){display:block}
</style><link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Google+Sans:400,500,700|Google+Sans+Text:400"><style>.gm-ui-hover-effect{opacity:.6}.gm-ui-hover-effect:hover{opacity:1}
</style><style>.gm-style .gm-style-cc a,.gm-style .gm-style-cc button,.gm-style .gm-style-cc span,.gm-style .gm-style-mtc div{font-size:10px;box-sizing:border-box}
</style><style>@media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}</style><style>.gm-style-pbc{transition:opacity ease-in-out;background-color:rgba(0,0,0,0.45);text-align:center}.gm-style-pbt{font-size:22px;color:white;font-family:Roboto,Arial,sans-serif;position:relative;margin:0;top:50%;-webkit-transform:translateY(-50%);-ms-transform:translateY(-50%);transform:translateY(-50%)}
</style><style>.gm-style img{max-width: none;}.gm-style {font: 400 11px Roboto, Arial, sans-serif; text-decoration: none;}</style>
    <title>Square - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">

    <link rel="stylesheet" href="/moa/css/woo/css1/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/moa/css/woo/css1/nimate.css">
    
    <link rel="stylesheet" href="/moa/css/woo/css1/owl.carousel.min.css">
    <link rel="stylesheet" href="/moa/css/woo/css1/owl.theme.default.min.css">
    <link rel="stylesheet" href="/moa/css/woo/css1/magnific-popup.css">

    <link rel="stylesheet" href="/moa/css/woo/css1/aos.css">

    <link rel="stylesheet" href="/moa/css/woo/css1/ionicons.min.css">
    
    <link rel="stylesheet" href="/moa/css/woo/css1/flaticon.css">
    <link rel="stylesheet" href="/moa/css/woo/css1/icomoon.css">
    <link rel="stylesheet" href="/moa/css/woo/css1/tyle.css">
  <style type="text/css">.scrollax-performance, .scrollax-performance *, .scrollax-performance *:before, .scrollax-performance *:after { pointer-events: none !important; -webkit-animation-play-state: paused !important; animation-play-state: paused !important; };</style><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/common.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/util.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/map.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/stats.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/onion.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/controls.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/44/13/intl/ko_ALL/marker.js"></script></head>
	
	<script src="/moa/css/woo/js1/jquery.min.js"></script>
	<script src="/moa/css/woo/js1/jquery-migrate-3.0.1.min.js"></script>
	<script src="/moa/css/woo/js1/popper.min.js"></script>
	<script src="/moa/css/woo/js1/bootstrap.min.js"></script>
	<script src="/moa/css/woo/js1/jquery.easing.1.3.js"></script>
	<script src="/moa/css/woo/js1/jquery.waypoints.min.js"></script>
	<script src="/moa/css/woo/js1/jquery.stellar.min.js"></script>
	<script src="/moa/css/woo/js1/owl.carousel.min.js"></script>
	<script src="/moa/css/woo/js1/jquery.magnific-popup.min.js"></script>
	<script src="/moa/css/woo/js1/jquery.animateNumber.min.js"></script>
	<script src="/moa/css/woo/js1/aos.js"></script>
	<script src="/moa/css/woo/js1/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&amp;sensor=false"></script>
	<script src="/moa/css/woo/js1/google-map.js"></script>
	<script src="/moa/css/woo/js1/main.js"></script>
	<!-- MAIN JS -->
	<script src="/moa/js/woo/js/main.js"></script>
	<style>
		.woo { display:none; }
	</style>
	<script>
		 $(document).ready(function(){
			$('.check').click(function(){
				$('myMain').css('display','none');
				$('').css('display','block');
			});
		}); 
	</script>
</head>
<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="true" aria-controls="navbar"><i></i></a>
		<div id="colorlib-aside" class="w3-col border js-fullheight">
			<div class="text-center">
				<h1 id="colorlib-logo"><a href="index.html">마이페이지</a></h1>
				<span class="position">마이 페이지 홈 ></span>
			</div>
			<nav id="colorlib-main-menu" role="navigation" class="navbar">
				<div id="navbar" class="collapse in" aria-expanded="true" style="">
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
			</nav>
		</div>
	</div>
		<h2  class="w3-margin-bottom" style="margin-left:320px; ">리뷰작성</h2>
		<div class="row d-flex" style="margin-left:310px;">
		
          <div class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
          	<div class="blog-entry justify-content-end">
              <img src="/moa/img/mypage/image_1.jpg" width="350">
              <div class="text mt-3 float-right d-block">
              	<div class="d-flex align-items-center pt-2 mb-4 topp">
              		<div class="one mr-3">
              			<span class="day">12</span>
              		</div>
              		<div class="two">
              			<span class="yr">2019</span>
              			<span class="mos">March</span>
              		</div>
              	</div>
                <h4 class="heading">Why Lead Generation is Key for Business Growth</a></h4>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <div class="d-flex align-items-center mt-4 meta">
	              <p class="mb-0"><a class="btn btn-secondary">리뷰작성 <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
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
              			<span class="yr">2019</span>
              			<span class="mos">March</span>
              		</div>
              	</div>
                <h4 class="heading">Why Lead Generation is Key for Business Growth</h4>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-secondary">리뷰작성 <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
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
              			<span class="yr">2019</span>
              			<span class="mos">March</span>
              		</div>
              	</div>
                <h4 class="heading">Why Lead Generation is Key for Business Growth</h4>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-secondary">리뷰작성 <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
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
              			<span class="yr">2019</span>
              			<span class="mos">March</span>
              		</div>
              	</div>
                <h4 class="heading">Why Lead Generation is Key for Business Growth</h4>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-secondary">리뷰작성 <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
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
              			<span class="yr">2019</span>
              			<span class="mos">March</span>
              		</div>
              	</div>
                <h4 class="heading">Why Lead Generation is Key for Business Growth</h4>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-secondary">리뷰작성 <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
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
              			<span class="yr">2019</span>
              			<span class="mos">March</span>
              		</div>
              	</div>
                <h4 class="heading">Why Lead Generation is Key for Business Growth</h4>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                <div class="d-flex align-items-center mt-4 meta">
	                <p class="mb-0"><a href="#" class="btn btn-secondary">리뷰작성 <span class="ion-ios-arrow-round-forward"></span></a></p>
	                <p class="ml-auto mb-0">
	                </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        </body>
</html>