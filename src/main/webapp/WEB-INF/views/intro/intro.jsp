<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>intro 페이지 입니다. </h1>

<sec:authorize access="isAnonymous()">
	<a href="/customLogin">로그인</a>	
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
<form id="logout-form" action=/customLogout method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</sec:authorize>
</body>
</html>