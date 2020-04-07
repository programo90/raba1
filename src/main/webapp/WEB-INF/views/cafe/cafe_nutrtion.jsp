<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/cafe/cafe.css">
	<link rel="stylesheet" href="/resources/css/cafe/mediaqueries.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="/resources/js/cafe/cafe.js"></script>
    <script src="/resources/js/cafe/cafe_nutrtion.js"></script>
</head>
<body>
	<div class="banner">
        <!-- 각페이지 top banner -->
        <div class="banner_inner"></div>
    </div>
    <div class="contents">
        <h2 class="contents_title">CAFE</h2>
        <!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
        <section class="cafe">
            <div class="cafe_tab_box">
                <p class="cafe_tab" id="drinkPage">Drink</p>
                <p class="cafe_tab" id="bakeryPage">Bakery</p>
                <p class="cafe_tab cafe_tab_select" id="nutritionPage">My Nutrition</p>
            </div>
            <div class="cafe_category" id="myInfo">
                <h3 class="nutrtion_subtitle">나의 정보</h3>
                <p class="info_p">BMI 수치를 계산하기 위한 정보입니다. 입력되는 개인정보는 저장되지 않습니다.</p>
                <form action="nutrtion" method="post" class="info_form">
                    <div>
                        <ul>
                            <li class="info_lileft">
                                <label for="age" class="info_label">나이</label>
                                <input type="text" id="age" class="nutrition_inputS" placeholder="ex) 20" required>
                            </li>
                            <li class="info_lileft">
                                <label for="gender" class="info_label">성별</label>
                                <!--<label for="male">남성</label>
                                <input type="radio" id="male" name="gender" value="male">
                                <label for="female">여성</label>
                                <input type="radio" id="female" name="gender" value="female">-->
                                <label class="box-radio-input"><input type="radio" id="male" name="gender" value="male" checked="checked"><span>남성</span></label>
                                <label class="box-radio-input"><input type="radio" id="female" name="gender" value="female"><span>여성</span></label>
                            </li>
                            <li class="info_lileft infor_clear">
                                <label for="cm" class="info_label">키</label>
                                <input type="text" id="cm" class="nutrition_inputS" placeholder="cm" required>
                            </li>
                            <li class="info_lileft">
                                <label for="kg" class="info_label">몸무게</label>
                                <input type="text" id="kg" class="nutrition_inputS" placeholder="kg" required>
                            </li>
                        </ul>
                    </div>
                    <div class="active_box">
                        <p class="active_p">신체활동 수준설정</p>
                        <ul>
                            <li class="active_li">
                               <input type="radio" id="inactive" name="activity" value="inactive" checked="checked">
                                <label for="inactive" >비 활동적 <span class="active_span">(입원환자등 활동이 제한된 사람들의 활동 수준)</span>
                                </label>
                            </li>
                            <li class="active_li">
                               <input type="radio" id="rowactive" name="activity" value="rowactive">
                                <label for="rowactive">저 활동적 <span class="active_span">(대부분의 시간을 앉아서 하는 정적 활동 수준)</span>
                                </label>
                            </li>
                            <li class="active_li">
                                <input type="radio" id="activity" name="activity" value="activity">
                                <label for="activity">활동적<span class="active_span">(주로 앉아서 보내지만 서서 하는 직업,통근, 물건구입, 가사, 가벼운 운동 등 포함)</span>
                                </label>
                            </li>
                            <li class="active_li">
                                <input type="radio" id="veryactivity" name="activity" value="veryactivity">
                                <label for="veryactivity">매우 활동적<span class="active_span">(주로 서서 하는 작업 종사 또는 운동 등의 활발한 여가 활동 수준)</span>
                                </label>
                                
                            </li>
                        </ul>
                    </div>
                    <div class="active_btn_box">
                        <input type="button" value="저장" class="admin_btn subminbtn" id="personinfoBtn">
                        <input type="reset" value="리셋" class="admin_btn">
                    </div>
                </form>
            </div>
            <div class="cafe_category" id="infoAndMenu">
                <div>
                   <div class="kacl_box">
                    <p class="goal_kacl">목표 섭취 열량(kacl)</p>
                    <p class="goal_kacl_num" id="calories"></p>
                </div>
                <div class="kacl_box">
                    <p class="goal_kacl">총 섭취 열량(kacl)</p>
                    <p class="goal_kacl_num"><input type="text" value="0" id="kacltotal" class="goal_kacl_numinput"name="kacltotal"></p>
                </div>
                <div class="nutrtion_box">
                    <p class="nutrtion_info">탄수화물(g)</p>
                    <p class="nutrtion_info"><input type="text" value="0" id="carbtotal" class="nutrtion_infoinput" name="carbtotal"></p>
                    <p class="nutrtion_info">단백질(g)</p>
                    <p class="nutrtion_info"><input type="text" value="0" id="proteintotal" class="nutrtion_infoinput"name="proteintotal"></p>
                    <p class="nutrtion_info">지방(g)</p>
                    <p class="nutrtion_info"><input type="text" value="0" id="fattotal" class="nutrtion_infoinput"name="fattotal"></p>
                    <p class="nutrtion_info">나트륨(g)</p>
                    <p class="nutrtion_info"><input type="text" value="0" id="sodiumtotal" class="nutrtion_infoinput"name="sodiumtotal"></p>
                </div>
                    <h3 class="nutrtion_subtitle">메뉴 검색</h3>
                    <div class="menu_search_box">
                        <form method="get" action="cafe_nutrtion?currpage=${page.startBlock}" id="searchform">
                        	<select class="menusearch" name="search">
                              <option value="MEAL_NAME" selected="selected">메뉴명</option>
                              <option value="MEAL_KCAL">칼로리</option>
                            </select>
                            <input type="text" id="menusearchtxt" name="searchtxt" class="nutrition_inputL" placeholder="메뉴 명을 작성하세요">
                            <input type="hidden" id="tempmode" name="tempmode" value="${tempmode}">
		                    <input type="button" id="searchbtn" value="검색" class="admin_btnS subminbtn inputright">
                        </form>
                    </div>
                  <div class="menu_title">
                      <p class="menu_title_p menu_title_pbig">메뉴</p>
                        <p class="menu_title_p">기준중량(g)</p>
                        <p class="menu_title_p">열량(kal)</p>
                        <p class="menu_title_p">선택</p>
                  </div>
                    <div class="menu_list_box">
                        <ul>
                        	<c:forEach var="selnutrition" items="${nutrtionlist}">
                        		<li class="menu_list_li">
                        			<input type="hidden" value="${selnutrition.MEAL_NO}">
                        			<input type="hidden" value="${selnutrition.MEAL_UNIT}">
                        			<input type="hidden" value="${selnutrition.MEAL_PROTEIN}">
                        			<input type="hidden" value="${selnutrition.MEAL_FAT}">
                        			<input type="hidden" value="${selnutrition.MEAL_CARB}">
                        			<input type="hidden" value="${selnutrition.MEAL_SODIUM}">
	                                <p class="menu_list_lip menu_list_lipbig">${selnutrition.MEAL_NAME}</p>
	                                <p class="menu_list_lip">${selnutrition.MEAL_AMOUNT}</p>
	                                <p class="menu_list_lip">${selnutrition.MEAL_KCAL}</p>
	                                <input type="hidden" id="${checkedState+MEAL_NO}" value="0">
	                                <p class="menu_list_lip menuadd"><input type="checkbox" value="" class="menuaddCheckbox"></p> 
                            	</li>
                        	</c:forEach>
                            
                        </ul>
                    </div>
                    <div class="pageing_box">
	                     <c:if test="${page.prev}">
							<a href="cafe_nutrtion?currpage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}&tempmode=1"><c:out value="이전"/></a>
						</c:if>
						<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
							<c:if test="${index==page.currPage}">
								<c:out value="${index}"/>
							</c:if>
							<c:if test="${index!=page.currPage}">
								<a href="cafe_nutrtion?currpage=${index}&search=${search}&searchtxt=${searchtxt}&tempmode=1">${index}</a>
							</c:if>
						</c:forEach>
						<c:if test="${page.next}">
							<a href="cafe_nutrtion?currpage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}&tempmode=1"><c:out value="다음"/></a>
						</c:if>
					</div>
                </div>
                <h3 class="nutrtion_subtitle">메뉴 정보</h3>
                <div class="menu_title addmenu_title">
                      <!-- <p class="menu_title_pd menu_title_pdsmall">번호</p> -->
                        <p class="menu_title_pd menu_title_pdbig">메뉴</p>
                        <p class="menu_title_pd">섭취량(g)</p>
                        <p class="menu_title_pd">열량(kacl)</p>
                        <p class="menu_title_pd">탄수화물(g)</p>
                        <p class="menu_title_pd">단백질(g)</p>
                        <p class="menu_title_pd">지방(g)</p>
                        <p class="menu_title_pd">나트륨(g)</p>
                </div>
                <form action="" method="post">
                   <div class="menu_list_box">
                        <ul id="menuaddBox">
                        </ul>
                    </div>
                     <div class="active_btn_box">
                       <button type="button" id="modal_opne_btn">평가</button>
                    </div>
                    <div id="modal">
                       <div class="modal_content">
                          <div id="barchart_material" style="width: 900px; height: 500px;"></div>
                          <button type="button" id="modal_close_btn">닫기</button>
                       </div>
                       <div class="modal_layer"></div>
                    </div>
                </form>
            </div>
            </section>
    </div>
    
</body>
</html>