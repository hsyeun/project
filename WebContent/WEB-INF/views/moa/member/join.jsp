<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
</script>
</head>
<body>
	
		<h1>moa 회원가입</h1>
		<form method="POST" action="/moa/member/joinProc.moa" name="frm" id="frm">
			<div>
				<label for="name">회원이름 : </label>
				<input type="text" name="name" id="name">
			</div>
			<div>
				<label for="id" >아 이 디 : </label>
				<input type="text" name="id" id="id">
			</div>
			<div>
				<label for="pw" >비 밀 번 호 : </label>
				<input type="text" name="pw" id="pw">
			</div>
			<div>
				<label for="tel" >전 화 번 호 : </label>
				<input type="text" name="tel" id="tel">
			</div>
			<div>
				<label for="email" >이 메 일 : </label>
				<input type="text" name="email" id="email">
			</div>
			<div>
				<label for="gen" >성 별 : </label>
				<input type="text" name="gen" id="gen">
			</div>
			<div>
				<label for="birth" >생 년 월 일 : </label>
				<input type="text" name="birth" id="birth">
			</div>
			<div>
				<label for="" >제출 : </label>
				<input type="submit">
			</div>
			
		</form>
</body>
</html>