<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<sec:csrfMetaTags />
<link rel="stylesheet" href="/resources/css/goods/ins_goods.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/resources/js/goods/ins_goods.js"></script>
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
			<div class="ins_wrap">
				<form action="/ins_goods_result" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="img_wrap">
						<span>상품 사진</span>
						<div class="upload_div">
							<div class="uploadDiv">
								<!-- <input type="file" name="uploadFile" multiple> -->
							</div>
							<div class="upload_inner_div">
								<div class="uploadResult">
									<ul id="uploadResult_ul">

									</ul>
								</div>

								<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
								</div>
							</div>
							<button id="uploadBtn">Upload</button>
							<!-- 등록 버튼과 병합할 여지가 있음-->
						</div>
							<div class="p_np">
							<ul>
								<li><label for="p_name">상품 명</label> <input type="text" name="p_name" id="p_name"></li>
								<li><label for="p_price">상품 가격</label> <input type="text" name="p_price" id="p_price" onkeypress="inNumber();" /></li>
								 <!--<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-->
							</ul>
							</div>
							<span>사이즈 및 재고</span>
							<div class="p_ss">
							<ul>
								<li><label for="free">F</label> <input type="checkbox" value="f" id="free" name="free"> <input type="number" name="f_no" min="0" max="100" value="0"></li>
								<li><label for="small">S</label> <input type="checkbox" value="s" id="small" name="small"> <input type="number" name="s_no" min="0" max="100" value="0"></li>
								<li><label for="large">M</label> <input type="checkbox" value="m" id="medium" name="medium"> <input type="number" name="m_no" min="0" max="100" value="0"></li>
								<li><label for="large">L</label> <input type="checkbox" value="l" id="large" name="large"> <input type="number" name="l_no" min="0" max="100" value="0"></li>
								<li><label for="xlarge">XL</label> <input type="checkbox" value="xl" id="xlarge" name="xlarge"> <input type="number" name="xl_no" min="0" max="100" value="0"></li>
							</ul>
							</div>
							<ul>
							<li>
								<span><label for="state">상태</label></span>
								<select name="p_state" id="state">
										<option value="0">판매</option>
										<option value="1">일시 중지</option>
								</select>
							</li>
							<li>
								<div class="p_submit">
									<input type="submit" value="등록">
									<!-- <button type="submit">등록</button> -->
								</div>
							</li>
							</ul>
					</div>
				</form>
			</div>

			</section>
		</div>
	</div>
</body>
</html>
