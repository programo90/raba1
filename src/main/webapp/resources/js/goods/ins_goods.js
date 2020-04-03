
$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	$("input[type='submit']").on('click',function(e){
		
		e.preventDefault();
		
		console.log("submit clicked");
		
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
				
				console.log("result??");
				
				//showUploadResult(result); //업로드 결과 처리 함수
				
			},error : function(xhr){
				
				alert("errrrrrrrrrrrrrror");
			}
			
		}); //$.ajax

		
	}); //change
	
});