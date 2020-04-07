 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/admin/adminorder.css">
 <script>
	$(document).ready(
			function() {
	function select_tag_sel(ele) {
		//아래 [] 안에 btag로 지정할 값들을 나열해 주세요.
	  var orderstatus_option = ["입금대기", "결제완료", "상품준비중", "배송중", "배송완료", "취소"];
	}
    Number.prototype.format = function(){
        if(this==0) return 0;

        var reg = /(^[+-]?\d+)(\d{3})/;
        var n = (this + '');

        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

        return n;
    };
    
    String.prototype.format = function(){
        var num = parseFloat(this);
        if( isNaN(num) ) return "0";

        return num.format();
    };
    
    jQuery('.format-money').text(function() {
        jQuery(this).text(
            jQuery(this).text().format()
        );
    });
			});
 </script>
 </head>
 <body>
 	<sec:authorize access="isAuthenticated()">
		<sec:authentication property='principal.username' var="userid" />
		<input type="hidden" name="userid" id="userid" value="${userid}">
	</sec:authorize>
         <div class="admincontents">
             <div class="admin_userbox">
                 관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
             </div>
             <section class="admin_sectionbox">
                 <!-- 여기서 div만들고 시작하세요 controller에 file등록하고 사용하세요! ~~  -->
                <div class="membermanager">
                <form method="get" action="adminorder?currPage=${page.startBlock}">
                <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
                       <div class="membermanagersearch">
                       	<div class="membermanagersearch2">
                              <select class="membersearch" name="search">
                              <option value="oderno">주문번호</option>
                              <option value="orderuname">이름</option>
                              <option value="deltype">결제방법</option>
                              <option value="orderstatus">주문상태</option>
                            </select>
                            <input type="text" name="searchtxt" size="1000" class="membersearchtext">
                            <input type="submit" class="membermanagersearchbtn" value="검색">
                        </div>
                       </div>
                       </form>
                    <div class="adminordername">
                        <div class="adminordernum"><span>주문번호</span></div>
                         <div class="adminorderid"><span>이름</span></div>
                        <div class="adminorderphone"><span>연락처</span></div>
                        <div class="adminorderprice"><span>결제금액</span></div>
                        <div class="adminordermethod"><span>결제방법</span></div>
                        <div class="adminorderstate"><span>주문상태</span></div>
                        <div class="adminorderhire"><span>주문일</span></div>
                        <div class="adminorderinvoice"><span>송장번호</span></div>
                        <div class="adminorderdelete"><span></span></div>
                    </div>
                    <c:forEach var="item" items="${list}">
                    <form method="post" action="adminorderresult/${item.oderno}">
                    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
                    <div class="adminordername2">
                        <div class="adminordernum2"><a href="/adminorderdetail/${item.oderno}">${item.oderno }</a></div>
                        <div class="adminorderid2"><span>${item.orderuname }</span></div>
                        <div class="adminorderphone2"><span>${item.orderuphone }</span></div>
                        <div class="adminorderprice2"><span class="format-money">${item.totalprice } </span>원</div>
                        <div class="adminordermethod2"><span>${item.deltype }</span></div>
                        <div class="adminorderstate2"><select id=orderstatus name="orderstatus" onchange="select_tag_sel(this)">
                        							<option value="${item.orderstatus }">${item.orderstatus }</option>
													<option value="입금대기">입금대기</option>
													<option value="결제완료">결제완료</option>
													<option value="상품준비중">상품준비중</option>
													<option value="배송중">배송중</option>
													<option value="배송완료">배송완료</option>
													<option value="취소">취소</option>
													</select></div>
                        <div class="adminorderhire2"><span>${item.salesdate }</span></div>
                        <div class="adminorderinvoice2"><input type="text" name="postno" id="postno" size="9" value="${item.postno }"></div>
                       <div class="adminorderdelete2"> <input type="submit" class="membermanagersearchbtn3" value="수정"></div>
                       <div class="adminorderdelete2"><a href="/adminorder/${item.oderno}">삭제</a></div>
                    </div>
                    </form>
                    </c:forEach>
                       <div class="membermanagersearch3">
                   <div class="membermanagersearch4">
                     </div>
                     <div class="membermanagersearch5">
                                        <c:if test="${page.prev}">
      <a href="adminorder?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}"><c:out value="이전"/></a>
   </c:if>
   <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
      <c:if test="${index==page.currPage}">
         <c:out value="${index}"/>
      </c:if>
      <c:if test="${index!=page.currPage}">
         <a href="adminorder?currPage=${index}&search=${search}&searchtxt=${searchtxt}">${index}</a>
      </c:if>
   </c:forEach>
   <c:if test="${page.next}">
      <a href="adminorder?currPage=${page.endBlock+1}&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
   </c:if>
                     </div>
                </div>
                </div>
            </section>
        </div>
 </body>
 </html>