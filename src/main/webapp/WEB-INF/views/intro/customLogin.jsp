<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 페이지 ! </title>
<link rel="stylesheet" href="./resources/css/mypage/style.css">
<!--  로딩중css -->
	<style type="text/css">
		/*-------------------------------------------
    $ Main
-------------------------------------------*/

html,
body {
    padding: 0;
    margin: 0;
}

html,
body,
input,
button,
textarea {
    font: 100%/1.4 "Source Sans Pro", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.wrapper {
    min-width: 290px;
    max-width: 800px;
    padding-left: 1em;
    padding-right: 1em;
    margin-left: auto;
    margin-right: auto;
}

.text-giga { line-height: 1; font-size: 24px; font-weight: 300; }
.pad-top    { padding-top: 1em; }
.space-out { margin: 100px; }


/*-------------------------------------------
    $ Loaders
-------------------------------------------*/

.loader {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin: 3em;
    display: inline-block;
    position: relative;
    vertical-align: middle;
}
.loader,
.loader:before,
.loader:after {
    animation: 1s infinite ease-in-out;
}
.loader:before,
.loader:after {
    width: 100%; 
    height: 100%;
    border-radius: 50%;
    position: absolute;
    top: 0;
    left: 0;
}

.loader-black { background-color: #333; }

.loader-1 { animation-name: loader1; }
@keyframes loader1 {
    from { transform: scale(0); opacity: 1; }
    to   { transform: scale(1); opacity: 0; }
}



/* Loader 9 & 10 */

.loader-9,
.loader-10 {
    background-color: white;
    animation: loader9 0.4s infinite linear;
}
.loader-10 {
    animation: loader10 60s infinite ease-in-out;
}
    .loader-9:before,
    .loader-10:before {
        content: '';
        width: 80%;
        height: 80%;
        background-color: white;
        top: 10%;
        left: 10%;
        box-shadow: 5px -3px 0 rgba(255,100,100,0.7),
                    5px 5px 0 rgba(100,255,100,0.7),
                    -3px 5px 0 rgba(100,100,255,0.7),
                    -5px -5px 0 rgba(240,240,120,0.7);
    }
    .loader-9:after,
    .loader-10:after {
        content: '';
        border: 3px solid white;
        z-index: 2;
        top: -3px;
        left: -3px;
    }

    @keyframes loader9 {
        0%   { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    @keyframes loader10 {
        0%   { transform: rotate(0deg); }
        100% { transform: rotate(360000deg); }
    }	
	</style>
<!--  END로딩중css -->
</head>
<body>

	<script>
		window.onload = function(){
			document.getElementById('loginSubmit').submit();
		}
	</script>
	
	<!-- 로딩중html -->
		<div class="flex justify-center">
			<div class="loader loader-9"></div>
		</div>
	<!-- END 로딩중html -->
	
	
	<form method="post" id="loginSubmit" action="/login">
		<div class="custom__login-username hidden">
			<input type="text" name="username" value="${id}">
		</div>
		<div class="custom__login-pwd hidden">
			<input type="text" name="password" value="host">
		</div>
		<div class="w-4 h-2 hidden">
			<input type="submit" id="loginSubmit" value="홈으로">
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	
</body>
</html>