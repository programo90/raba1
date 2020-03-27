<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authorize access="hasRole('isAuthenticated()')">
      <sec:authentication property='principal.username' var="userid"/>
      <input type="hidden" id="userid" value="${userid}">      
   </sec:authorize>
   
	<div class="contents">
		<c:forEach var="Goodslist" items="${list }">
						<ul>
							<li>
								<c:out value="${Goodslist.p_no }"></c:out> 
								<c:out value="${Goodslist.p_name }"></c:out> 
								<c:out value="${Goodslist.p_price }"></c:out>
								<c:out value="${Goodslist.p_state }"></c:out>
								<a href="/goods_detail/${Goodslist.p_name}">상세보기</a>
							</li>
						</ul>
		</c:forEach>
	</div>
</body>
</html>