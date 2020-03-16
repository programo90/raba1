<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 페이지 ! </title>
</head>
<body>
	<h1> Custom Login page</h1>
	<h2> <c:out value="${error}"/> </h2>
	<h2> <c:out value="${logout}"/> </h2>

	
	<form method="post" action="/login">
		<div class="custom__login-username">
			<input type="text" name="username" value="admin">
		</div>
		<div class="custom__login-pwd">
			<input type="text" name="password" value="admin">
		</div>
		<div class="custom__login-submit">
			<input type="submit">
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</body>
</html>