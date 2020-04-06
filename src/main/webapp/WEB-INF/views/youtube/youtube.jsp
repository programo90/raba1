<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="/resources/css/youtube/youtube.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="banner">
        <!-- 각페이지 top banner -->
        <div class="banner_inner"></div>
    </div>
    <div class="contents">
        <h2 class="contents_title">YOUTUBE</h2>
        <section class="youtube">
            <div class="youtube_boxinner">
                <h3 class="youtube_subtit">맞춤 동영상</h3>
                <div class="youtube_inner">
                <c:forEach var="list" items="${list}">
                    <div class="youtubebox">
                    	<iframe width="380" height="240"
		                     src="https://www.youtube.com/embed/${list.youtubeurl}" frameborder="0"
		                     allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		                     allowfullscreen>
	                     </iframe>
	                     <p class="youtube_title">${list.youtubetitle}</p>
                    </div>
                 </c:forEach>
                </div>
            </div>
            <!-- <div class="youtube_boxinner">
                <h3 class="youtube_subtit">추천 동영상</h3>
                <div class="youtube_inner">
                    <div class="youtubebox"></div>
                    <div class="youtubebox"></div>
                    <div class="youtubebox"></div>
                </div>
            </div> -->
        </section>
    </div>
    <!-- contents 끝 -->
</body>
</html>