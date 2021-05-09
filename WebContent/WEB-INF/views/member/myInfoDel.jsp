<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>

<script>
$(document).ready(function(){
	$('#ebtn').click(function(){
		
		if(!(${DATA.pw} == $('#pw').val())){
			alert('비밀번호를 확인하세요');
		} else {
			var result = confirm('정말로 탈퇴하시겠습니까?');
			if(result){
				$(location).attr('href', '/moa/main.moa');
		}
		}
	});
});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="마이페이지" />
	</jsp:include>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">

			<div class="row">
				<div class="col-lg-8 mb-4">
					<h3>회원탈퇴 ></h3>
					<br> <br>
					
					<h4>탈퇴 사유</h4><br>
					<form method="post" id="frm" name="frm" action="/moa/main.moa">

						<div class="form-check w3-margin-bottom">
						  <input class="form-check-input" type="checkbox" value="del1" id="del1" checked>
						  <label class="form-check-label" for="del1">
						    이용빈도 낮음
						  </label>
						</div>
						
						<div class="form-check w3-margin-bottom">
						  <input class="form-check-input" type="checkbox" value="del2" id="del2">
						  <label class="form-check-label" for="del12">
						    싸이트 이용불편
						  </label>
						</div>
						
						<div class="form-check w3-margin-bottom">
						  <input class="form-check-input" type="checkbox" value="del3" id="del3">
						  <label class="form-check-label" for="del3">
						   개인정보 노출우려
						  </label>
						</div>
						
						<div class="form-check w3-margin-bottom">
						  <input class="form-check-input" type="checkbox" value="$('#del4text').val()" id="del4">
						  <label class="form-check-label" for="del4">
						    기타
						  </label>
						  <input type="text" id="del4text"/>
						</div>

						<div class="control-group form-group">
							<div class="controls">
								<label for="name">이름 :</label> <input class="form-control"
									type="text" id="name" name="name" value="${DATA.name}" disabled>
							<p class="help-block" id="namemsg"></p>
							</div>
						</div>

						<label for="id">아이디 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="id" name="id" value="${DATA.id}" disabled>
						</div>
						<p class="help-block" id="idmsg"></p>

						<div class="control-group form-group">
							<div class="controls">
								<label for="pw">비밀번호 :</label> <input class="form-control"
									type="password" id="pw" name="pw">
							<p class="help-block" id="pwmsg"></p>
							</div>
						</div>			

					</form>
					
					<button class="btn btn-primary" id="ebtn">탈퇴하기</button>
				
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