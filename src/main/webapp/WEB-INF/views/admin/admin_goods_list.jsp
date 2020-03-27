<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/goods/ins_goods.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="/resources/js/goods/ins_goods2.js"></script> -->
<!-- <script src="/resources/js/goods/ins_goods.js"></script> -->
</head>
<body>
	<div class="adminwrap">
		<!-- header 부분은 나중에 따로 떼어야하는 부분임!!!-->
		<!--header end-->
		<div class="admincontents">
			<div class="admin_userbox">
				관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
			</div>
			<section class="admin_sectionbox">
				<c:forEach var="Goodslist" items="${list }">
					<ul>
						<li>
							<c:out value="${Goodslist.p_no }"></c:out> 
							<c:out value="${Goodslist.p_name }"></c:out> 
							<c:out value="${Goodslist.p_price }"></c:out> 
							<c:out value="${Goodslist.p_size }"></c:out> 
							<c:out value="${Goodslist.p_amount }"></c:out> 
							<c:out value="${Goodslist.p_state}"></c:out> 
							<a href="/modifygoods/${Goodslist.p_no}">수정</a> 
							<a href="/deletegoods/${Goodslist.p_no}">삭제</a>
						</li>
					</ul>
				</c:forEach>
			</section>
		</div>
	</div>
</body>
</html>