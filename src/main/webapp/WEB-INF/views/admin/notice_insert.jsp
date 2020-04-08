<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>B.A. Admin Notice-Insert</title>
<link rel="stylesheet" href="/resources/css/info/n_insert.css">
<script >
document.getElementsByClassName('adminnav')[4].style.backgroundColor="#e8e8e8";
</script>
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
			<form action="ins_ntc" method="post" class="brd_form">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<ul>
					<label for="">공지사항 등록</label>
					<li><input type="text" name="ntctitle" id="n_title" placeholder=" 제목을 입력하세요"></li>
					<li><textarea name="ntccontent" id="n_content" cols="50" rows="5" wrap="hard" placeholder="내용을 입력하세요"></textarea></li>
					<li>
					<input type="submit" value="등 록" class="submit_btn">
					</li>
				</ul>
			</form>
			</section>
		</div>
	</div>
</body>
</html>