$(document).ready(function(){
	
    $('.cafe_tab').on('click', function(){
        console.log("test");
        $(this).addClass('cafe_tab_select');
        $(this).siblings().removeClass('cafe_tab_select');
    })
    
    $('.product_kind_btn').click(function(){
        $('.cafe_category_checkbox').toggle();
  });
});

/*function tapClick(search){
    // ajax option
	$.ajax({
		data:search
		,dataType:'json'
		,url:cafe
		,type:post
		,success:function(data){
			
			var result ='';
			result+= '';
			
			$('#temp').html(result);
			
		}
		,error:function(data){
			
		}
		
	})
    var ajaxOption = {
            url : cafe,
            async : true,
            type : "POST",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        // Contents 영역 삭제
        $('#cafePage').children().remove();
        // Contents 영역 교체
        $('#myInfo').html(data);
    });
}*/
//var menuClick = function(url){
//
//	if(url == '/'){
//		location.reload(true);
//		return;
//	}
//	$.ajax({
//		type: 'POST',
//		url: url,
//		async:false,
//		data: "",
//		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
//		success: function(data) {
//
//			$('#myInfo').html(data);
//			/*if(isMenuHide) menuOff();*/
//
//		},
//		error: function(request, status, error) {
//			alert(error);
//		}
//	});
//};



