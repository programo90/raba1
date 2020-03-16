 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/admin/adminmembermanager.css">
 </head>
 <body>
         <div class="admincontents">
             <div class="admin_userbox">
                 관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
             </div>
             <section class="admin_sectionbox">
                 <!-- 여기서 div만들고 시작하세요 controller에 file등록하고 사용하세요! ~~  -->
                <div class="membermanager">
                       <div class="membermanagersearch">
                       <form method="get" action="adminmember?currPage=${page.startBlock}">
                              <select class="membersearch" name="search">
                              <option value="userid">아이디</option>
                              <option value="joindate">가입년도</option>
                            </select>
                            <input type="text" name="searchtxt" size="1000" class="membersearchtext">
                            <input type="submit" class="membermanagersearchbtn" value="검색">
                            </form>
                       </div>
                    <div class="membermanagername">
                    <div class="managernick"><span>아이디</span></div>
                        <div class="manageremail"><span>E-mail</span></div>
                        <div class="managerphone"><span>휴대폰번호</span></div>
                        <div class="managerhire"><span>가입일</span></div>
                        <div class="managergrant"><span>회원등급</span></div>
                        <div class="membermanagerbtn"><span></span></div>
                    </div>
                    <c:forEach var="item" items="${list}">
                    <div class="membermanagername2">
                    	<div class="managernick2"><span>${item.userid }</span></div>
                        <div class="manageremail2"><span>${item.useremail }</span></div>
                        <div class="managerphone2"><span>${item.phone }</span></div>
                        <div class="managerhire2"><span>${item.joindate }</span></div>
                        <div class="managergrant2"><span>관리자</span></div>
                        <div class="membermanagerbtn2"><a href="">수정</a></div>
                    </div>
                    </c:forEach>
                </div>
                   <c:if test="${page.prev}">
      <a href="adminmember?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}"><c:out value="이전"/></a>
   </c:if>
   <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
      <c:if test="${index==page.currPage}">
         <c:out value="${index}"/>
      </c:if>
      <c:if test="${index!=page.currPage}">
         <a href="adminmember?currPage=${index}&search=${search}&searchtxt=${searchtxt}">${index}</a>
      </c:if>
   </c:forEach>
   <c:if test="${page.next}">
      <a href="adminmember?currPage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
   </c:if>
            </section>
        </div>
 </body>
 </html>