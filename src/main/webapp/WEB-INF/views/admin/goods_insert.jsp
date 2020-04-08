<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<sec:csrfMetaTags />
<link rel="stylesheet" href="/resources/css/goods/ins_goods.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(e){
	document.getElementsByClassName('adminnav')[4].style.backgroundColor="#e8e8e8";	
	
	$("input[type='button']").on('click',function(e){
		
		/* e.preventDefault(); */
		
		/* check value */
		var state = 0;
		
		console.log($("#p_name").val());
		if($("#p_name").val()== ""){
			
			alert("상품명을 입력해주세요");
			state =1;
			return ;
		}
		if($("#p_price").val() == ""){
			
			alert("상품 가격을 입력해주세요")
			state =1;
			return ;
		}
		
		if($("#free").checked == false && $("#small").checked == false && $("#medium").checked == false && $("#large").checked == false && $("#xlarge").checked == false){
			
			alert("상품 사이즈를 확인 해주세요")
			state = 1;
			return ;
		}
		
		if(state==0){
			
			console.log("submit clicked");
			
			var formObj = $("#goods_insert_form");
			
			var str ="";
			
			$(".uploadResult div").each(function(i, obj){
				
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				
			});
			
			formObj.append(str).submit();
			
			
		}
		
	});
	

	
	/* start 파일의 확장자와 크기를 설정하고 이를 검사  */
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //보안상의 문제가 있음 (개발보안가이드 참조)
	var maxSize = 5245880; //5mb
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
			
		}
		
		return true;
	}
	
	$("input[type='file']").change(function(e){
		
		console.log("111111");
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		//add filedata to formdata
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name,files[i].size) ){
				
				return false; // 확장자, 크기 확인 
			}
			
			formData.append("uploadFile",files[i]);
			
		}
		
		console.log("ajax!!!!");
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			beforeSend : function(xhr)
              {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             	},
			success : function(result){
				
				console.log(result);
				
				showUploadResult(result); //업로드 결과 처리 함수
				
			},error : function(xhr){
				
				alert("errrrrrrrrrrrrrror");
			}
			
		}); //$.ajax

		
	}); //change
	
function showUploadResult(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){ return;}
		
		var uploadUL = $(".uploadResult");
		
		var str = "";
		
		$(uploadResultArr).each(function(i,obj){
			
			if(obj.image){
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				str += "<div ";
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
				str += "<img src='/display?fileName=" + fileCallPath + "'><br>";
				str += "<button type ='button' data-file=\'"+fileCallPath+"\'data-type='image' class ='btn btn-warning btn-circle'>x</button>";
				str += "</div>";
				
			} else {
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/"); //RegExp : 확장자 설정
				
				str += "<li ";
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
				str += "<div>";
				str += "<img src='/resources/img/goods/attach.png'>";
				str += "<span>" + obj.fileName + "</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='file' class='btn btn-warning btn-circle'></button><br>";
				str += "</div></li>";
				
			}
			
		});
		
		uploadUL.append(str);
		
	} //show uploadresult
	
	$(".uploadResult").on('click','button',function(e){
		
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("div"); // li - >div
		
		$.ajax({
			
			url : '/deleteFile'
			,data : {fileName : targetFile, type : type }
			,dataType : 'text'
			,type : 'POST'
			,beforeSend : function(xhr)
	         {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	             	}
			,success : function(result){
				alert(result);
				
				targetLi.remove();
			}
			
		}); //$.ajax
		
	});
	
});
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
			<div class="ins_wrap">
				<form action="/ins_goods_result" method="post" id="goods_insert_form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="img_wrap">
						<span>상품 사진</span>
						<div class="upload_div">
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>
							<div class="upload_inner_div">
								<div class="uploadResult">
									<!-- <ul id="uploadResult_ul">

									</ul> -->
								</div>

								<div class="bigPictureWrapper">
									<div class="bigPicture"></div>
								</div>
							</div>
							<!-- <button id="uploadBtn">Upload</button> -->
							<!-- 등록 버튼과 병합할 여지가 있음-->
						</div>
							<div class="p_np">
							<ul>
								<li><label for="p_name">상품 명</label> <input type="text" name="p_name" id="p_name"></li>
								<li><label for="p_price">상품 가격</label><input type="text" name="p_price" id="p_price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/> </li>
								<!-- <input type="text" name="p_price" id="p_price" onkeypress="inNumber();" > -->
							</ul>
							</div>
							<span>사이즈 및 재고</span>
							<div class="p_ss">
							<ul>
								<li><label for="free">F</label> <input type="checkbox" value="FREE" id="free" name="free"> <input type="number" name="f_no" min="0" max="100" value="0"></li>
								<li><label for="small">S</label> <input type="checkbox" value="SMALL" id="small" name="small"> <input type="number" name="s_no" min="0" max="100" value="0"></li>
								<li><label for="large">M</label> <input type="checkbox" value="MEDIUM" id="medium" name="medium"> <input type="number" name="m_no" min="0" max="100" value="0"></li>
								<li><label for="large">L</label> <input type="checkbox" value="LARGE" id="large" name="large"> <input type="number" name="l_no" min="0" max="100" value="0"></li>
								<li><label for="xlarge">XL</label> <input type="checkbox" value="XLARGE" id="xlarge" name="xlarge"> <input type="number" name="xl_no" min="0" max="100" value="0"></li>
							</ul>
							</div>
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
								<div class="p_submit">
									<input type="button" value="등록">
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
