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
		
	function nameCk(){
		var sname = $('#name').val();
		var exp = /^[a-zA-Z0-9가-힣]{3,10}$/;
		return exp.test(sname);
	}	
	$('#name').keyup(function() {
		
		if (nameCk()) {
			$('#namemsg').removeClass('w3-text-red').addClass('w3-text-green').html('사용가능한 이름입니다.');
				} else {
					$('#namemsg').removeClass('w3-text-green').addClass('w3-text-red').html('특수문자를 제외한 3~10자리를 입력하세요');
				}
			});

	function idCk(){
		var sid = $('#id').val();
		var exp = /^[a-zA-Z0-9]{3,20}$/;
		return exp.test(sid);
	}		
	$('#id').keyup(function() {
		if (idCk()) {
			$('#idmsg').removeClass('w3-text-red').addClass('w3-text-orange').html('유효한 아이디 입니다. 아이디 중복체크를 해주세요');
			$('#idck').addClass('w3-button');
			$('#idck').prop('disabled', false);
		} else {
			$('#idmsg').removeClass('w3-text-green').addClass('w3-text-red').html('특수문자를 제외한 3~20자리를 입력하세요. ');
			$('#idck').prop('disabled', true);
			}
	});
	
	$('#idck').click(function() {
		var sid = $('#id').val();
		$.ajax({
				url : '/moa/member/idCheck.cls',
				type : 'post',
				dataType : 'json',
				data : {
					id : sid
				},
				success : function(data) {
					if (data.result == 'OK') {
						$('#idmsg').removeClass('w3-text-orange').addClass('w3-text-blue').html('*** 사용 가능한 아이디 입니다. ***');
						} else {
						$('#idmsg').removeClass('w3-text-blue').addClass('w3-text-red').html('*** 중복된 아이디 입니다. ***');
					}
				},
				error : function() {
				alert('### 통신 실패###');
				}
		});
	});
	
	function pwCk(){
		var spw = $('#pw').val();
		var exp = /^.{4,16}$/;
		return exp.test(spw);
	}	
	$('#pw').keyup(function(){
			
		if(pwCk()){
			$('#pwmsg').removeClass('w3-text-red').addClass('w3-text-green').html('유효한 패스워드 입니다.');
			$('#repw').val('');
		} else {
			$('#pwmsg').removeClass('w3-text-green').addClass('w3-text-red').html('4~20자리의 문자를 입력하세요. ');
		}
		
	});
	
	function repwCk(){
		var spw = $('#pw').val();
		var repw = $('#repw').val();
		return spw == repw;
	}	
	$('#repw').keyup(function(){		
		if(repwCk()){
			$('#repwmsg').removeClass('w3-text-red').addClass('w3-text-green').html('비밀번호가 일치합니다.');
		} else {
			$('#repwmsg').removeClass('w3-text-green').addClass('w3-text-red').html('비밀번호가 일치하지 않습니다.');
		}
	});
	

	function telCk(){
		var stel = $('#tel').val();
		var exp = /^01[0-9]{9}$/;
		return exp.test(stel);
	}	
	$('#tel').keyup(function(){
		if(telCk()){
			$('#telmsg').removeClass('w3-text-red').addClass('w3-text-green').html('올바른 핸드폰 번호입니다.');
		} else {
			$('#telmsg').removeClass('w3-text-green').addClass('w3-text-red').html('휴대폰 번호 11자리(숫자만) 를 입력하세요 ');
		}
	});
	
	function emailCk(){
		var smail = $('#email').val();
		var exp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return exp.test(smail);
	}
	$('#email').keyup(function(){
		if(emailCk()){
			$('#emailmsg').removeClass('w3-text-red').addClass('w3-text-green').html('유효한 메일계정입니다.');
		} else {
			$('#emailmsg').removeClass('w3-text-green').addClass('w3-text-red').html('메일형식에 맞지 않습니다.');
		}
	});
	
	function birthCk(){
		var sbirth = $('#birth').val();
		var exp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		return exp.test(sbirth);
	}
	$('#birth').keyup(function(){
		if(birthCk()){
			$('#birthmsg').removeClass('w3-text-red').addClass('w3-text-green').html('올바른 생년월일 입니다.');
		} else {
			$('#birthmsg').removeClass('w3-text-green').addClass('w3-text-red').html('생년월일 8자리(숫자만) 입력하세요 ex) 19850122');
		}
	});
	
	$('#sbtn').click(function(){
		if(!($('#name').val())){
			alert('이름을 입력하세요');
			$('#name').focus();
			return;
		} 	
		if(!($('#id').val())){
			alert('아이디를 입력하세요');
			$('#id').focus();
			return;
		}
		if(!($('#pw').val())){
			alert('비밀번호을 입력하세요');
			$('#pw').focus();
			return;
		}
		if(!($('#repw').val())){
			alert('비밀번호 확인을 입력하세요');
			$('#repw').focus();
			return;
		}
		if(!($('#tel').val())){
			alert('전화번호를 입력하세요');
			$('#tel').focus();
			return;
		}
		if(!($('#email').val())){
			alert('이메일을 입력하세요');
			$('#email').focus();
			return;
		}
		if(!($('[name="gen"]:checked').val())){
			alert('성별을 체크하세요');
			return;
		}
		if(!($('#birth').val())){
			alert('생년월일을 입력하세요');
			$('#birth').focus();
			return;
		}
		
		if(!(nameCk() && idCk() && pwCk() && repwCk() && telCk() && emailCk() && birthCk())){
			alert('유효하지 않은 입력값이 있습니다. 다시 확인해주세요');
			return;
		} else if ($('#idmsg').html().indexOf('중복') > -1 ){
			alert('아이디 중복체크를 확인해주세요!');
			return;
		}
		
		$('#frm').submit();
		
	});
});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="회원가입"/>
	</jsp:include>

	<!-- Page Content-->

	<section class="py-5">
		<div class="container">
			
			<!-- 이용약관 -->
			<div id="joinCheck">
				<jsp:include page="joinCheck.jsp">
					<jsp:param name="" value="" />
				</jsp:include>
			</div>

			<div class="row" id="joinForm">
				<div class="col-lg-6 mb-4">
					<h3>회원정보를 입력해주세요</h3>
					<br> <br>
					<form method="post" id="frm" name="frm"
						action="/moa/member/joinProc.moa">

						<label for="name">이름 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="name" name="name">
						</div>
						<p class="help-block" id="namemsg"></p>

						<label for="id">아이디 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="id" name="id">
							<button class="btn btn-primary mb-3" type="button" id="idck"
								disabled>중복체크</button>
						</div>
						<p class="help-block" id="idmsg"></p>

						<label for="pw">비밀번호 : </label>
						<div class="input-group mb-3">
							<input type="password" class="form-control" id="pw" name="pw">
						</div>
						<p class="help-block" id="pwmsg"></p>

						<label for="repw">비밀번호 확인 : </label>
						<div class="input-group mb-3">
							<input type="password" class="form-control" id="repw" name="repw">
						</div>
						<p class="help-block" id="repwmsg"></p>

						<label for="tel">전화번호 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="tel" name="tel">
						</div>
						<p class="help-block" id="telmsg"></p>

						<label for="email">이메일 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="email" name="email">
						</div>
						<p class="help-block" id="emailmsg"></p>

						<label for="gen">성별 : </label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gen" id="mgen"
								value="M"> <label class="form-check-label" for="mgen">
								남성 </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gen" id="fgen"
								value="F"> <label class="form-check-label" for="fgen">
								여성 </label>
						</div><br> 
						
						<label for="birth">생년월일 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="birth" name="birth">
						</div>
						<p class="help-block" id="birthmsg"></p>

					</form><br>
					<button class="btn btn-primary" id="sbtn">가입하기</button>

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