<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<h1>admin</h1>
<sec:authorize access="isAuthenticated()">
<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
<form id="logout-form" action=/customLogout method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</sec:authorize>

<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member"/></p>

</body>
</html>