<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>CAFE</title>
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
        <h2 class="contents_title">${cafedto.cafecategory}</h2>
        <!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
        <section class="cafe">
           <div class="cafe_detail">
            <div class="cafe_detail_img">
               <div class="cafe_detail_imgbox">
                   <!-- <img src="img/cafe/1-coldbrew01_detail.jpg" alt="나이트로 쇼콜라 클라우드"> -->
                   <img style="width:100%; height:100%" alt="cafeimg" src="/downloadFile/${cafedto.cafeno}">
               </div>
            </div>
            <div class="cafe_detail_infobox">
                <div class="cafe_detail_titbox">
                	<input type="hidden" value="${cafedto.cafeno}">
                    <h3 class="cafe_h3">${cafedto.menu}</h3>
                    <p class="cafe_eng">${cafedto.menueng}</p>
                </div>
                <p class="cafe_detail_pro">${cafedto.menuexplain}</p>
                <div class="cafe_detail_info">
                    <p class="cafe_detail_infop">제품 영양 정보<span class="cafe_detail_infospan">Tall(톨) / ${nutridto.MEAL_AMOUNT}${nutridto.MEAL_UNIT} (12 fl oz)</span></p>
                    <div class="product_info_content">
                         <ul class="product_info_contentul">
                            <li class="kcal">
                                <dl>
                                    <dt>1회 제공량 (kcal)</dt>
                                    <dd>${nutridto.MEAL_KCAL}</dd>
                                </dl>
                            </li>
                            
                            <li class="protein">
                                <dl>
                                    <dt>단백질 (g)</dt>
                                    <dd>${nutridto.MEAL_PROTEIN}</dd>
                                </dl>
                            </li>
                        </ul>
                        <ul class="product_info_contentul">
                            <li class="sodium">
                                <dl>
                                    <dt>나트륨 (mg)</dt>
                                    <dd>${nutridto.MEAL_SODIUM}</dd>
                                </dl>
                            </li>
                            <li class="sat_FAT">
                                <dl>
                                    <dt>포화지방 (g)</dt>
                                    <dd>${nutridto.MEAL_FAT}</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <p class="allergy">알레르기 유발요인 : ${cafedto.allergy}</p>
                </div>
            </div>
            </div>
        </section>
    </div>
</body>
</html>