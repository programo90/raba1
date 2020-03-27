<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/tour/tourlist.css">
    <link rel="stylesheet" href="/resources/css/tour/touradmin.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/tour/touradmin.js"></script>
</head>
<body>
        <div class="admincontents">
            <div class="admin_userbox">
                관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
            </div>
            <section class="admin_sectionbox">
                <!-- 여기서 div만들고 시작하세요 -->
                <div id="tourlistblock">
                	<ul>
                		<li id="tourlisttitle">
                			<div class="tourlistbox">
                				<p class="tourlistno">번호</p>
	                			<p class="tourlisthostid">등록인</p>
	            	    		<p class="tourlisttitle">제목</p>
	        	      			<p class="tourliststart">출발지</p>
	    	         			<p class="tourlistend">도착,반환지</p>
		                		<p class="tourlisttourday">일시</p>
		                		<p class="tourlistcount">지원현황</p>
		                		<p class="tourliststate">게시상태</p>
                			</div>
                		</li>
        	        	<c:forEach items="${tourlist}" var="seldto">
        	        		<li>
    	            			<div class="tourlistbox">
    	            				<a href="/tourdetail/${seldto.tourno}">
    	            					<p class="tourlistno">${seldto.tourno}</p>
	                					<p class="tourlisthostid">${seldto.userid}</p>
	            	    				<p class="tourlisttitle">${seldto.tourtitle}</p>
	        	        				<p class="tourliststart">${seldto.startspot}</p>
	    	            				<p class="tourlistend">${seldto.endspot}</p>
		                				<p class="tourlisttourday">${seldto.tourday} ${seldto.tourtime}</p>
		                				<p class="tourlistcount">${seldto.cancount}/${seldto.totalcount}</p>
	                				</a>
	                				<p class="tourliststate">
	                					<select class="tourstatesel" id="tourstatesel${seldto.tourno}">
	                						<option value="0">모집중</option>
	                						<option value="1">마감</option>
	                						<option value="2">종료</option>
	                					</select>
	                					<input type="hidden" value="${seldto.tourstate}">
	                				</p>
	                				<p class="tourlistbtn"><button onclick="updatestate(${seldto.tourno})">변경</button> </p>
                				</div>
                			</li>
                			
                		</c:forEach>
                	</ul>
                	<div id="touradmin_paging_block">
          				<div id="tourlist_paging_box">
             				<div id="tourlist_paging_pre">
             					<c:if test="${page.prev}">
					     			<a href="tourlist?currPage=${startBlock-1}">Prev</a>
             					</c:if>
              				</div>
              				<div id="tourlist_paging_num">
                				<c:forEach begin="${page.startBlock}" end="${page.endBlock}" var="index">
                					<c:if test="${index == page.currPage }">
                						${index}
                					</c:if>
                					<c:if test="${index != page.currPage }">
                						<a href="tourlist?currPage=${index }">${index}</a>		
                					</c:if>
                				</c:forEach>
                			</div>
                			<div id="tourlist_paging_next">
                    			<c:if test="${page.next}">
			                    	<a href="tourlist?currPage=${page.endBlock+1}">Next</a>
            			        </c:if>
			                </div>
            			</div>
        			</div>
                </div>
            </section>
        </div>
</body>
</html>