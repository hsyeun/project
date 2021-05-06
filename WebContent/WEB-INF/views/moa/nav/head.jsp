<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<%
		String resourcesRoot = request.getParameter("static");
	%>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MOA</title>
	
	<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">	
    <link href="<%=resourcesRoot %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=resourcesRoot %>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="<%=resourcesRoot %>/dist/css/sb-admin-2.css" rel="stylesheet">   
    <link href="<%=resourcesRoot %>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="<%=resourcesRoot %>/dist/js/jquery-3.6.0.min.js"></script>	   
    <script src="<%=resourcesRoot %>/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=resourcesRoot %>/vendor/metisMenu/metisMenu.min.js"></script>              
    <script src="<%=resourcesRoot %>/dist/js/sb-admin-2.js"></script>