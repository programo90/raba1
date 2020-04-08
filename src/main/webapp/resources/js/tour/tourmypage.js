window.onload = function() {
	selectImg();
}

function selectImg() {
	var tempimgbox = document.getElementsByClassName('tourmypage_imgbox');
	
	for(var i=0; i<tempimgbox.length; i++) {
		var temppop = tempimgbox[i].dataset.pop;
		
		if(temppop==0) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/custom-1.png">';
		} else if(temppop == 1) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/course-1-1.png">';
		} else if(temppop == 2) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/course-2-1.png">';
		} else if(temppop == 3) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/course-3-1.png">';
		} else if(temppop == 4) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/course-4-1.png">';
		} 
	}
}

function cancelApplyTour(tourno) {
	var tempid = document.getElementById('userid').value;
	var tempdata = {
			"tourno":tourno
			,"userid":tempid
	}

	$.ajax({
		url:"/tourcancel"
		,data : tempdata
		,dataType : "json"
		,contentType: "application/json;charset=utf-8"
		,success:function(data) {
			if(data==1) {
				alert("취소 완료");
				location.href="/tourmypage";
			} else {
				alert("취소 실패 : 호스트에게 문의하세요");
			}
		}
		,error : function(data) {
			alert("error : 에러");
		}
	});
}
function searchTourlist() {
	var tempsel = document.getElementById('selstate');
	var tempstate = tempsel.options[tempsel.selectedIndex].value;
	var userid = document.getElementById('userid').value;
	var temptxt = document.getElementById('searchtxt').value;
	var tempdata = { "tourstate":tempstate
					,"searchtxt":temptxt
					,"userid":userid
					}

	$.ajax({
		url:"/tourmypagelistre"
		,data : tempdata
		,dataType : "json"
		,contentType: "application/json;charset=utf-8"
		,success:function(data) {
			replaceList(data);
			selectImg();
		}
		,error : function(data) {
			alert("error : 관리자에게 문의하세요");
		}
	});
	
	
}
function replaceList(data) {
	let result ="";
	
	$.each(data,function(index,dto){
		result +='<tr class=" border-b border-gray-200 ">';
		result +='<td class=" flex items-center px-5 py-5 bg-white text-sm">';
		result +='<div class="tourmypage_imgbox" data-pop="'+dto.populartour+'"></div>';
		result +='<div class="px-3 py-2 w-full flex items-center justify-between leading-none">';
		result +='<div class="truncate">';
		result +='<a href="/tourdetail/'+dto.tourno+'">';
		result +='<div class="tourmypage_spot">';
		result += '<h4 style="font-size:1.2em;text-align:center;">' + dto.tourtitle + '</h4>';
		result +='<p>출발지 : '+ dto.startspot + '</p><p>도착지 : ' + dto.endspot + '</p>';
		result +='</div></a>';
		result +='</div></div>';
		result +='</td>';
		result +='<td class="hidden md:table-cell px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">';
		result +='<span class="text-gray-900 text-sm">';
		if(dto.distance < 1000) {
			result += dto.distance + ' m';
		} else {
			result += dto.distance/1000 +' km';
		}
		result += '</span></td>';
		result += '<td class="hidden md:table-cell  px-5 py-5 border-b border-gray-200 bg-white text-sm">';
		result += '<p class="text-gray-900 whitespace-no-wrap">' + dto.tourday + ' ' + dto.tourtime + '</p>';
		result += '</td>';
		result += '<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">';
		result += '<div class="tourmypage_state">';
		if(dto.tourstate == 0 ) {
			result += '모집중';
		} else if(dto.tourstate == 1 ) {
			result += '마감';
		} else {
			result += '종료';
		}
		result += '</div></td>';
		result += '<td><form action="tourcancel" style="position:relative; right:50%;">';
		if(dto.tourstate==2) {
			result += '<input type="button" value="모집종료">';
		} else {
			result += '<input class="tourmypage_update_btn" type="button" onclick="cancelApplyTour(' + dto.tourno + ')" value="지원취소">';
			result += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
		}
		result += '</form></td>';
		result += '</tr>';
	});
	
	$('#listbody').html(result);
}