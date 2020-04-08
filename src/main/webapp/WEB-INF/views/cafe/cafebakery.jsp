<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/cafe/cafe.css">
    <link rel="stylesheet" href="/resources/css/cafe/mediaqueries.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/cafe/cafe.js"></script>
</head>
<body>
 <div class="banner">
        <!-- 각페이지 top banner -->
        <div class="banner_inner"></div>
    </div>
    <div class="contents">
        <h2 class="contents_title">CAFE</h2>
        <section class="cafe">
            <div class="cafe_tab_box">
                <p class="cafe_tab" id="drinkPage">Drink</p>
                <p class="cafe_tab cafe_tab_select" id="bakeryPage">Bakery</p>
                <p class="cafe_tab" id="nutritionPage">My Nutrition</p>
            </div>
            <!-- 분류보기 start -->
            <div id="temp">
            <div class="cafe_category" id="cafePage">
                <p class="cafe_category_tit">분류 보기</p>
                <div class="product_kind_btn">
                    <img src="/resources/img/cafe/list_down_btn.png" alt="분류보기 메뉴 펼치기">
                </div>
                <div class="cafe_category_checkbox">
                    <form method="post">
                        <ul>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="bakeryeall" value="checkall" onclick="tempf()">
                                <label for="coffeall" class="checkbox_label">전체 상품 보기</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="bakery" value="베이커리" onclick="tempf()">
                                <label for="coldbrew" class="checkbox_label">베이커리</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="cake" value="케이크" onclick="tempf()">
                                <label for="brewd" class="checkbox_label">케이크</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="sandwich" value="샌드위치&샐러드" onclick="tempf()">
                                <label for="espresso" class="checkbox_label">샌드위치&샐러드</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="hotfood" value="따뜻한 푸드" onclick="tempf()">
                                <label for="frappuccino" class="checkbox_label">따뜻한 푸드</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="ice" value="아이스크림" onclick="tempf()">
                                <label for="blended" class="checkbox_label">아이스크림</label>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
            <!-- 분류보기 end -->
            <!-- 카테고리 start -->
            <div class="cafe_category_result">
            	<!-- 카테고리 div start-->
            	<c:forEach var="categorydto" items="${catelist}">
	         		<div class="cafe_category_txtbox" id="categotybox${categorydto}">
	                   <p class="cafe_category_txt">${categorydto}<span class="cafe_category_txtspan">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></p>
	                </div>
	                <!-- 카테고리 div end-->
	              	<!-- product start-->
	                <div class="cafe_product">
	                   <!-- 제품 1개 start -->
	                   <c:forEach var="cafelist" items="${list}">
	                   	<c:if test="${cafelist.cafecategory==categorydto}">
		                   	<div class="cafe_product_box" >
		                   		<%-- <input type="hidden" value="${category.cafecategory==''}"> --%>
		                        <p class="cafe_product_inner">
		                        	<input type="hidden" value="${cafelist.cafeno}"> 
		                           <img style="width:100%; height:100%" alt="cafeimg" src="/downloadFile/${cafelist.cafeno}" class="cafe_product_img">
		                        </p>
		                        <p class="cafe_product_title">${cafelist.menu}</p>
		                    </div>
	                    </c:if>
	                   </c:forEach>
	                </div>
                </c:forEach>
              	<!-- product end -->
            </div>
            <!-- 카테고리 end -->
            </div>
        </section>
    </div>
</body>
</html>