$(document).ready(function () {
    $('.cafe_tab').each(function () {
        $(this).click(function () {
            $(this).addClass('cafe_tabelected');
            $(this).addClass('active');
            $(this).siblings().removeClass('cafe_tabelected');
        });
    });
    /* 카페 목록페이지*/
    $('#cafeadmin').on('click', function(){
    	location.href="/cafeadmin";
    });
    /* 카페 새 상품 등록페이지*/
    $('#cafeinsert').on('click', function(){
    	location.href="/cafeadmininsert";
    });
    /* 관리자 _ 목록에서 수정 버튼 클릭시 */
    $('.cafeaModify').on('click', function(){
    	let cafemodifyno=$(this).parent().siblings().eq(0).val();
    	console.log("카페번호: ", cafemodifyno);
    	location.href="modify/"+cafemodifyno;
    });
    /* 관리자 _ 취소 버튼 클릭시 */
    $('#backbtn').on('click', function(){
    	location.href="/cafeadmin";
    });
    /* 이미지 파일 미리보기 */
    $("#file1").on("change", handleImgFileSelect);
    $("#file2").on("change", handleImg2FileSelect);
    
});
/* 탭 선택 */
//function acyncMovePage(url){
//    // ajax option
//    var ajaxOption = {
//            url : url,
//            async : true,
//            type : "POST",
//            dataType : "html",
//            cache : false
//    };
//    
//    $.ajax(ajaxOption).done(function(data){
//        // Contents 영역 삭제
//        $('#cafeadminPage').children().remove();
//        // Contents 영역 교체
//        $('#cafeadminPage').html(data);
//    });
//}


/* 분류 선택 */
function tabChange(e) {
	var drink = ["콜드 브루 커피", "브루드 커피", "에스프레소", "프라푸치노", "블렌디드", "티", "기타 제조 음료"];
	var bakery = ["베이커리", "케이크", "샌드위치&샐러드", "따뜻한 푸드", "아이스크림"];
	var target = document.getElementById("cafeCategory");

	if(e.value == "DRINK") var tab = drink;
	else if(e.value == "BAKERY") var tab = bakery;

	target.options.length = 0;

	for (x in tab) {
		var opt = document.createElement("option");
		opt.value = tab[x];
		opt.innerHTML = tab[x];
		target.appendChild(opt);
	}	
}


/* 이미지 파일 미리보기 */
var sel_file;
function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if (!f.type.match("image.*")) {
            alert("JPG, PNG의 파일만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}function handleImg2FileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if (!f.type.match("image.*")) {
            alert("JPG, PNG의 파일만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img2").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}
