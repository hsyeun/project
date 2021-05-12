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
                        <!-- Comments Form-->
                        <div class="card my-4">
                            <h5 class="card-header">Leave a review:</h5>
                            <div class="card-body">
                                <form>
                                    <div class="form-group"><textarea class="form-control" rows="3"></textarea></div>
                                    <button class="btn btn-primary" type="submit">Submit</button>
                                </form>
                            </div>
                        </div>
                        <!-- Single Comment-->
                        <div class="media mb-4">
                            <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                            <div class="media-body">
                                <h5 class="mt-0">Commenter Name</h5>
                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                            </div>
                        </div>
                        <!-- Comment with nested comments-->
                        <div class="media mb-4">
                            <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                            <div class="media-body">
                                <h5 class="mt-0">Commenter Name</h5>
                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                       	    </div>
                   	 	</div>
                        <div class="media mb-4">
                            <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                            <div class="media-body">
                                <h5 class="mt-0">Commenter Name</h5>
                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                       	    </div>
                   	 	</div>
                        <div class="media mb-4">
                            <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                            <div class="media-body">
                                <h5 class="mt-0">Commenter Name</h5>
                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                       	    </div>
                   	 	</div>
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