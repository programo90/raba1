<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/cart/cart_list.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/cart/cart_list.js"></script>
</head>
<body>
	<div class="contents">
		<sec:authorize access="hasRole('isAuthenticated()')">
			<sec:authentication property='principal.username' var="userid" />
			<input type="hidden" id="userid" value="${userid}">
		</sec:authorize>
		
		<!--장바구니 상품 정보-->
		<div class="cart">

			<!--장바구니 상품 정보 윗부분-->
			<div class="cartname">
				<div class="cartch1">
					<input type="checkbox" id="main_checkbox" onClick="checkAll()">
				</div>
				<div class="cartimg">
					<span>이미지</span>
				</div>
				<div class="cartgoods">
					<span>상품정보</span>
				</div>
				<div class="cartpri">
					<span>판매가</span>
				</div>
				<div class="cartamount">
					<span>수량</span>
				</div>
				<div class="cartdelivery">
					<span>배송비</span>
				</div>
				<div class="cartpritotal">
					<span>합계</span>
				</div>
			</div>

			<!--장바구니 상품 정보 아랫부분-->
			<c:forEach var="Cartlist" items="${list }">
			<div class="cartlist">
				<div class="cartch2">
					<input type="checkbox" class="list_checkbox" onclick="plusPrice()" checked>
				</div>
				<div class="cartimg">
					<span>이미지</span>
				</div>
				<div class="cartgoods">
					<span><c:out value="${Cartlist.p_name }"/></span>
				</div>
				<div class="cartpri">
					<span><c:out value="${Cartlist.p_price }"/>원</span>
				</div>
				
				<div class="cartamount">
					<span><c:out value="${Cartlist.p_amount }"/>개</span>
				</div>
				<div class="cartdelivery">
					<span>0</span>
				</div>
				<div class="cartpritotal">
					<span><c:out value="${Cartlist.p_price * Cartlist.p_amount }"/>원</span>
					<input type="hidden" value="<c:out value="${Cartlist.p_price * Cartlist.p_amount }"/>" class="price">
				</div>
			</div>
			</c:forEach>
			
			<!--장바구니 상품정보 가격 합계-->
			<div class="cartsal">
				<div class="cartsalprice">
					<span>상품구매금액 150,000 + 배송비 0 (무료) = 합계 : 150,000원</span>
				</div>
			</div>
		</div>

		<!--할인 적용 코멘트-->
		<div class="goodscartco">
			<span>할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</span>
		</div>

		<!--장바구니 상품 삭제 장바구니 비우기 버튼 -->
		<div class="goodscartbtn">
			<span>선택상품</span> <a href="" class="cartdelete">삭제</a><a href=""
				class="cartalldelete">장바구니 비우기</a>
		</div>

		<!--결제 금액 안내-->
		<div class="goodstotalprice">

			<!--결제 금액 안내 윗부분-->
			<div class="goodscartname1">
				<div class="goodstotalprice_1">
					<span>총 상품금액</span>
				</div>
				<div class="goodstotalprice_1">
					<span>총 배송비</span>
				</div>
				<div class="goodstotalprice_2">
					<span>결제예정금액</span>
				</div>
			</div>

			<!--결제 금액 안내 아랫부분-->
			<div class="goodscartname2">
				<div class="goodstotalprice2_1">
					<span id="price_text"></span>
				</div>
				<div class="goodstotalprice2_1">
					<span id="delivery_price_text"></span>
				</div>
				<div class="goodstotalprice2_2">
					<span id="total_price_text"></span>
					<input type="hidden" name="cnolist" id="total_price">
				</div>
			</div>
		</div>

		<!--상품 결제페이지 이동 버튼-->
		<div class="chartpay">
			<input type=submit value="상품 주문 " class="cartpaybtn">
		</div>
	</div>
</body>
</html>