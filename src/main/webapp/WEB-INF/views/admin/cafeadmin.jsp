<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                	관리자님 환영합니다!
            <span class="admin_logout"><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></span>
			<form id="logout-form" action=/customLogout method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
            </div>
            <div class="cafe_topbox">
                <p class="cafe_tab cafe_tabelected" id="cafeadmin">카페상품 수정/삭제</p>
                <p class="cafe_tab" id="cafeinsert">카페상품 등록</p>
            </div>
            <section class="admin_sectionbox">
                <!-- 여기서 div만들고 시작하세요 -->
                <div class="admin_cafebox" >
                    <div class="admin_cafecon">
                    	<div class="admin_searchBox">
                    		<form method="get" action="cafeadmin?currpage=${page.startBlock}">
                        	<select class="menusearch" name="search">
                              <option value="menu" selected="selected">메뉴명</option>
                              <option value="cafeproduct">카페상품</option>
                              <option value="cafecategory">분류</option>
                            </select>
                            <input type="text" name="searchtxt" class="admin_inputL" placeholder="검색">
		                    <input type="submit"  value="검색" class="admin_btn subminbtn inputright">
                        </form>
                    	</div>
                        <ul>
                        	<c:forEach var="list" items="${adminlist}">
                        	<li class="admin_cafelist_li">
                        		<input type="hidden" value="${list.cafeno}">
                        		<p class="cafeadmin_list listImg"><img style="width:100%; height:100%" alt="imgurl" src="/downloadFile/${list.cafeno}"></p>
                        		<p class="cafeadmin_list listproduct">${list.cafeproduct}</p>
                        		<p class="cafeadmin_list listcategory">${list.cafecategory}</p>
                        		<p class="cafeadmin_list listMenu">${list.menu}</p>
                        		<p class="cafeadmin_list listbtn"><input type="button" value="수정" class="cafeaModify admin_btn smallbtn"></p>
                        	</li>
                        	</c:forEach>
                        </ul>
                        <div class="pageing_box">
		                     <c:if test="${page.prev}">
								<a href="cafeadmin?currpage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}"><c:out value="이전"/></a>
							</c:if>
							<c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
								<c:if test="${index==page.currPage}">
									<c:out value="${index}"/>
								</c:if>
								<c:if test="${index!=page.currPage}">
									<a href="cafeadmin?currpage=${index}&search=${search}&searchtxt=${searchtxt}">${index}</a>
								</c:if>
							</c:forEach>
							<c:if test="${page.next}">
								<a href="cafeadmin?currpage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
							</c:if>
						</div>
                    </div>
                </div>
            </section>
        </div>
</body>
</html>