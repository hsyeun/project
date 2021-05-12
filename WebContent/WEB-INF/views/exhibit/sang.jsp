<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>
<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	
         <!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1 class="mt-4 mb-3">
                    Post Title
                    <small>
	                    <span class="jhs">
	                        <h5>
	                        	조회수 : 1056
	                        </h5>
	                    </span>
                    </small>
                </h1>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Blog Home 2</li>
                </ol>
                <div class="row">
                    <!-- Post Content Column-->
                    <div class="col-lg-8">
                        <!-- Preview Image-->
                        <div>
	                        <div class="lft">
	                        	<img class="img-fluid rounded" src="https://via.placeholder.com/900x300" alt="..." />
	                        </div>
	                        <div class="rgt">
	                        	<h1>
	                        		전시 제목
	                        	</h1>
	                        	<h5>
	                        		기간: 2020.08.05 ~ 2021.06.30
	                        	</h5>
	                        	<h5>
									시간: 10:00 ~ 18:00
	                        	</h5>
	                        	<h5>
									장소: 인크레파스
	                        	</h5>
	                        </div>
                        </div>
	                </div>
	             </div>
	                    <hr />
                        <!-- button -->
                        <div class="btn">
                        	<button type="button" class="btn btn-secondary" onclick="location.href='sang.html' ">상세 내용</button>
                        	<button type="button" class="btn btn-secondary" onclick="location.href='jun.html' ">전시 위치</button>
                        	<button type="button" class="btn btn-secondary" onclick="location.href='kwan.html' ">관람자 리뷰</button>
						</div>
                        <hr />
                        <!-- Post Content-->
                        <h2>상세 내용</h2>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?</p>
                        
                        <blockquote class="blockquote">
                            <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                            <footer class="blockquote-footer">
                                Someone famous in
                                <cite title="Source Title">Source Title</cite>
                            </footer>
                        </blockquote>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem obcaecati?</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione tempore quidem voluptates cupiditate voluptas illo saepe quaerat numquam recusandae? Qui, necessitatibus, est!</p>
                        <hr />
                    <!-- Search Widget-->
                        <div class="card mb-4">
                            <h5 class="card-header">Search</h5>
                            <div class="card-body">
                                <div class="input-group">
                                    <input class="form-control" type="text" placeholder="Search for..." />
                                    <span class="input-group-append"><button class="btn btn-secondary" type="button">Go!</button></span>
                                </div>
                            </div>
                        </div>
                        </div>
                        </section>

<!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>