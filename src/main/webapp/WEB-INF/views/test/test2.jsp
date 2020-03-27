<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:if test="${id eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=bffed4bc4d4a39e24324342a77147ade&redirect_uri=http://localhost:8080/login&response_type=code">
            <img src="resources/img/kakao_login_btn.png">
        </a>
        ${id }
    </c:if>
    <c:if test="${id ne null}">
        <h1>로그인 성공입니다</h1>
        ${id }
        <input type="button" value="로그아웃" onclick="location.href='login/logout'">
    </c:if>
</body>
</html>