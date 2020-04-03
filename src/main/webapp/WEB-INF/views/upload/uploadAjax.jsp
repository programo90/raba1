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
<link rel="stylesheet" href="/resources/css/upload/uploadAjax.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
			function showImage(fileCallPath){
				
				//alert(fileCallPath);
				
				$(".bigPictureWrapper").css("display","flex").show();
				
				$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
				.animate({width:'100%', height: '100%'},1000);
				
			}
			
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
					
					//add filedata to formdata
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
							
							if(!obj.image){
								
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
								
								var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/"); //RegExp : 확장자 설정
								
								str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"
										+"<img src ='/resources/img/goods/attach.png'>" + obj.fileName +"</a>"+
										"<span data-file=\'"+fileCallPath + "\'data-type='file>' x </span>"+"</div></li>" ;
										
								console.log("fileCallPath :" + fileCallPath + " _____in uploadAjax.jsp");
							} else {
								
								//str += "<li>" + obj.fileName + "</li>";
								
								console.log("obj : "+ obj);
								console.log("obj.uploadPath :" + obj.uploadPath);
								console.log("obj.fileName : " + obj.fileName);
								
								var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
								
								var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
								
								originPath = originPath.replace(new RegExp(/\\/g),"/");
								
								console.log("fileCallPath : " + fileCallPath);
								
								//get 방식으로 첨부파일을 사용할 때에는 파일이름에 포함된 공백문자나 한글 이름이 문제가 될 수 있습니다. 
								//이를 수정하기 위해 encodeURIComponent()를이용해서 적합한 인코딩 처리를 해야합니다.
								str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"
									+"<img src='/display?fileName=" + fileCallPath +"'></a>"
									+"<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span></li>";
							}
						});
						
						uploadResult.append(str);
					} //function showuploadfile
					
					$(".bigPictureWrapper").on("click",function(e){
						
						$(".bigPicture").animate({width:'0%', height:'0%'},1000);
						setTimeout(function(){
							
							$('.bigPictureWrapper').hide();
						
						},1000);
					});//bigpictuerwarpper on click
					
				}); //uploadbtn on 
				
				$(".uploadResult").on("click","span",function(e){
					
					var targetFile = $(this).data("file");
					var type = $(this).data("type");
					console.log(targetFile);
					
					$.ajax({
						url : '/deleteFile'
						,data : {fileName: targetFile, type: type}
						,dataType : 'text'
						,type : 'POST'
						,beforeSend : function(xhr)
		                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		                          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                     	}
						,success : function(result){
							alert(result);
							
							
						}
					});// $a.jax
					
				});// x버튼 기능 처리
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
	
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		
		</div>
	</div>
	
</body>
</html>