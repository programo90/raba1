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
                <p class="cafe_tab">카페상품 수정/삭제</p>
                <p class="cafe_tab">카페상품 등록</p>
            </div>
            <section class="admin_sectionbox">
                <!-- 여기서 div만들고 시작하세요 -->
                <div class="admin_cafebox">
                    <div class="admin_cafecon">
                        <form method="post" action="cafeinsert" enctype="multipart/form-data" >
                            <div class="admin_cafe_basicsbox">
                                <ul>
                                    <li class="admin_cafe_li">
                                        <label for="cafeTab" class="admin_cafelable">카페상품</label>
                                        <select id="cafeTab" class="admin_cafe_select" onchange="tabChange(this)" required>
                                            <option>DRINK 및 BAKERY를 선택해주세요</option>
                                            <option value="DRINK">DRINK</option>
                                            <option value="BAKERY">BAKERY</option>
                                        </select>
                                    </li>
                                    <li class="admin_cafe_li">
                                        <label for="cafeCategory" class="admin_cafelable">분류</label>
                                        <select id="cafeCategory" class="admin_cafe_select" required>
                                        	<!-- <option>분류를 선택해주세요</option> -->
                                            <!-- <option value="coldbrew">콜드 브루 커피</option>
                                            <option value="brewd">브루드 커피</option>
                                            <option value="espresso">에스프레소</option>
                                            <option value="frappuccino">프라푸치노</option>
                                            <option value="blended">블렌디드</option>
                                            <option value="tea">티</option>
                                            <option value="etcdrink">기타 제조 음료</option> -->
                                        </select>
                                    </li>
                                    <li class="admin_cafe_li">
                                        <label for="cafeMenu" class="admin_cafelable">메뉴명</label>
                                        <input type="text" id="cafeMenu" class="admin_cafe_input" value="" placeholder="메뉴명을 작성하세요" required>
                                    </li>
                                    <li class="admin_cafe_li">
                                        <label for="cafeMenuEng" class="admin_cafelable">영문메뉴명</label>
                                        <input type="text" id="cafeMenuEng" class="admin_cafe_input" value="" placeholder="영문메뉴명을 작성하세요" required>
                                    </li>
                                    <li class="admin_cafe_li">
                                    <label for="cafeDetail" class="admin_cafelable">알레르기 유발요인</label>
                                    <input type="text" id="cafeDetail" class="admin_cafe_input"  value="" placeholder="알레르기 유발요인을 작성하세요">
                                </li>
                                </ul>
                            </div>
                            <div class="cafe_imgbox">
                                <div class="cafe_imgboxinner">
                                	<div class="cafe_img">
							           <img id="img" /> 
							       </div>
                                   <input type="file" id="file1" name="file1">
                                   <!-- <button type="button" id="img1Btn" name="img1Btn">이미지 등록</button> -->
                                </div>
                          	</div>
                            <ul class="admin_cafe_addbox">
                                <li class="admin_cafe_li cafeliheight">
                                    <label for="cafeDetail" class="admin_cafelable cafelablefloat">설명</label>  
                                    <textarea rows="4" cols="134" id="cafeDetail" class="admin_cafe_textarea" value="" placeholder="메뉴의 설명을 작성하세요" required></textarea>
                                </li>
                                
                                <li class="admin_cafe_li admin_cafe_lispecil">
                                    <label for="" class="admin_cafelable admin_cafelablespecil">추가 이미지</label>
                                    <div class="cafe_img_addbox">
                                    	<div class="cafe_img_add">
								           <img id="img2" /> 
								        </div>
                                    	<input type="file" id="file2" name="file2" class="admin_file_btn">
                                    </div>
                                    <div class="cafe_img_addbox">
                                    	<div class="cafe_img_add">
								           <img id="img3" /> 
								        </div>
                                    	<input type="file" id="file3" name="file3" class="admin_file_btn">
                                    </div>
                                    <div class="cafe_img_addbox">
                                    	<div class="cafe_img_add">
								           <img id="img4" /> 
								        </div>
                                    	<input type="file" id="file4" name="file4" class="admin_file_btn">
                                    </div>
                                    <!-- <button type="button">이미지1</button>
                                    <button type="button">이미지2</button>
                                    <button type="button">이미지3</button> -->
                                </li>
                            </ul>
                            <div  class="admin_cafe_nutritionbox">
                                <p class="admin_cafe_nutrition">제품 영양 정보</p>
                                <div>
                                    <ul>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeSize" class="admin_cafelable">사이즈</label> 
                                           <input type="text" id="cafeSize" class="admin_cafe_inputS">
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeCapacity" class="admin_cafelable">용량</label> 
                                           <input type="text" id="cafeCapacity" class="admin_cafe_inputS" required>
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeKcal" class="admin_cafelable">1회 제공량(kcal)</label> 
                                           <input type="text" id="cafeKcal" class="admin_cafe_inputS" placeholder="kcal" required>
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeSodium" class="admin_cafelable">나트륨(mg)</label> 
                                           <input type="text" id="cafeSodium" class="admin_cafe_inputS" placeholder="mg" required>
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeFat" class="admin_cafelable">포화지방(g)</label> 
                                           <input type="text" id="cafeFat" class="admin_cafe_inputS" placeholder="g" required>
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeSugars" class="admin_cafelable">당류(g)</label> 
                                           <input type="text" id="cafeSugars" class="admin_cafe_inputS" placeholder="g" required>
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeProtein" class="admin_cafelable">단백질(g)</label> 
                                           <input type="text" id="cafeProtein"  class="admin_cafe_inputS" placeholder="g" accept=""required>
                                        </li>
                                        <li class="admin_cafe_li cafelileft">
                                           <label for="cafeCaffeine" class="admin_cafelable">카페인(mg)</label> 
                                           <input type="text" id="cafeCaffeine" class="admin_cafe_inputS" placeholder="g">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="admin_btnbox">
                                <input type="submit" value="등록" class="admin_btn subminbtn">
                                <input type="reset" value="취소" class="admin_btn">
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
</body>
</html>