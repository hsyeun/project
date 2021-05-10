<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<style type="text/css">
select{
   border-style: none;
}
</style>
   <jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
</head>   
<script type="text/javascript">
$(document).ready(function(){
   $('.seb').css('cursor','pointer');
   
   $('.title').mouseover(function(){
      $(this).css('text-decoration','underline');
      $(this).css('cursor','pointer');
   
   $('.title').mouseout(function(){
      $(this).css('text-decoration','none');
      });
   });
});
</script>
<body>
<!-- Navigator -->
   <jsp:include page="../a_nav/nav.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
   
   <div class="w3-content mxw800  ">
      <hr class="w3-darkgrey ">
      <div class="w3-content mxw800 ">
         <div class="w3-content m3 w3-margin-top w3-margin-bottom inblock">
            <h1 class="w3-col w3-margin-top w3-margin-left mgb60 inblock w3-left ">고객센터</h1>
               <select class="w3-margin-left w3-border w3-border-light-grey w3-round seb" name="board">
                   <option value="">FAQ</option>
                   <option value="rboard">공지사항</option>
                   <option value="fboard">FAQ</option>
               </select>
         </div>
      </div>
      
      
      <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
      
      
      
      <div class="w3-content w3-left"></div>
      <div class="w3-col w3-center w3-border w3-margin-bottom w3-padding">
            <span class="w3-col m3 "> 글번호 </span>         
            <span class="w3-col m6"> 제목 </span>         
            <span class="w3-col m3"> 작성일</span>         
      </div>
      <div class="w3-col w3-center w3-border-bottom w3-padding">
            <span class="w3-col m3"> 10002 </span>         
            <span class="w3-col m6 title" id="title"> 유효기간 지난 티켓 환불 문의 </span>         
            <span class="w3-col m3"> 2021-04-11</span>         
      </div>
      <div class="w3-col w3-center w3-border-bottom w3-padding">
            <span class="w3-col m3"> 10001 </span>         
            <span class="w3-col m6 title" id="title"> 환불 관련 정책 </span>         
            <span class="w3-col m3"> 2021-02-28</span>         
      </div>
   </div>
   <!-- 페이징 처리 -->
      <div class="w3-center w3-margin-top w3-margin-bottom ">
         <div class="w3-bar w3-border w3-round w3-margin-top">
            <span class="w3-bar-item w3-border-right"><</span>
            <span class="w3-bar-item w3-button">1</span>
            <span class="w3-bar-item w3-border-left ">></span>
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