<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

</head>
<body>

<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

<!-- 메뉴별 페이지 -->
<section class="py-5 bg-light inGnbPage">
    <div class="container menu-h">
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
        
        <div class="user-paging">
		  <ul class="pagination user-paging-btn"">
		    <li class="page-item disabled">
		      <a class="page-link" href="#">&laquo;</a>
		    </li>
		    <li class="page-item active">
		      <a class="page-link" href="#">1</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#">2</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#">3</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#">4</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#">5</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#">&raquo;</a>
		    </li>
		  </ul>
		</div>
    </div>
</section>
<hr class="my-0">

<!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>