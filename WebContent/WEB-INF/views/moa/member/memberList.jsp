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
	<span>${data.name}</span>
	<span>${data.id}</span>
	<span>${data.pw}</span>
	<span>${data.tel}</span>
	<span>${data.email}</span>
	<span>${data.gen}</span>
	<span>${data.birth}</span>
	<span>${data.sdate}</span>
</c:forEach>
</body>
</html>