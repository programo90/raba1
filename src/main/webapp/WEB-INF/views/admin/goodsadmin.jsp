 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/admin/admingoods.css">
 </head>
 <body>
         <div class="admincontents">
             <div class="admin_userbox">
                 관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
             </div>
             <section class="admin_sectionbox">
                 <!-- 여기서 div만들고 시작하세요 controller에 file등록하고 사용하세요! ~~  -->
                <div class="admingoods">
                       <div class="admingoodssearch">
                           <a href="" class="admingoodssearchbtn">검색</a>
                            <input type="text" size="1000" class="admgoodssearchtext">
                             <select class="admgoodssearch">
                                <option>제품번호</option>
                                <option>상품명</option>
                                <option>판매상태</option>
                            </select>
                       </div>
                    <div class="admingoodscolumn">
                        <div class="admingoodsnum"><span>No</span></div>
                        <div class="admingoodsimg"><span>이미지</span></div>
                        <div class="admingoodsname"><span>상품명</span></div>
                        <div class="admingoodssize"><span>Size</span></div>
                        <div class="admingoodsstock"><span>재고수량</span></div>
                        <div class="admingoodsprice"><span>판매가</span></div>
                        <div class="admingoodssituation"><span>판매상태</span></div>
                    </div>
                    <div class="admingoodscolumn2">

                        <div class="admingoodsnum2"><span>1</span></div>
                        <div class="admingoodsimg2"><span>이미지</span></div>
                        <div class="admingoodsname2"><input type="text" value="와 진짜 싸다 진짜 좋다 좋다 좋다 좋아 좋다" size="45"></div>
                        <div class="admingoodssize2"><input type="text" value="S" size="3"></div>
                        <div class="admingoodsstock2"><input type="text" value="100" size="3"></div>
                        <div class="admingoodsprice2"><input type="text" value="150,000" size="7"></div>
                            <div class="admingoodssituation2">
                             <select >
                                <option>판매중</option>
                                <option>임시품절</option>
                                <option>품절</option>
                            </select>
                            </div>
                        <div class="admingoodsbtn1"><a href="">수정</a></div>
                        <div class="admingoodsbtn1"><a href="">삭제</a></div>
                    </div>
                    <!--                     
                    <c:forEach var="item" items="${list}">
                    <div class="membermanagername2">
                    	<div class="managernick2"><span>${item.userid }</span></div>
                        <div class="manageremail2"><span>${item.useremail }</span></div>
                        <div class="managerphone2"><span>${item.phone }</span></div>
                        <div class="managerhire2"><span>${item.joindate }</span></div>
                        <div class="managergrant2"><span>관리자</span></div>
                        <div class="membermanagerbtn2"><a href="">수정</a></div>
                    </div>
                    </c:forEach> -->
                </div>
                <div class="admingoodsbtnline">
                <a href="" class="admingoodsbtn3">등록</a>
                </div>
            </section>
        </div>
 </body>
 </html>