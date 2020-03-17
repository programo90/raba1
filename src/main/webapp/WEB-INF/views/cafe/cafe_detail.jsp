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
        <h2 class="contents_title">콜드브루</h2>
        <!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
        <section class="cafe">
           <div class="cafe_detail">
            <div class="cafe_detail_img">
               <div class="cafe_detail_imgbox">
                   <img src="img/cafe/1-coldbrew01_detail.jpg" alt="나이트로 쇼콜라 클라우드">
               </div>
            </div>
            <div class="cafe_detail_infobox">
                <div class="cafe_detail_titbox">
                    <h3 class="cafe_h3">나이트로 쇼콜라 클라우드</h3>
                    <p class="cafe_eng">Nitro Chocolat Cloud</p>
                </div>
                <p class="cafe_detail_pro">초콜릿과 견과류의 풍미, 초콜릿 파우더 토핑, 하프&#38;하프 샷<br>
                부드럽고 달콤한 새로운 나이트로 콜드 브루</p>
                <div class="cafe_detail_info">
                    <p class="cafe_detail_infop">제품 영양 정보<span class="cafe_detail_infospan">Tall(톨) / 355ml (12 fl oz)</span></p>
                    <div class="product_info_content">
                         <ul class="product_info_contentul">
                            <li class="kcal">
                                <dl>
                                    <dt>1회 제공량 (kcal)</dt>
                                    <dd>55</dd>
                                </dl>
                            </li>
                            <li class="sat_FAT">
                                <dl>
                                    <dt>포화지방 (g)</dt>
                                    <dd>2</dd>
                                </dl>
                            </li>
                            <li class="protein">
                                <dl>
                                    <dt>단백질 (g)</dt>
                                    <dd>1</dd>
                                </dl>
                            </li>
                        </ul>
                        <ul class="product_info_contentul">
                            <li class="sodium">
                                <dl>
                                    <dt>나트륨 (mg)</dt>
                                    <dd>20</dd>
                                </dl>
                            </li>
                            <li class="sugars">
                                <dl>
                                    <dt>당류 (g)</dt>
                                    <dd>7</dd>
                                </dl>
                            </li>
                            <li class="caffeine last">
                                <dl>
                                    <dt>카페인 (mg)</dt>
                                    <dd>245</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <p class="allergy">알레르기 유발요인 : 우유</p>
                </div>
            </div>
            </div>
        </section>
    </div>
</body>
</html>