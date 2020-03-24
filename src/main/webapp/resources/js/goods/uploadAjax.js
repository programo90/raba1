/**
 * 
 */

	//숫자만 입력받기 위한 script (#p_price)
	function inNumber(){ if(event.keyCode<48 || event.keyCode>57){ event.returnValue=false; } }

	$.ajaxSetup({
	
	       beforeSend: function(xhr) {
	
	    	xhr.setRequestHeader(header, token);
	
	      }
	
	});

	$(document).ready(function(e){
		
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click",function(e){
			
			e.preventDefault();
			
			console.log("submit clicked");
		});
		
	});
	
	
	
	$(document).ready(function(){
		
		var token = $("meta[name='_csrf']").attr("content");
		
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var cloneObj = $(".uploadDiv").clone();
		
		$("#uploadBtn").on("click",function(e){
			
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			console.log(files);
			
			
			
			//add filedate to formdata
			for(var i = 0; i < files.length; i++){
				
				 if(!checkExtension(files[i].name, files[i].size)){
					
					return false;
				} 
				
				formData.append("uploadFile",files[i]);
			}
				
			$.ajax({
				
				url: '/uploadAjaxAction'
				, processData : false
				, contentType : false
				, data : JSON.stringify(formData)
				, type : 'GET'
				, dataType : 'json'
				, beforeSend: function(xhr) {
					
			    	xhr.setRequestHeader(header, token);
			
			      }
				, success : function(result){
					
					console.log(result);
					
					showUploadedFile(result);
					
					alert("Uploaded");
					
					$(".uploadDiv").html(cloneObj.html());
					
				}
			});//$.ajax
			
		}); //click
		
		$(".bigPictureWrapper").on("click",function(e){
			
			$(".bigPicture").animate({width : '0%', height : '0%'}, 1000);
			setTimeout(function(){
				$(".bigPictureWrapper").hide();
			}, 1000);
			}); //확대된 이미지 축소

		
		$(".uploadResult").on("click","span",function(e){
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log('targetfile' + targetFile);
			
			$.ajax({
				
				url : '/deleteFile',
				data : {fileName : targetFile, type:type},
				dataType : 'text',
				type : 'POST',
				success : function(result){
						alert(result);
					}
			});//$.ajax
		}); //uploadresult click 
		
	}); //ready
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5mb
	
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
	
	var uploadResult = $("#testasdf");
	
		function showUploadedFile(uploadResultArr){
			var str ="";
			
			$(uploadResultArr).each(function(i, obj){
				
				if(!obj.image){
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" +obj.fileName);
					
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					
					str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" + 
							"<img src='/resources/img/goods/attach.png'>" + obj.fileName + "</a>" + 
							"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>" + 
							"</div></li>";
					
				}else{
				
					//str += "<li>" + obj.fileName + "</li>";
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					
					var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					
					str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\">" + 
					"<img src='/display?fileName="+fileCallPath+"'></a>" +
					"<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
					"</li>";  
					
				}
				
			});
			
			console.log(str);
			
			$('#uploadResult_ul').html(str);
		}
		
		function showImage(fileCallPath){
			//alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath)+"'>").animate({width:'100%',height : '100%'}, 1000); 
		}

