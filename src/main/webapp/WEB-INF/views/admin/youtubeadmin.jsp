<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/youtube/youtube.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/resources/js/youtube/youtube.js"></script>
</head>
<body>
	<div class="admincontents">
		<div class="admin_userbox">
			관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
		</div>
		<section class="admin_sectionbox">
			<!-- 여기서 div만들고 시작하세요 -->
			<div class="admin_youtubebox">
				<div class="admin_youtube_addbox">
					<p class="admin_youtube_title">YOUTUBE 추가</p>
					<form action="youtubeinsert" method="post" >
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<ul>
							
							<li class="admin_youtubeli">
								<label for="youtubetitleAdd"class="admin_youtubelabel">제목</label> 
								<input type="text" name="youtubetitle" id="youtubetitleAdd" class="admin_youtube_input"
								placeholder="youtube 제목을 입력하세요" maxlength="24" required="required">
							</li>
							<li class="admin_youtubeli">
								<label for="youtubeAdd"class="admin_youtubelabel">주소</label> 
								<input type="text" name="youtubeurl" id="youtubeAdd" class="admin_youtube_input"
								placeholder="youtube 주소 뒷부분만 입력하세요" required="required">
							</li>
							<li class="">
								<input type="submit" value="등록" class="admin_btn_big subminbtn">
							</li>
						</ul>
					</form>
				</div>
				<div class="admin_youtube_modifybox">
					<p class="admin_youtube_title">YOUTUBE 리스트</p>
					<ul>
						<c:forEach var="adminlist" items="${adminlist}">
							<li class="adminlistli">
								<p class="no">${adminlist.youtubeno}</p>
								<p class="admin_youtubetitle">${adminlist.youtubetitle}</p>
								<p>
									<iframe width="200" height="140"
					                     src="https://www.youtube.com/embed/${adminlist.youtubeurl}" frameborder="0"
					                     allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					                     allowfullscreen>
				                     </iframe>
	                     		</p>
								<p class="admin_youtube_url">https://www.youtube.com/embed/</p>
								<p class="youtubeUrl admin_youtube_url">${adminlist.youtubeurl}</p>
								<p class="admin_youtube_smalltxt">${adminlist.youtubedate}</p>
								<div class="btnedit">
									<input type="button" value="수정" class="btnModify admin_btn subminbtn">
								</div>
								<input type="button" value="삭제" class="btnDelete admin_btn">
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
	</div>
</body>
</html>