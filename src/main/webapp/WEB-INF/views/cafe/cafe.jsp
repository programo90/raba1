<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/cafe/cafe.css">
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
                <p class="cafe_tab"><a href="javascript:menuClick('/cafe_nutrtion.jsp');">Drink</a></p>
                <p class="cafe_tab" onclick="tapClick(bakery)">Bakery</p>
                <p class="cafe_tab" >My Nutrition</p>
            </div>
            <!-- 분류보기 start -->
            <div id="temp">
            <div class="cafe_category" id="cafePage">
                <p class="cafe_category_tit">분류 보기</p>
                <div class="product_kind_btn">
                    <img src="../img/cafe/list_down_btn.png" alt="분류보기 메뉴 펼치기">
                </div>
                <div class="cafe_category_checkbox">
                    <form method="post">
                        <ul>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="coffeall" value="coffeall">
                                <label for="coffeall" class="checkbox_label">전체 상품 보기</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="coldbrew" value="coldbrew">
                                <label for="coldbrew" class="checkbox_label">콜드 브루 커피</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="brewd" value="brewd">
                                <label for="brewd" class="checkbox_label">브루드 커피</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="espresso" value="espresso">
                                <label for="espresso" class="checkbox_label">에스프레소</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="frappuccino" value="frappuccino">
                                <label for="frappuccino" class="checkbox_label">프라푸치노</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="blended" value="blended">
                                <label for="blended" class="checkbox_label">블렌디드</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="tea" value="tea">
                                <label for="tea" class="checkbox_label">티</label>
                            </li>
                            <li class="cafe_tabli">
                                <input type="checkbox" name="cafepro" id="etcdrink" value="etcdrink">
                            <label for="etcdrink" class="checkbox_label">기타 제조 음료</label>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
            <!-- 분류보기 end -->
            <!-- 카테고리 start -->
            <div class="cafe_category_result">
                <div class="cafe_category_txtbox">
                    <p class="cafe_category_txt">콜드 브루 커피<span class="cafe_category_txtspan">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></p>
                </div>
                <!-- product start-->
                <div class="cafe_product">
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="/resources/img/cafe/1-coldbrew01.jpg" alt="나이트로 쇼콜라 클라우드" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">나이트로 쇼콜라 클라우드</p>
                    </div>
                    <!-- 제품 1개 end -->
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="/resources/img/cafe/1-coldbrew02.jpg" alt="나이트로 콜드 브루" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">나이트로 콜드 브루</p>
                    </div>
                    <!-- 제품 1개 end -->
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="/resources/img/cafe/1-coldbrew03.jpg" alt="돌체 콜드 브루" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">돌체 콜드 브루</p>
                    </div>
                    <!-- 제품 1개 end -->
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="../img/cafe/1-coldbrew04.jpg" alt="바닐라 크림 콜드 브루" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">바닐라 크림 콜드 브루</p>
                    </div>
                    <!-- 제품 1개 end -->
                </div>
                <!-- product end -->
                <!-- product start-->
                <div class="cafe_product">
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="../img/cafe/1-coldbrew05.jpg" alt="콜드 브루" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">콜드 브루</p>
                    </div>
                    <!-- 제품 1개 end -->
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="../img/cafe/1-coldbrew06.jpg" alt="콜드 브루 몰트" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">콜드 브루 몰트</p>
                    </div>
                    <!-- 제품 1개 end -->
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="../img/cafe/1-coldbrew07.jpg" alt="콜드 브루 플로트" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">콜드 브루 플로트</p>
                    </div>
                    <!-- 제품 1개 end -->
                    <!-- 제품 1개 start -->
                    <div class="cafe_product_box">
                        <p class="cafe_product_inner">
                            <a href="#">
                                <img src="../img/cafe/1-coldbrew08.jpg" alt="콜드 폼 콜드 브루" class="cafe_product_img">
                            </a>
                        </p>
                        <p class="cafe_product_title">콜드 폼 콜드 브루</p>
                    </div>
                    <!-- 제품 1개 end -->
                </div>
                <!-- product end -->
            </div>
            <!-- 카테고리 end -->
            </div>
        </section>
    </div>
</body>
</html>