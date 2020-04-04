<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정비 스케줄 관리</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<link href="/resources/css/repair/repair.css" rel="stylesheet"/>
<link href="/resources/css/repair/fullcalendar.min.css" rel="stylesheet"/>
<link href="/resources/css/repair/fullcalendar.print.min.css" rel="stylesheet" media="print"/>
<script src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="/resources/js/repair/moment.min.js"></script>
<script src="/resources/js/repair/fullcalendar.min.js"></script>
<script src="/resources/js/repair/fullcalendar_ko.js"></script>
<script src="/resources/js/repair/bpopup.min.js"></script>
<script src="/resources/js/repair/repairadmin.js"></script>
</head>
<body>
	<div class="admincontents">
		<div class="admin_userbox">
			관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
		</div>
		<section class="admin_sectionbox">
			<!-- 여기서 div만들고 시작하세요 -->
			<div class="">
				<!-- calendar부분 -->
				<div class="addschedulbox">
					<button onclick="javascript:addSchedule();" class="admin_btn subminbtn addscheduelbtn">스케줄 등록</button>
				</div>
				<div id="calendar" class="calendar_box"></div>
				<!-- addpop -->
				<div class="box box-success calpopbox" id="winAlert">
					<div class="box-headeer">
						<h3 class="box-title calpoptitle" id="alert_subject"></h3>
					</div>
					<div class="box-body calpopdetail" id="alert_contents"></div>
				</div>
				<div class="repair_inquirylist_box">
                	<c:forEach var="list" items="${relist}">
                		<c:choose>
                          		<c:when test="${list.reservlevel ==0}">
                          			<div class="repair_inquirylist" data-temp="pps">
				                      <div class="repair_inquirylist_txt">
				                        <p class="repair_inquiry_user">문의자</p>
				                        <p class="repair_inquiry_date">작성일 : ${list.reservwritedate}</p>
				                        <p class="repair_inquiry_txt"><span class="repair_inquiry_cal">예약일자 ${list.caldate} </span>| ${list.reservtxt}</p>
				                      </div>
				                      <div class="repair_inquirylist_btn" data-temp="ppsc1">
				                           <input type="button" value="답변" class="admin_btn" onclick="adminreply(this)">
				                       </div>
				                       <%-- <form style="display:none; height: 70px; margin-left: 40px;">
						                   <ul>
						                       <li class="repair_li">
						                          <label for="reservationText" class="reservation_label">정비 문의</label>
						                          <input type="hidden" name="userid" value="${userid}">
						                          <textarea rows="3" cols="117" name="reservtxt" id="reservationText${list.reservorder}"  class="repair_text reservationText" placeholder="문의한 글의 답변 내용을 작성해주시기 바랍니다."></textarea>
						                       </li>
						                       <li class="repair_li">
						                       	<input type="hidden" name="caldate" id="caldate">
						                       	<input type="button" value="저장" class="admin_btn subminbtn" onclick="reservsend(${list.reservorder})">
						                       </li>
						                   </ul> 
					                   </form> --%>
				                   </div>
				                   <form style="display:none; height: 70px; margin-left: 24px;">
					                   <ul>
					                       <li class="repair_li">
					                          <label for="reservationText" class="reservation_label">정비 문의</label>
					                          <input type="hidden" name="userid" value="${userid}">
					                          <textarea rows="3" cols="117" name="reservtxt" id="reservationText${list.reservorder}"  class="repair_text reservationText" placeholder="문의한 글의 답변 내용을 작성해주시기 바랍니다."></textarea>
					                       </li>
					                       <li class="repair_li">
					                       	<input type="hidden" name="caldate" id="caldate">
					                       	<input type="button" value="저장" class="admin_btn subminbtn" onclick="reservsend(${list.reservorder})">
					                       </li>
					                   </ul> 
				                   </form>
                          		</c:when>
                          		<c:when test="${list.reservlevel !=0}">
                          			<div class="reply_box" data-temp="pp">
					               		<div class="reply" data-temp="p">
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