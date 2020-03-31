<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<sec:csrfMetaTags />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
			
			$(document).ready(function(){
				
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
				
				/* end 파일의 확장자와 크기를 설정하고 이를 검사  */
				
				// 업로드 이후 초기화를 위한 클론 생성
				var cloneObj = $(".uploadDiv").clone();
				
				$("#uploadBtn").on("click",function(e){
					
					var formData = new FormData();
					
					var inputFile = $("input[name='uploadFile']");
					
					var files = inputFile[0].files;
					
					console.log(files);
					
					//add filedate to formdata
					for(var i = 0; i < files.length; i++){
						
						if(!checkExtension(files[i].name,files[i].size) ){
							
							return false; // 확장자, 크기 확인 
						}
						
						formData.append("uploadFile",files[i]);
						
					}
					
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
							
							showUploadedFile(result);
							
							// 업로드 이후 초기화 (미리 만들어 놓은 클론)
							$(".uploadDiv").html(cloneObj.html());
							
						}
						
					}); //ajax
					
					
					var uploadResult = $(".uploadResult ul");
					//json data를 받아서 해당파일의 이름을 추가하는 기능
					function showUploadedFile(uploadResultArr) {
						
						var str = "";
						
						$(uploadResultArr).each(function(i,obj){
							
							str += "<li>" + obj.fileName + "</li>";
						});
						
						uploadResult.append(str);
					}
					
					
				});
			});
</script>
</head>
<body>
	<h1>upload with ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<!-- 업로드할 썸내일 출력 -->
	<div class="uploadResult">
		<ul>
		
		</ul>
	</div>
	
	<button id="uploadBtn">upload</button>
	
	
</body>
</html>