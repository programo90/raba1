$(document).ready(function(){
	var calday = null;
	$('#calendar').fullCalendar({
		
		editable:true,
		navLinks:true,
		enetLimit:true, //이벤트 제한
		locale:'ko',	//한글버전
		events:{	//하나하나의 일정을 select해서 가져와야함	//컨트롤러에 아마도 arrayList로해야하나...?json형태로출력...
			url:'/asdf',	//컨트롤러명하고 일치
			error:function(){
				console.log("select가 안됨 에러");
			}
		},
		
		//날짜클릭시
		dayClick : function(date, jsEvent, view, info) {
			
			var date = new Date();	//현재날짜시간
			var yy = date.getFullYear();
			var mm = date.getMonth()+1;
		    var dd = date.getDate();
		    console.log("ddddd"+date);
		    
		    var tempdata = $(this).data().date;	//캘린터 클릭날짜
		    $('#caldate').val(tempdata);
		    
		    console.log('temp' + tempdata);
			calday = $(this);
			if(confirm('예약날짜 : ' + tempdata +' 에 문의글을 작성하시겠습니까?')){
				if(calday) {
					calday.css('background-color', 'white');
					$(this).css('background-color', '#3e5f40');
				} else {
					$(this).css('background-color', '#3e5f40');
				}
			}
			
		}
	});
	
//날짜이전버튼 클릭시
$("button.fc-prev-button").click(function() {
    var date = $("#calendar").fullCalendar("getDate");
    console.log("이전버튼");
});
$('.fc-day').click(function(){
	var moment = $('.callender_area').fullCalendar('getDate');
});
rereplybtn();
});

//예약 저장 버튼 클릭시
function reservsend(reservorder){
	//var userid=document.getElementById('userid').value; 이거 어떻ㄱ???
	var textbox = document.getElementById('reservationText');
	var txt = document.getElementById('reservationText').value;
	var caldate = document.getElementById('caldate').value;
	console.log("caldate"+caldate);
	var reservedata = {/*"userid":userid,*/"reservtxt":txt,"caldate":caldate,"reservorder":reservorder};
	if(caldate==""){
		alert("정비 예약 문의하고 싶은 날짜를 선택해주세요!");
	}else{
		$.ajax({
			url:'/reservationinsert'
			, data : reservedata
			, dataType : 'json'
			, contentType: "application/json;charset=utf-8"
			, success : function(data) {
					let result ='';
					$.each(data,function(index,item){
						if(item.reservlevel==0) {
							console.log("relevel--0일때");
							
								result +='<div class="repair_inquirylist">';
								result +='<div class="repair_inquirylist_txt">';
								result +='<p class="repair_inquiry_user">문의자</p>';
								result +='<p class="repair_inquiry_date">작성일 :'+item.reservwritedate+'</p>';
								result +='<p class="repair_inquiry_txt"><span class="repair_inquiry_cal">예약일자 '+item.caldate+' </span>| '+item.reservtxt+'</p>';
								result +='</div>';
								result +='<div class="repair_inquirylist_btn">';
								result +='<input type="button" value="답변" class="admin_btn">';
								result +='</div>';
								result +='</div>';
							
						}
//						else if(item.reservlevel==1) {
//						    result +='<div class="reply_box">';
//							result +='<div class="reply">';
//							result +='<p class="rereply_admin">관리자 답변 | <span class="rereply_admintxt"'+item.reservtxt+'</span></p>';
//							result +='</div>';
//							result +='</div>';
//						}
					});
					$('#replyBox').html(result);
					textbox.value = '';
					alert("문의글이 저장 되었습니다.");
					adminreply();
			}
			, error : function(data){
				console.log("저장버튼 클릭시 error");
			}
		});
	}
	
	
}
//관리자 답변보기box
function adminreply(obj){
	$(obj).parent().parent().next().fadeToggle("slow");
}
function rereplybtn() {
	 var rereplyarr = document.getElementsByClassName('rereply_admin');
	 console.log(rereplyarr[0].innerText);
	 for(var i=0; i< rereplyarr.length; i++) {
		 console.log("여기");
		 rereplyarr[i].parentNode.parentNode.previousSibling.previousSibling.children[1].style.display = 'block';
		 //rereplyarr[i].parentNode.parentNode.previousSibling.previousSibling.children[1].innerText();
	}
 }
function loginpage(){
	location.href="/intro";
}