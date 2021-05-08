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
		$('#sbtn').click(function(){
			$('#frm').submit();
		});
		
		if('${MSG}' == 'fail'){
			$('.modal').css('display', 'block');
				$('.modalbtn').click(function(){
				$('.modal').css('display', 'none');	
				});
		}
	});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">

			<div class="row">
				<div class="col-lg-8 mb-4">
					<h3>로그인 정보를 입력해 주세요</h3>
					<br> <br>
					<form method="post" id="frm" name="frm" action="/moa/member/loginProc.moa">

						<div class="control-group form-group">
							<div class="controls">
								<label for="id">아이디 :</label> <input class="form-control"
									type="text" id="id" name="id">
							<p class="help-block" id="idmsg"></p>
							</div>
						</div>
						
						<div class="control-group form-group">
							<div class="controls">
								<label for="pw">패스워드 :</label> <input class="form-control"
									type="password" id="pw" name="pw">
							<p class="help-block" id="pwmsg"></p>
							</div>
						</div>						
					</form>
					
					<button class="btn btn-primary" id="sbtn">로그인</button>
				
				</div>
			</div>
		</div>
	</section>

		<div class="modal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">로그인 실패</h5>
		        <button type="button" class="btn-close modalbtn" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>아이디와 패스워드를 확인하세요</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary modalbtn" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>

<!-- Footer-->
<footer class="py-5 bg-dark">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>