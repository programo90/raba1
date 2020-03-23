<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/cafe/cafeadmin.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/cafe/cafeadmin.js"></script>
</head>
<body>
	<div class="admincontents">
            <div class="admin_userbox">
                관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
            </div>
            <div class="cafe_topbox">
                <p class="cafe_tab" id="cafeadmin">카페상품 수정/삭제</p>
                <p class="cafe_tab" id="cafeinsert">카페상품 등록</p>
            </div>
            <section class="admin_sectionbox">
                <!-- 여기서 div만들고 시작하세요 -->
                <div class="admin_cafebox" >
                    <div class="admin_cafecon">
                        <ul>
                        	<li class="admin_cafe_li">
                        		<p class="cafeadmin_list">이미지</p>
                        		<p class="cafeadmin_list">카페상품</p>
                        		<p class="cafeadmin_list">카페카테고리</p>
                        		<p class="cafeadmin_list">메뉴명</p>
                        	</li>
                        	<li class="admin_cafe_li">
                        		<p class="cafeadmin_list">이미지</p>
                        		<p class="cafeadmin_list">카페상품</p>
                        		<p class="cafeadmin_list">카페카테고리</p>
                        		<p class="cafeadmin_list">메뉴명</p>
                        	</li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
</body>
</html>