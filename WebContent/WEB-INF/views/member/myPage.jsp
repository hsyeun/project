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
                    
                        <jsp:include page="../a_nav/member/SideBar.jsp">
								<jsp:param name="" value=""/>
							</jsp:include>
                   
					</div>
                    <!-- Content Column-->
                    <div class="col-lg-9 mb-4">
                        <h2>Section Heading</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.</p>
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