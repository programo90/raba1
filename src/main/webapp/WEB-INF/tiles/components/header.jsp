<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BA</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="/resources/css/commMedia.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/resources/js/header.js"></script>
</head>
<body>
   	
	<header class="header">
        <div class="header_inner">
            <div class="topmenu">
                <ul>
                    <sec:authorize access="isAnonymous()">
                    	<li class="topmenuli">
            	            <a href="https://kauth.kakao.com/oauth/authorize?client_id=bffed4bc4d4a39e24324342a77147ade&redirect_uri=http://13.125.113.225:8080/login&response_type=code" ><i class="fa fa-user"></i></a>
        	            </li>
    	                <li class="topmenuli">
	                        <a href="https://kauth.kakao.com/oauth/authorize?client_id=bffed4bc4d4a39e24324342a77147ade&redirect_uri=http://13.125.113.225:8080/login&response_type=code"><i class="fa fa-shopping-basket"></i></a>
                    	</li>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=bffed4bc4d4a39e24324342a77147ade&redirect_uri=http://13.125.113.225:8080/login&response_type=code" class="headeloginbtn">Login</a>	
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property='principal.username' var="loginid"/>
						<li class="topmenuli">
        	                <a href="/mypage"><i class="fa fa-user"></i></a>
    	                </li>
	                    <li class="topmenuli">
                        	<a href="/cart_list/${loginid}"><i class="fa fa-shopping-basket"></i></a>
                    	</li>
					<a href="#" onclick="document.getElementById('logout-form').submit();" class="headeloginbtn">Logout</a>
					<form id="logout-form" action=/customLogout method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
					</sec:authorize>
					
					
                </ul>
            </div>
            <div class="logo"><a href="/"><img src="/resources/img/ba_logo.png" alt="BALOGO" class="logo_img"></a></div>
            <nav class="navbox">
                <ul class="navul">
                    <li class="navli"><a href="/story">Story</a></li>
                    <li class="navli"><a href="/cafe">Cafe</a></li>
                    <li class="navli"><a href="/youtube">Contents</a></li>
                    <li class="navli"><a href="/repair">Repair</a></li>
                    <li class="navli"><a href="/goods_list">Goods</a></li>
                    <li class="navli"><a href="/tourlist">Tour</a></li>
                    <li class="navli"><a href="/gallery">Gallery</a></li>
                    <li class="navli"><a href="/info">Info</a></li>

                </ul>
            </nav>
        </div>
        <div class="phonenavbox">
        	<p class="phone_menuIcon" onclick="openNav()">&#9776;</p>
        	<p class="phonelogo">
        		<a href="/"><img src="/resources/img/ba_logo.png" alt="BALOGO" class="logo_img"></a>
        	</p>
        	<p class="phoneuser">
        		<a href="/mypage/${userid}" class="phoneusericon"><i class="fa fa-user"></i>
        	</p>
        </div>
        <div id="myNav" class="overlay">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <div class="overlay-content">
		    <a href="/story">Story</a>
		    <a href="/cafe">Cafe</a>
		    <a href="/youtube">Contents</a>
		    <a href="/repair">Repair</a>
		    <a href="/goods_list">Goods</a>
		    <a href="/tourlist">Tour</a>
		    <a href="/gallery">Gallery</a>
		    <a href="/info">Info</a>
		  </div>
		</div>
    </header>
    
</body>
</html>