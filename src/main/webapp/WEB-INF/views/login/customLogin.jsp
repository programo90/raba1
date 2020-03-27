<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 페이지 ! </title>
<link rel="stylesheet" href="./resources/css/mypage/style.css">
</head>
<body>
	<h1 class="text-2xl"> 환영합니다! </h1>
	<h2> <c:out value="${error}"/> </h2>
	<h2> <c:out value="${logout}"/> </h2>

	
	<form method="post" action="/login">
		<div class="custom__login-username hidden">
			<input type="text" name="username" value="${id}">
		</div>
		<div class="custom__login-pwd hidden">
			<input type="text" name="password" value="host">
		</div>
		<div class="w-4 h-2">
			<input type="submit" value="홈으로">
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</body>
</html>