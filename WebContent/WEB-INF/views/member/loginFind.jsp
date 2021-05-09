<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value=""/> 
	</jsp:include>
</head>

<script>
	$(document).ready(function() {		
		$('#mailbtn').click(function(){
		
		var sname = $('#name').val();
		var stel = $('#tel').val();
		$.ajax({
				url : '/moa/member/loginFindProc.cls',
				type : 'post',
				dataType : 'json',
				data : {
					name : sname,
					tel : stel			
				},
				success : function(data) {
					alert(data.result);
				},
				error : function() {
					alert('### 통신 실패###');
				}
		});
	});
});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="로그인"/>
	</jsp:include>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">		
			<div class="row">
				<div class="col-lg-4 mb-4">
					<h3>아이디 찾기</h3>
					<br> <br>
					<form method="post" id="frm1" name="frm1" action="/moa/member/loginFindProc.moa">

						<div class="control-group form-group">
							<div class="controls">
								<label for="name">이름 :</label> <input class="form-control"
									type="text" id="name" name="name">
							<p class="help-block" id="namemsg"></p>
							</div>
						</div>
						
						<div class="control-group form-group">
							<div class="controls">
								<label for="tel">휴대폰번호 :</label> <input class="form-control"
									type="text" id="tel" name="tel">
							<p class="help-block" id="telmsg"></p>
							</div>
						</div>
						
						<label for="mail1">메일인증번호 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="mail1" name="mail1">
							<button class="btn btn-primary mb-3"  type="button"
								id="mailbtn">이메일 발송</button>
						</div>
						<p class="help-block" id="mail1msg"></p>
						
												
					</form>
									
					<button class="btn btn-primary w3-margin-bottom" id="fbtn">아이디 확인</button>	
					
					
					<form method="post" id="frm2" name="frm2" action="/moa/member/loginFindProc.moa">
					<div class="control-group form-group">
							<div class="controls">
								<label for="idconfirm">고객님의 아이디는 :</label> <input class="form-control"
									type="text" id="idconfirm" name="idconfirm" value="${DATA.id}" disabled>
							<p class="help-block" id="idconfirmmsg"></p>
							</div>
						</div>							
					</form>							
				</div>
				
				<div class="col-lg-4 mb-4">
					<h3>비밀번호 찾기</h3>
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
								<label for="pw">임시 패스워드 :</label> <input class="form-control"
									type="password" id="pw" name="pw">
							<p class="help-block" id="pwmsg"></p>
							</div>
						</div>						
					</form>
									
					<button class="btn btn-primary" id="fbtn">임시 로그인</button>								
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
<footer class="py-5 bg-light">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>