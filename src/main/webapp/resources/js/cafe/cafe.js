$(document).ready(function(){
	
    $('.cafe_tab').on('click', function(){
        $(this).addClass('cafe_tab_select');
        $(this).siblings().removeClass('cafe_tab_select');
    });
    /* cafe페이지 이동 */
    $('#drinkPage').on('click', function(){
    	location.href="/cafe";
    });
    /* bakery페이지 이동 */
    $('#bakeryPage').on('click', function(){
    	location.href="/cafebakery";
    });
    /* nutrition 페이지 이동*/
    $('#nutritionPage').on('click', function(){
    	location.href="/cafe_nutrtion";
    });
    //cafe_nutrition 페이지 이동
/*    $('#nutirtionPage').click(function(){
    	//방법1
    	$.ajax({
    		type:"GET",
    		url:"/cafe_nutrtion",
    		beforeSend:function(xmlHttpRequest){
    		},
    		success:function(msg){
    			location.href="/cafe_nutrtion"
    		}
    	});
    	//방법2 쌓이는 문제점
    	$("#myInfo").load("/cafe_nutrtion");
    	$("#myInfo").load("/cafe_nutrtion", function(){
            alert("success");
        });

    });*/
    
    $('.product_kind_btn').click(function(){
        $('.cafe_category_checkbox').toggle();
    });
    //detail 페이지 이동
    $('.cafe_product_inner').on('click', function(){
    	let cafeno=$(this).children().eq(0).val();
    	console.log(cafeno);
    	location.href="cafedetail/"+cafeno;
    });
});

function tempf() {
	var sel_checkbox = document.getElementsByName('cafepro');
	var selall = 0;
	
	for(var i=0; i< sel_checkbox.length;i++) {
		if(sel_checkbox[i].checked) {
			if(sel_checkbox[i].value == 'checkall') {
				selall = 1;
				break;
			}
			document.getElementById(sel_checkbox[i].value).style.display = "block";
		} else {
			document.getElementById(sel_checkbox[i].value).style.display = "none";
		}
	}
	
	if(selall ==1) {
		for(var i=0;i<sel_checkbox.length;i++) {
			document.getElementById(sel_checkbox[i].value).style.display = "block";
		}
	}
}


