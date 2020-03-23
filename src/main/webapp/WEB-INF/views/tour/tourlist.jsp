<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/tour/tourlist.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- <script src="/resources/js/cafe/cafe.js"></script> -->
</head>
<body>
 <div class="banner">
        <!-- 각페이지 top banner -->
        <div class="banner_inner">
       	   <div id="tourlist_img_box">
	            <!-- <img id="tourlist_img" alt="toulistimg" src="/resources/img/tour/tourlist.jpg"> -->
    		</div>
        </div>
    </div>
    <div class="contents">
        <h2 class="contents_title">TOUR</h2>
        <!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
        <section class="cafe">
        	<div id="tourlist_content_wrap">
           <!--for문으로 아래 tourlist_content_box 반복 입력-->
           <c:forEach items="${list}" var="seltour">
           		<div class="tourlist_content_box">
                	<div class="tourlist_content_conbox">
	                   <a class="tourlist_content_box_link" href="tourdetail/${seltour.tourno}">
    	                    <div class="tourlist_content_imgbox">
    	                    	<div class="tourlist_content_tag">
    	                    	<c:choose>
    	                    		<c:when test="${seltour.tourstate==0}"><p class="tourlist_content_tag_app">모집</p></c:when>
    	                    		<c:when test="${seltour.tourstate==1}"><p class="tourlist_content_tag_closed">마감</p></c:when>
    	                    		<c:when test="${seltour.tourstate==2}"><p class="tourlist_content_tag_ended">종료</p></c:when>
    	                    	</c:choose>
    	                    	</div>
    	                    	<c:choose>
    	                    		<c:when test="${seltour.populartour==0}">
    	                    			<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">
    	                    		</c:when>
    	                    		<c:when test="${seltour.populartour==1}">
    	                    			<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">
    	                    		</c:when>
    	                    		<c:when test="${seltour.populartour==2}">
    	                    			<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tour1.jpg">
    	                    		</c:when>
    	                    		<c:when test="${seltour.populartour==3}"></c:when>
    	                    		<c:when test="${seltour.populartour==4}"></c:when>
    	                    	</c:choose>
                        	</div>
                        	<div class="tourlist_content_textbox">
                            	<%-- <h4>${seltour.tourtitle}</h4> --%>
                            	<p><span style="font-size: :15px; font-weight: 200;">FROM</span><span style="font-size:19px; font-weight: 400;"> ${seltour.startspot}</span></p>
                            	<p><span style="font-size: 15px; font-weight: 200;">TO</span>  <span style="font-size:19px; font-weight: 400;"> ${seltour.endspot}</span></p>
                    	        <p>${seltour.tourday}</p>
    	                    </div>
	                    </a>
                	</div>   
            	</div>
           </c:forEach>
           
            <!--이상 tourlist_content_box 반복 끝-->
        </div>
        <div id="tourlist_paging_block">
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
            <!-- 카테고리 end -->
        </section>
    </div>
</body>
</html>