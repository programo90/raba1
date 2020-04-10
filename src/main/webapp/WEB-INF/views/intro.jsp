<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/logo.png">
<title>B.A. Cycle Stop</title>
<link rel="stylesheet" href="/resources/css/mypage/style.css">
<style>
.bg__pattern-overlay { 
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
    opacity: 0.8;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAYAAACp8Z5+AAAAG0lEQVQYV2NkYGD4z8DAwMgABXAGNgGwSgwVAFbmAgXQdISfAAAAAElFTkSuQmCC);
    z-index: -1;
}

  
  .vimeo-wrapper {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -2;
    pointer-events: none;
    overflow: hidden;
 }
 
 
 .vimeo-wrapper iframe {
    width: 100vw;
    height: 56.25vw;
    min-height: 100vh;
    min-width: 240.77vh; 
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
 }
 
 .vimeo-wrapper video {
    width: 100vw;
    height: 56.25vw;
    min-height: 100vh;
    min-width: 240.77vh; 
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
 }
</style>
</head>
<body> 
    <div class="w-screen h-screen flex justify-center  ">

        <div class="self-center flex-1   mb-4">
            <div class="content-center mx-auto"></div>
            <img src="/resources/img/intro/ba_logo.png" class="pt-4 w-12 mx-auto pb-8" alt="logo">
            <a href="/repair">
                <img src="/resources/img/intro/t-1.png" class="w-40 mx-auto" alt="logo">
            </a>
            <a href="/tourlist">
                <img src="/resources/img/intro/t-2.png" class="w-40 mx-auto" alt="logo">
            </a>
            <a href="/goods_list">
                <img src="/resources/img/intro/t-3.png" class="w-40 mx-auto" alt="logo">
            </a>
            <a href="/gallery">
                <img src="/resources/img/intro/t-4.png" class="w-40 mx-auto" alt="logo">
            </a>
            <img src="/resources/img/intro/ba_font.png" class="py-16 w-24 mx-auto" alt="logo">
            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
				<a href="/admin">
	                <img src="/resources/img/intro/admin.png" class="w-40 mx-auto" alt="logo">
	            </a>
            </sec:authorize>
        </div>
       
    </div>
    
     <div class="bg__pattern-overlay"></div>
    <!-- <div class="vimeo-wrapper w-screen h-full">
        <iframe src="https://player.vimeo.com/video/41097482?background=1&autoplay=1&loop=1&byline=0&title=0"
                frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
     </div> -->

     
        <div class="vimeo-wrapper w-screen">
            <video autoplay muted loop >
                <source src="/resources/video/intro(raba).mp4" type="video/mp4">
            </video>
        </div>

</body>
</html>