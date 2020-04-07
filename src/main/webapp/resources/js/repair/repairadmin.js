$(document).ready(function(){
	document.getElementsByClassName('adminnav')[3].style.backgroundColor="#e8e8e8";
	
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
		//drop이벤트 (날짜수정가능)
		eventDrop:function(event, delta, revertFunc){
			var calendar_title =$('#calendar_title').val();
			var calendar_start_date=$('#calendar_start_date').val();
			var calendar_end_date=$('#calendar_end_date').val();
			$.ajax({
				/*type:'POST',*/
				url:'/calmodify',
				data:{calno:calno, calendar_start_date:event.start.format(), calendar_end_date:event.end.format()},
				//event_id ->고유키	update 테이블 set start=?, end=? where calId=?
				cache:false,
				async:false,
				success:function(data){
					if(result=='OK'){
						$('#calendar').fullCalendar('refetchEvents');
					}
				}
			})
		},
		//일정 삭제
		eventClick: function(calEvent, jsEvent, view){
			if(confirm("정비 예약 "+calEvent.title+"을 삭제하시겠습니까?")){
//				return false;	//취소를 눌렀을때 실행 중단
				$.ajax({
					/*type:'POST',*/
					url:'/caldelete',
					data:{calno:calEvent.calno},	//calEvent.id => primarykey...고유값만 가져와서 delete하면됨
					cache:false,
					async:false,
					success:function(data){
						console.log("여기");
//						if(data =="OK"){
							alert("정비 예약이 삭제 되었습니다.");
							$('#calendar').fullCalendar('refetchEvents');
//						}
					}
				})
			}
		} //일정삭제 end
		
	});
	//날짜이전버튼 클릭시
	$("button.fc-prev-button").click(function() {
        var date = $("#calendar").fullCalendar("getDate");
        console.log("이전버튼")
    });
	$('.fc-day').click(function(){
		var moment = $('.callender_area').fullCalendar('getDate');
//		var yy=moment.format("YYYY");
//		var mm=moment.format("MM");
//		var dd=moment.format("DD");
//		var ss=moment.format("dd");
		console.log(moment);
	});
	rereplybtn();
});
/* 스케줄 등록 */
function addSchedule(){
	var addpop ="";
	addpop+="<div class='addpop_box'><div class='addpop_tit_box'>스케줄 명</div><div class='addpop_input_box'><input type='text' id='calendar_title' class='calendar_input' value=''></div></div>";
	addpop+="<div class='addpop_box'><div class='addpop_tit_box'>시작 날짜</div><div class='addpop_input_box'><input type='date' id='calendar_start_date' value='' class='addpop_input calendar_input'></div></div>";
	addpop+="<div class='addpop_box'><div class='addpop_tit_box'>마침 날짜</div><div class='addpop_input_box'><input type='date' id='calendar_end_date' value='' class='addpop_input calendar_input'></div></div>";
	addpop+="<div class='addpop_btn'><button onclick='javascript:saveSchedule();' class='admin_btn subminbtn'>저장</button></div>";
	openPopup('정비 스케줄 등록', addpop, 400);
}
function openPopup(subject,contents, widths){
	$('#alert_subject').html(subject);
	$('#alert_contents').html(contents);
	openMessage('winAlert', widths);
	//일정값이 담겨있다
}
//스케줄저장시
function saveSchedule(){
	var calendar_title =$('#calendar_title').val();
	var calendar_start_date=$('#calendar_start_date').val();
	var calendar_end_date=$('#calendar_end_date').val();
	
	if(!calendar_title){
		alert('스케줄 명을 입력해 주세요');
		return false;
	}
	if(!calendar_start_date){
		alert('시작 날짜를 입력해 주세요');
		return false;
	}
	if(!calendar_end_date){
		alert('마침 날짜를 입력해 주세요');
		return false;
	}
	$.ajax({
		/*type:'POST',*/	
		url:'/calinsert',	
		data:{title:calendar_title, start:calendar_start_date, end:calendar_end_date},
		cache:false,
		async:false,
		success:function(data){
			closeMessage('winAlert');
			alert('스케줄이 저장되었습니다.');
			$('#calendar').fullCalendar('refetchEvents');//새로고침 되면서 리프레시
		}
	})
}
//관리자 답변box
function adminreply(obj){
	$(obj).parent().parent().next().fadeToggle();
	
}
//예약 저장 버튼 클릭시
function reservsend(reservorder){
	var userid=document.getElementById('userid').value;
	console.log('id' + userid);
	var textbox = document.getElementById('reservationText'+reservorder);
	console.log(reservorder);
	
	var txt = document.getElementById('reservationText'+reservorder).value;
	console.log("caldate"+caldate);
	var reservedata = {"userid":userid,"reservtxt":txt,"reservorder":reservorder};
	
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
						result +='<p class="repair_inquiry_user">'+item.username+'</p>';
						result +='<p class="repair_inquiry_date">작성일 :'+item.reservwritedate+'</p>';
						result +='<p class="repair_inquiry_txt"><span class="repair_inquiry_cal">예약일자 '+item.caldate+'</span> | '+item.reservtxt+'</p>';
						result +='</div>';
						result +='<div class="repair_inquirylist_btn" data-temp="ppsc1"  style="display:block;">';
						result +='<input type="button" value="답변" class="admin_btn" onclick="adminreply(this)">';
						result +='</div>';
						result +='</div>';
						result +='<form style="display:none; height: 70px; margin-left: 24px;">';
						result +='<ul>';
						result +='<li class="repair_li">';
						result +='<label for="reservationText" class="reservation_label">정비 문의</label>';
						result +='<input type="hidden" name="userid" value="'+userid+'">';
						result +='<textarea rows="3" cols="117" name="reservtxt" id="reservationText'+item.reservorder+'"  class="repair_text reservationText" placeholder="문의한 글의 답변 내용을 작성해주시기 바랍니다."></textarea>';
						result +='</li>';
						result +='<li class="repair_li">';
						result +='<input type="hidden" name="caldate" id="caldate">';
						result +='<input type="button" value="저장" class="admin_btn subminbtn" onclick="reservsend('+item.reservorder+')">';
						result +='</li>';
						result +='</ul>';
						result +='</form>';
					}else if(item.reservlevel==1) {
					    result +='<div class="reply_box">';
						result +='<div class="reply">';
						result +='<p class="rereply_admin">관리자 답변 | <span class="rereply_admintxt"> '+item.reservtxt+'</span></p>';
						result +='</div>';
						result +='</div>';
					}
				});
				$('#reply_container').html(result);
				//$('#reservationText').text('');
				textbox.value = '';
				textbox.parentNode.parentNode.parentNode.remove();
				alert("답변이 저장 되었습니다.");
				amdinrereplybtn();
		}
		, error : function(data){
			console.log("저장버튼 클릭시 error");
		}
	});
}

 function rereplybtn() {
	 var rereplyarr = document.getElementsByClassName('rereply_admin');
	 for(var i=0; i< rereplyarr.length; i++) {
		 console.log("여기");
		 rereplyarr[i].parentNode.parentNode.previousSibling.previousSibling.previousSibling.previousSibling.children[1].remove();
	}
  }
 function amdinrereplybtn() {
	 var rereplyarr = document.getElementsByClassName('rereply_admin');
	 for(var i=0; i< rereplyarr.length; i++) {
		 console.log("여기");
		 rereplyarr[i].parentNode.parentNode.previousSibling.previousSibling.children[1].remove();
	}
  }
//팝업창
function openMessage(IDS, widths){
	$('#'+IDS).css('width', widths+'px');	//특정아디값을 지정하면 
	$('#'+IDS).bPopup();	//팝업뜨게하는것
}
function closeMessage(IDS){
	$('#'+IDS).bPopup().close();
}