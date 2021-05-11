<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	   <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<style type="text/css">
.imgbox{
		width: 260px;
}
.imgbox1{
		width: 100px;
}
input{
	text-align:right;
	width:50px;
	height:28px;
}
.pbtn{
	width: 400px;
	height: 50px;
}
.boxt{
	width: 60px;
	height: 31px;
}

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>	

	<hr class="w3-content  mxw900 ">
		<div class="w3-content w3-margin-top ">
			<h1 class="w3-content w3-margin-left pdl40 w3-padding w3-text-left">결제</h1>
		</div>
	<hr class="w3-content  mxw900 ">
			<div class="w3-content mxw800 ">
			     <div class="w3-col w3-margin-top  w3-padding w3-text-left imgbox">
					 <div class="w3-content inblock pdll0 w3-padding-left">
					  <img src="../img/exh_img_title/jang.gif" class="img-rounded w3-round" alt="Cinque Terre" width="200" height="236"> 
					    
					</div>
				</div>
			     <div class="w3-col mgt40  imgbox">
					  <h3 class="w3-margin-top mgl40 w3-text-grey title">다시 안녕</h3>
					  <p class="mgt20 mgl50">&lt;장 줄리안&gt;</p>            
					  <p class=" mgl50 ">₩ 25000</p>            
					  <p class="mgl0 w3-text-grey">2021.05.15 ~ 2021.08.15</p>        
				</div>
			     <div class="w3-col mgt40   w3-text-left imgbox1">
					 <div class="w3-content inblock pdll0 ">
					 	  <div class="mgt10">
					 	  	<label class="w3-margin-right w3-magin-bottom">유  아</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom">청소년</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom">성  인</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom w3-margin-top">총 금액</label>
					 	  </div>         
					</div>
				</div>
			     <div class="w3-col mgt40  w3-padding w3-text-left imgbox1">
				 	 <div class="w3-border boxt  w3-round-large">
			     		<input type="text" class=" w3-round-large" placeholder="0"><br>
					</div>	
				 	 <div class="w3-border boxt w3-margin-top w3-round-large">
			     		<input type="text" class=" w3-round-large" placeholder="0"><br>
					</div>	
				 	<div class="w3-border boxt w3-margin-top w3-round-large">
			     		<input type="text" class=" w3-round-large" placeholder="0"><br>
				   	</div>	
					<div class="mgt40">
					 	 <div class="w3-border boxt w3-margin-top w3-round-large mgt20">
				     		<input type="text" class=" w3-round-large " placeholder="0"><br>
						</div>	
					</div>	
				
					
				</div>
			     	<div class="w3-col w3-button w3-margin-top w3-margin-left w3-round w3-blue w3-hover-blue w3-round pbtn ftw" id="pbtn">결제하기</div>
				<h5 class="">구매자 정보</h5>
				</div>
					<div class="w3-centent">
						<div class="w3-content ">
							<h5 class="">구매자 정보</h5>
						</div>
					</div>				
				
<%-- <!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include> 
</footer>
	--%>
</body>
</html>