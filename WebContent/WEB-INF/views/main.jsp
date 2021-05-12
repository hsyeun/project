<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
	<jsp:include page="a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	
<style type="text/css">
	.inGnbPage{
		display: none;
	}
</style>

</head>
<body>

<!-- Navigator -->
	<jsp:include page="a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

<!-- 이미지 슬라이드 -->
<header>
    <div class="carousel slide" id="carouselExampleIndicators" data-ride="carousel">
        <ol class="carousel-indicators">
            <li class="" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2" class="active"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item">
                <img class="d-block w-100" src="/moa/img/main/slide01.jpg" alt="...">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="/moa/img/main/slide02.jpg" alt="...">
            </div>
            <div class="carousel-item active">
                <img class="d-block w-100" src="/moa/img/main/slide03.jpg" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</header>

<!-- 전시 목록 -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="mb-4">최근 전시회</h2>
        <div class="row">
            
<!-- 최근전시정보리스트 -->
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
    </div>
</section>

<!-- 메뉴별 페이지 -->
<section class="py-5 bg-light inGnbPage">
    <div class="container">
        <h2 class="mb-4">미술전</h2>
        <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..."></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project One</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..."></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Two</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..."></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Three</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..."></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Four</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..."></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Five</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..."></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Six</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<hr class="my-0">

<!-- Features Section-->
<section class="py-5 user-source">
   
      	<!-- 그래프 -->
        <jsp:include page="a_nav/chart.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		
		<!-- 달력 -->
		<jsp:include page="a_nav/calendar.jsp">
			<jsp:param name="" value="" />
		</jsp:include>

</section>
<hr class="my-0">

<!-- Page Content-->

<section class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <div class="card h-100">
                    <h4 class="card-header">공지사항</h4>
                    <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                    <div class="card-footer"><a class="btn btn-primary" href="#!">더보기</a></div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card h-100">
                    <h4 class="card-header">이벤트</h4>
                    <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                    <div class="card-footer"><a class="btn btn-primary" href="#!">더보기</a></div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>