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
                    
                        <jsp:include page="../a_nav/member/SideBar.jsp">
								<jsp:param name="" value=""/>
							</jsp:include>
                   
                    <!-- Content Column-->
                    <div class="col-lg-9 mb-4">
                        <h3>구매 확인/취소 > </h3>
			<table class="table table-hover w3-center" border="1" summary="게시판 목록">
				<thead class="w3-text-center">
					<tr>
						<th class="w3-center">날 짜</th>
						<th class="w3-center" style="padding-left: 10px;">전 시 명</th>
						<th class="w3-center">금 액</th>
						<th class="w3-center">매 수</th>
						<th class="w3-center"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td align="center">2021.05.05</td>
						<td align="center">공명 : 자연이 주는 울림</td>
						<td align="center">18,000 원</td>
						<td align="center">2 매</td>
						<td align="center"><sapn class=" w3-left w3-button w3-small w3-light-blue">구매취소</sapn></td>
					</tr>
					<tr>
						<td align="center">2021.05.03</td>
						<td align="center">볼로냐 일러스트 원화전</td>
						<td align="center">34,000 원</td>
						<td align="center">3 매</td>
						<td align="center"><sapn class=" w3-left w3-button w3-small w3-light-blue">구매취소</sapn></td>
					</tr>
					<tr>
						<td align="center">2021.05.10</td>
						<td align="center">공명 : 자연이 주는 울림</td>
						<td align="center">18,000 원</td>
						<td align="center">2 매</td>
						<td align="center"><sapn class=" w3-left w3-button w3-small w3-light-blue">구매취소</sapn></td>
					</tr>
				</tbody>
			</table>
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