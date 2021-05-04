<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/w3-colors-flat.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<c:forEach var="data" items="${LIST}">
	<ol>
	<li>이름: ${data.name}</li>
	<li>아이디: ${data.id}</li>
	<li>패스워드: ${data.pw}</li>
	<li>전화번호: ${data.tel}</li>
	<li>이메일: ${data.email}</li>
	<li>성별: ${data.gen}</li>
	<li>생년월일: ${data.birth}</li>
	<li>가입일: ${data.sdate}</li>
	</ol>
</c:forEach>
</body>
</html>