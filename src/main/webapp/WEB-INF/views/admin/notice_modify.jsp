<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/info/n_modify.css">
</head>
<body>
	<div class="adminwrap">
		<!-- header 부분은 나중에 따로 떼어야하는 부분임!!!-->
		<!--header end-->
		<div class="admincontents">
			<div class="admin_userbox">
				관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
			</div>
			<section class="admin_sectionbox">
			<form action="../mdf_ntc" method="post" class="brd_form">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name="ntcno" value="${dto.ntcno}" >
			<input type="hidden" name="ntcdate" value="${dto.ntcdate}" >
				<ul>
					<label for="">공지사항 수정</label>
					<li><input type="text" name="ntctitle" id="n_title" placeholder="${dto.ntctitle }"></li>
					<li><textarea name="ntccontent" id="n_content" cols="50" rows="5" placeholder="${dto.ntccontent }"></textarea></li>
					<li>
					<input type="submit" value="수 정" class="submit_btn">
					</li>
				</ul>
			</form>
			</section>
		</div>
	</div>
</body>
</html>