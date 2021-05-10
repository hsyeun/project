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
	$('#${DATA.gen.equals("남자") ? "m":"f"}gen').prop('checked',true);
	
	$('#ebtn').click(function(){
		$(location).attr('href','/moa/member/myInfoEdit.moa');
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
                        <div class="list-group">
                            <a class="list-group-item" href="index.html">메인</a>
                            <a class="list-group-item" href="about.html">구매확인/취소</a>
                            <a class="list-group-item" href="services.html">찜목록</a>
                            <a class="list-group-item" href="contact.html">나의리뷰</a>
                            <a class="list-group-item" href="portfolio-1-col.html">리뷰작성</a>
                            <a class="list-group-item" href="portfolio-2-col.html">나의 1:1문의</a>
                            <a class="list-group-item" href="/moa/member/myInfo.moa">나의정보</a>
                            <a class="list-group-item" href="/moa/member/myInfoEdit.moa">회원정보 수정</a>
                            <a class="list-group-item" href="/moa/member/myInfoDel.moa">회원탈퇴</a>   
                        </div>
                    </div>
                    <!-- Content Column-->
                    	<div class="col-lg-8 mb-4">
					<h3>${DATA.name}님의 회원정보 <small>(가입일 : ${DATA.sdate})</small></h3>
					<br> <br>
					<form method="post" id="frm" name="frm" action="/moa/member/myInfo.moa">

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
									type="password" id="pw" name="pw" value="${DATA.pw}" disabled>
								<p class="help-block" id="pwmsg"></p>
							</div>
						</div>

						<div class="control-group form-group">
							<div class="controls">
								<label for="repw">비밀번호 확인 :</label> <input class="form-control"
									type="password" id="repw" name="repw" value="${DATA.pw}" disabled>
								<p class="help-block" id="repwmsg"></p>
							</div>
						</div>

						<div class="control-group form-group">
							<div class="controls">
								<label for="tel">전화번호 :</label> <input class="form-control"
									type="text" id="tel" name="tel" value="${DATA.tel}" disabled>
								<p class="help-block" id="telmsg"></p>
							</div>
						</div>

						<div class="control-group form-group">
							<div class="controls">
								<label for="email">이메일 :</label> <input class="form-control"
									type="text" id="email" name="email" value="${DATA.email}" disabled>
								<p class="help-block" id="emailmsg"></p>
							</div>
						</div>

						<div>성별 :</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gen" id="mgen"
								value="M" disabled> <label class="form-check-label"
								for="mgen"> 남성 </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gen" id="fgen"
								value="F" disabled> <label class="form-check-label" for="fgen">
								여성 </label>
						</div>

						<br>
						<div class="control-group form-group">
							<div class="controls">
								<label for="birth">생년월일 :</label> <input class="form-control"
									type="text" id="birth" name="birth" value="${DATA.birth}" disabled>
								<p class="help-block" id="birthmsg"></p>
							</div>
						</div>
					</form>
					
					<button class="btn btn-primary" id="ebtn">수정하기</button>
				
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