$(document).ready(function () {
	document.getElementsByClassName('adminnav')[1].style.backgroundColor="#e8e8e8";
    $('.cafe_tab').each(function () {
        $(this).click(function () {
            $(this).addClass('cafe_tabelected');
            $(this).siblings().removeClass('cafe_tabelected');
        });
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
    $('#delbtn').on('click', function(){
    	let cafeno=$('#cafeno').val();
    	console.log("삭제버튼클릭"+cafeno);
    	let del = confirm("삭제하시겠습니까?");
		if(del){
			location.href="/delete/"+cafeno;
		}
    });
    /* 이미지 파일 미리보기 */
    $("#file1").on("change", handleImgFileSelect);
    $("#file2").on("change", handleImg2FileSelect);
    
	
	tempsel();

	function tempsel() {
		var temps = document.getElementById("seletedpro");
		console.log("temps"+temps);
		if(temps.value == 'DRINK') {
			$("#cafeTab option:eq(1)").prop("selected", true);
			/*document.getElementById("cafeTab").options[1].seleted = true;*/
		} else {
			$("#cafeTab option:eq(2)").prop("selected", true);
			/*document.getElementById("cafeTab").options[2].seleted = true;*/
		}
		tabChange(temps);
	}
	function tempseltabChange(e){
		
	}
})

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
		
		var selcate = document.getElementById("selcategory").value;

		if(e.value == "DRINK") {
			if (selcate == "콜드 브루 커피") {
				target.options[0].selected = true;
			} else if(selcate == "브루드 커피") {
				target.options[1].selected = true;
			} else if(selcate == "에스프레소") {
				target.options[2].selected = true;
			} else if(selcate == "프라푸치노") {
				target.options[3].selected = true;
			}else if(selcate == "블렌디드") {
				target.options[4].selected = true;
			}else if(selcate == "티") {
				target.options[5].selected = true;
			}else if(selcate == "기타 제조 음료") {
				target.options[6].selected = true;
			}
		} else {
			if (selcate == "베이커리") {
				target.options[0].selected = true;
			} else if(selcate == "케이크") {
				target.options[1].selected = true;
			} else if(selcate == "샌드위치&샐러드") {
				console.log("샌드위치");
				target.options[2].selected = true;
			} else if(selcate == "따뜻한 푸드") {
				target.options[3].selected = true;
			} else if(selcate == "아이스크림") {
				target.options[3].selected = true;
			}
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