<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>

<script>
	$(document).ready(function() {
	
	$('#ebtn').click(function(){
		$(location).attr('href', '/moa/member/myInfoEdit.moa')
	});
	$('#mbtn').click(function(){
		$(location).attr('href', '/moa/member/myInfo.moa')
	});
	$('#dbtn').click(function(){
		$(location).attr('href', '/moa/member/myInfoDel.moa')
	});
	
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
				<div class="col-lg-8 mb-4">
					<h3>마이페이지</h3>
					<br><br>
					
					<button class="btn btn-primary" id="mbtn">나의정보</button>
					<button class="btn btn-primary" id="ebtn">나의정보수정</button>
					<button class="btn btn-primary" id="dbtn">회원탈퇴</button>
				
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