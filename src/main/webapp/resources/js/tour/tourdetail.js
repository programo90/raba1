//그린 경로의 좌표값을 lat, lng 으로 저장해서 배열로 만들고, 그 외에 입력한 값들과 함께 submit.
function insertTour(){
    var selectedPath = clickLine.getPath();
    var input_latlng = document.getElementById('tour_latlng');
    var content ='';
    
    for(var j=0; j<selectedPath.length; j++){
        var pathLat = selectedPath[j].getLat();
        var pathLng = selectedPath[j].getLng();
        console.log(pathLat+','+pathLng);
        
        content += '<input type="hidden" name="tourlatlist" value="' + pathLat + '">';
        content += '<input type="hidden" name="tourlnglist" value="' + pathLng + '">';
    }
    
    input_latlng.innerHTML = content;
    
    document.getElementById('tourinsertform').submit();
}

//참여인원 최대, 최소수 체크
function checkmaxmin(inputtotalcount) {
    var inputcount = inputtotalcount.value;
    if(inputcount>20) {
        alert('최대 참여 인원은 20명까지 설정할 수 있습니다.');
        document.getElementById('totalcount').value = 20;
    } else if(inputcount<1) {
        alert('최소 참여 인원은 1명까지 설정 할 수 있습니다.');
        document.getElementById('totalcount').value = 1;
    }
}


 function applyTour(applystate) {
	 if(applystate==0){
         var temptourno = document.getElementById('tourno').value;
         var tempuserid = document.getElementById('userid').value;
         /*var tempdistance = document.getElementById('distance').value;*/
         var tempdata = {"tourno":temptourno,"userid":tempuserid};
         
		 //지원시 ajax 로 신청자 userid와 신청한 tourno 를 넘기고 해당 유저가 신청했는지, 안했다면 현재인원/최대인원 체크후 신청 성공 or 인원초과 or 중복지원 여부 리턴
		 $.ajax({
			url: '/tourapply'
			,data : tempdata
			,dataType : 'json'
			,contentType: "application/json;charset=utf-8"
			,success : function(data) {
				if(data==0) {
					alert("지원 완료.");
					location.href="/tourdetail/"+temptourno;
					//page 리로드
				} else if(data==1) {
					alert("이미 지원한 투어입니다.");
				} else if(data==2) {
					alert("최대 지원자 수를 초고하였습니다.");
				} else if(data==3) {
					alert("종료된 투어입니다.");
				}
			}
		 	,error : function(data) {
		 		alert("에러 : 관리자에게 문의하세요");
		 	}
		 });	 
	 } else if(applystate==1) {
		 alert("모집이 마감된 일정입니다.");
	 } else {
		 alert("종료된 일정입니다."); 
	 }
 }
 
function reinsert(order) {
	 var temptourno = document.getElementById('tourno').value;
     var tempuserid = document.getElementById('userid').value;
     var recontent = document.getElementById('recontent').value;
	 
     var tempdata = {"tourno":temptourno,"userid":tempuserid, "recontent":recontent,"reorder":order};

	 
	 $.ajax({
		 url: '/tourreinsert'
		,data : tempdata
		,dataType : 'json'
		,contentType: "application/json;charset=utf-8"
		,success : function(data) {
			let result ='<li class="tourreple_list">';
				result += '글번호 작성자 내용 </li>';
				result += '';
				
			$.each(data,function(index,item){
				if(item.relevel==0) {
					result += '<li class="tourreple_list" onclick="rereinsert(this,' + item.reorder + ')">';
					result += '<div>';
					result += (index+1) + ' ' + item.userid + ' ' +item.recontent+'</div>';
					result += '</li>';
				} else if(item.relevel==1) {
					result += '<li class="tourreple_relist">';
					result += '<div>';
					result +=  (index+1) + ' ' + item.userid + ' ' +item.recontent+'</div>';
					result += '</li>';
				}
			});
			$('#replylist').html(result);
			$('#recontent').text('');
		}
		,error : function(data) {
			 console.log('reple insert error');
		}
		 
	 });
 }
 function rereinsert(obj,order) {
	 //if() 호스트
	 var hostid = document.getElementById('userid').value
	 var userid = document.getElementById('hostid').value
	 if(hostid==userid) {
		 $('#re_rebox').remove();
		 	var result ='<li id="re_rebox" class="tourreple_list" style="padding: 30px"><form>';
		 		result += '<textarea id="recontent" cols="110" rows="4" placeholder="내용을 입력하세요."></textarea>';
		 		result += '<button type="button" onclick="reinsert(' + order + ')">저장</button>';
		 		result += '</form></li>';
		 	$(obj).after(result); 
	 }
	 //else if() 멤버
 }