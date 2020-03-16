<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<body>
<h1>장바구니 페이지입니다</h1>
<sec:authorize access="isAuthenticated()">
<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
<form id="logout-form" action=/customLogout method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</sec:authorize>

<p>principal : <sec:authentication property="principal"/></p>
<p>login__MemberVO : <sec:authentication property="principal.member"/></p>

<p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
<p>password : <sec:authentication property="principal.member.password"/></p>
<p>가입일 : <sec:authentication property="principal.member.joindate"/></p>
<p>전화 번호 : <sec:authentication property="principal.member.phone"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
</body>
</html>