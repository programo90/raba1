<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 이용 가능 화면</title>
</head>
<body>
<h1>all</h1> 

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