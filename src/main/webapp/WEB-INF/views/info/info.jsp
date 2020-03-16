<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/info/info.css">
	<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQ2VrwCAwKQq9UWrXNVPlc4_64qC_a8xU&libraries=places&callback=initMap" async defer></script>
	<script src="/resources/js/info/info.js"></script>
</head>
<body>
	<div class="contents">
		<!-- <div id="info_map"></div> -->

		<div id="map"></div>
        <div class="enter_start">
        
            <label for="start_p">찾아오시는 길</label>
            
            
		    <input id="origin-input" class="controls" type="text" placeholder="   출발지를 입력하세요">
		        <!-- 출발지를 사용자에게 값을 받음 -->
		    <div id="mode-selector" class="controls">
		     	<input type="radio" name="type" id="changemode-transit"  checked="checked">
		     	<label for="changemode-transit">Transit</label>
		    
		<!-- Replace the value of the key parameter with your own API key. -->
		</div>
		
        </div>
        <div class="notice">
           <label for="">공지사항</label>
            <div class="n_board">
                <div class="brd_head">
                    <div class="n_no">No.</div>
                    <div class="n_title">Title</div>
                    <div class="n_date">Date</div>
                </div>
                <c:forEach var="Notice" items="${list}">
                <div class="brd_body">
                    <div class="brd_list">
                        <div class="n_no"><c:out value="${Notice.ntcno }"/></div>
			            <div class="n_title"><c:out value="${Notice.ntctitle }"/></div>
			            <div class="n_date"><c:out value="${Notice.ntcdate }"/></div>
                    </div>
                    <div class="n_content"><div class="c_detail"><c:out value="${Notice.ntccontent }"/></div></div>
                </div><!-- brd_body  -->
                </c:forEach>
            </div>
        </div>
        <!-- <div class="info_contact">
            <h4>Contact</h4>
            <br>
            <p>
                82 - 10 - 1234 - 5678 <br><br>
                bacafe@breakaway.com<br><br>
                서울특별시 강서구 염창동 75-7 B.A. Cycle Stop<br>
                93-23, Yangcheon-ro 67-gil, Gangseo-gu, Seoul, Republic of Korea
            </p>
        </div> -->
	</div>
</body>
</html>