<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<sec:csrfMetaTags />
<link rel="stylesheet" href="/resources/css/goods/ins_goods.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/resources/js/goods/modify_goods.js"></script>
<script>
	$(document).ready(function(){
		
		document.getElementsByClassName('adminnav')[4].style.backgroundColor="#e8e8e8";
		
		(function(){
			
			var pno = '<c:out value="${dto.p_no}"/>';
			
			$.getJSON("/getAttachList", {pno : pno*1}, function(arr){
				
				console.log(arr);
				
				var str ="";
				
				$(arr).each(function(i,attach){
					
					//imagetype
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" +attach.fileName);
						
						str += "<div data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						
						
					}else{
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						
						str += "<span>"+ attach.fileName+"</span><br>"; //지울 예정
						str += "<img src='/resources/img/goods/attach.png'>";
						str += "</div>";
						str += "</li>";
					}
					
				});
				
				$(".uploadResult").html(str);
				
			});// end getjson
			
		})(); //end function
		
		
	});
</script>
<!-- <script src="/resources/js/goods/ins_goods.js"></script> -->
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
				<form action="/modify_goods_result" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="img_wrap">
						<span>상품 사진</span>
						<div class="upload_div">
							<div class="uploadDiv">
								<!-- <input type="file" name="uploadFile" multiple> -->
							</div>
							<div class="upload_inner_div">
								<div class="uploadResult">
									
								</div>
							</div>
							<!-- <button id="uploadBtn">Upload</button> -->
							<!-- 등록 버튼과 병합할 여지가 있음-->
						</div>
							<div class="p_np">
								<ul>
									<li><label for="p_name">상품 명</label> <input type="text" name="p_name" id="p_name" placeholder="${dto.p_name }" value="${dto.p_name }"></li>
									<li><label for="p_price">상품 가격</label> <input type="text" name="p_price" id="p_price" placeholder="${dto.p_price}" onkeypress="inNumber();" value="${dto.p_price}"/></li>
								</ul>
								 <!--<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>-->
							</div>
							
							<span>사이즈 및 재고</span>
							<div class="p_ss">
								<ul>
									<li><label for="free">F</label> <input class="sizecheckbox" type="checkbox" value="FREE" id="free" name="free" disabled> <input type="number" name="f_no" min="0" max="100" value="0" disabled></li>
									<li><label for="small">S</label> <input class="sizecheckbox" type="checkbox" value="SMALL" id="small" name="small" disabled> <input type="number" name="s_no" min="0" max="100" value="0" disabled></li>
									<li><label for="large">M</label> <input class="sizecheckbox" type="checkbox" value="MEDIUM" id="medium" name="medium" disabled> <input type="number" name="m_no" min="0" max="100" value="0" disabled></li>
									<li><label for="large">L</label> <input class="sizecheckbox" type="checkbox" value="LARGE" id="large" name="large" disabled> <input type="number" name="l_no" min="0" max="100" value="0" disabled></li>
									<li><label for="xlarge">XL</label> <input class="sizecheckbox" type="checkbox" value="XLARGE" id="xlarge" name="xlarge" disabled> <input type="number" name="xl_no" min="0" max="100" value="0" disabled></li>
								</ul>
							</div>
							<!-- el의 값을 script문 (dom 객체를 위한 언어)으로는 인식하지 못하기 때문에 값을 넘기기 위해서 hidden 처리한다.-->
							<input type="hidden" value="${dto.p_no }" name="p_no" >
							<input type="hidden" value="${dto.p_size}" id="getsize">
							<input type="hidden" value="${dto.p_amount}" id="getamount">
							<input type="hidden" value="${dto.p_state }" id="getstate">
							<ul>
								<li>
									<span><label for="state">상태</label></span>
									<select name="p_state" id="state">
											<option value="0">판매</option>
											<option value="1">일시 중지</option>
											<option value="2">품절</option>
									</select>
								</li>
								<li>
									<div class="p_submit_modify">
										<input type="submit" value="수정">
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