<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정비 예약</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<link href="/resources/css/repair/repair.css" rel="stylesheet"/>
<link href="/resources/css/repair/mediaqueries.css" rel="stylesheet"/>
<link href="/resources/css/repair/fullcalendar.min.css" rel="stylesheet"/>
<link href="/resources/css/repair/fullcalendar.print.min.css" rel="stylesheet" media="print"/>
<script src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="/resources/js/repair/moment.min.js"></script>
<script src="/resources/js/repair/fullcalendar.min.js"></script>
<script src="/resources/js/repair/fullcalendar_ko.js"></script>
<script src="/resources/js/repair/bpopup.min.js"></script>
<script src="/resources/js/repair/repair.js"></script>
</head>
<body>
	<div class="banner">
        <!-- 각페이지 top banner -->
        <div class="banner_inner"></div>
    </div>
    <div class="contents">
    	<sec:authorize access="isAuthenticated()">
	      	<sec:authentication property='principal.username' var="userid"/>
	      	<input type="hidden" id="userid" value="${userid}">      
	   	</sec:authorize>
        <h2 class="contents_title">REPAIR</h2>
        <!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
        <section class="repair">
            <div class="repair_boxinner">
                <div id="calendar" class="calendar_box"></div>
                <h3 class="repair_subtit">정비 예약 문의</h3>
                <p class="reservation_info"> 예약하고자 하는 날짜 선택 후 문의글을 작성 하시기 바랍니다.</p>
                <div class="repair_inquirybox">
                	<form>
	                   <ul>
	                       <li class="repair_li">
	                          <label for="reservationText" class="reservation_label">정비 문의</label>
	                          <textarea rows="3" cols="148" name="reservtxt" id="reservationText"  class="repair_text" placeholder="자전거 정비 예약 관련 문의글을 작성해주시기 바랍니다."></textarea>
	                       </li>
	                       <li class="repair_li">
	                       	<input type="hidden" name="caldate" id="caldate">
	                       	<!-- 	<input type="button" value="저장" class="admin_btn subminbtn" onclick="reservsend(-1)"> -->
	                       	
	                       	<sec:authorize access="isAuthenticated()">
	                       		<input type="button" value="저장" class="admin_btn subminbtn" onclick="reservsend(-1)">
	                       	</sec:authorize>
	                       	<sec:authorize access="isAnonymous()">
	                       		<input type="button" value="저장" class="admin_btn subminbtn" onclick="loginpage()">
	                       	</sec:authorize>
	                       </li>
	                   </ul> 
                   </form>
                </div>
                <!-- 예약문의 end -->
                <div class="repair_inquirylist_box" id="replyBox">
                	<c:forEach var="list" items="${relist}">
                		<c:choose>
                          		<c:when test="${list.reservlevel ==0}">
                          			<div class="repair_inquirylist">
				                      <div class="repair_inquirylist_txt">
				                        <p class="repair_inquiry_user">${list.username}</p>
				                        <p class="repair_inquiry_date">작성일 : ${list.reservwritedate}</p>
				                        <p class="repair_inquiry_txt"><span class="repair_inquiry_cal">예약일자 ${list.caldate} </span>| ${list.reservtxt}</p>
				                      </div>
				                       <div class="repair_inquirylist_btn">
				                           <input type="button" value="답변보기" class="admin_btn replybtn" onclick="adminreply(this)">
				                       </div>
				                   </div>
                          		</c:when>
                          		<c:when test="${list.reservlevel !=0}">
                          			<div class="reply_box" style="display:none;" data-level="${list.reservlevel}">
					               		<div class="reply">
					               			<p class="rereply_admin">관리자 답변 | <span class="rereply_admintxt">${list.reservtxt}</span></p>
					               		</div>
				                   </div> 
                          		</c:when>
                          	</c:choose>
                	</c:forEach>
                </div>
            </div>
        </section>
    </div>
</body>
</html>