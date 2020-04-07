$(document).ready(function(){
	document.getElementsByClassName('adminnav')[2].style.backgroundColor="#e8e8e8";
	$('.admin_youtube_input').keyup(function(){ 
		if ($(this).val().length > $(this).attr('maxlength')) { 
			alert('제한 길이 초과, 총 15글자 이내로 작성해주세요'); 
			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
		} 
	}); 
	$(document).on('click', '.btnModify', function(){
		console.log("수정버튼");
		let chk = confirm("수정하시겠습니까?");
		if(chk){
			let urltext = $(this).parent().siblings().eq(4).text();
			let titletext = $(this).parent().siblings().eq(1).text();
			let modifybtn =$(this).parent('div');
			console.log("urltext: "+urltext);
			console.log("modifybtn: "+ modifybtn);
			$(this).parent().siblings().eq(4).html("<input type='text' value='"+urltext+"' class='url admin_title_input'>");
			$(this).parent().siblings().eq(1).html("<input type='text' value='"+titletext+"' class='title admin_title_input' maxlength='15'>");
			modifybtn.html("<button type='submit' class='btnmodi admin_btn subminbtn'>완료</button>");
		}
	});
	$(document).on('click', '.btnmodi' ,function(){
		console.log("완료버튼");
		let youtubeno=$(this).parent().siblings().eq(0).text();
		let urltext = $(this).parent().siblings().eq(4).val();
		let titletext = $(this).parent().siblings().eq(1).text();
		let modifybtn =$(this).parent('div');
		let newurl = $(".url").eq(0).val();
		let newtitle= $(".title").eq(0).val();
		let youtubeiframe= $(this).parent().siblings().eq(2);
		$(this).parent().siblings().eq(4).text(newurl);
		$(this).parent().siblings().eq(1).text(newtitle);
		modifybtn.html("<button type='button' class='btnModify admin_btn subminbtn'>수정</button>");
		let data = { "youtubetitle":newtitle , "youtubeurl":newurl, "youtubeno":youtubeno};
		console.log("youtubeno"+ youtubeno);
		console.log("youtubeiframe: ", youtubeiframe);
		console.log("입력된값" , data);

//		let parameterName='${_csrf.headerName}';
//		let token='${_csrf.token}';
		$.ajax({
			url:'youtubemodify'
			, dataType:"JSON"
			, data:data
//		    , method:"POST"
		    , contentType:"application/json;charset=utf-8"
//		    , beforeSend : function(xhr){
//		    	xhr.setRequestHeader(parameterName, token);
//		    }
			, success:function(data){
					console.log("여기");
					console.log(data);
					alert("수정 했습니다.");
					console.log("newurl : "+ newurl);
					youtubeiframe.html("<iframe width='200' height='140'" +
							"src='https://www.youtube.com/embed/" + newurl +
							"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; " +
							"picture-in-picture' allowfullscreen></iframe>")
			}
			, error:function(data,errcode, aaa){
				console.log('error', data);
				console.log('errcode', errcode);
				console.log('aaa', aaa);
			}
		});
	});

	$('.btnDelete').on('click', function(){
		console.log("삭제버튼");
		let youtubeno=$(this).parent().find('p').eq(0).text();
		let chk = confirm("삭제하시겠습니까?");
		if(chk){
			location.href="youtubedelete/"+youtubeno;
		}
	});
});