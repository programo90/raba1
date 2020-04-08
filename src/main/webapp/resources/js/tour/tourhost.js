window.onload = function() {
	selectImg();
}
function selectImg() {
	var touradminsel = document.getElementsByClassName('tourstatesel');
	for(var i = 0; i<touradminsel.length;i++) {		
		var selval = touradminsel[i].nextElementSibling.value;
		touradminsel[i].children[selval].selected = true;
	}
	
	var tempimgbox = document.getElementsByClassName('tourhostpage_imgbox');
	
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

function detailinfo(obj) {
	var openstate = obj.dataset.openwin;
	console.log(openstate);
	if(openstate == '0') {
		var tourno = obj.dataset.tourno;
		var tempdata = {
				"tourno":tourno
			};
			
			$.ajax({
				url:"/tourapplist"
				,data : tempdata
				,dataType : "json"
				,contentType: "application/json;charset=utf-8"
				,success:function(data) {
					var result ='<tr><td colspan="5" style="width:100%;">';
						result+='<div style="padding:20px 40px; width:100%;"><p>';
						
					$.each(data,function(index,item){
						result += item.username;
						result += '  ';
					});
					result += '</p></div>';
					/*result += '<div style="width:100%; height:60%;">메시지 전송</div>';*/
					result += '</td></tr>';
					
					relist(obj, tempdata, result);
					
				}
				,error : function(data) {
					alert("error : 수정실패");
				}
			});
						
			obj.dataset.openwin = '1';
	} else {
		$(obj).parent().next().remove();
		$(obj).parent().next().remove();
		obj.dataset.openwin = '0';
	}
}

function relist(obj,tempdata, tempresult) {
	
	$.ajax({
		url:"/tourrelist"
		,data : tempdata
		,dataType : "json"
		,contentType: "application/json;charset=utf-8"
		,success:function(data) {
			var result ='<tr><td colspan="5" style="width:100%;">';
			result +='<div class="relistbox" style="padding:20px 60px; width:100%; height:100%;">';
			$.each(data,function(index,item){
				if(item.relevel==0){
					result += '<p onclick="rereinsert(this,' + item.reorder + ')">' + item.username + ' | ';
					result += item.recontent +'</p>';
				} else {
					result += '<p class="rerelist">' + item.username + ' | ';
					result += item.recontent +'</p>';
				}
			});
			result += '</div>';
			/*result += '<div style="width:100%; height:60%;">메시지 전송</div>';*/
			result += '</td></tr>';
			console.log(result);
			tempresult += result;
			
			$(obj).parent().after(tempresult);
			
		}
		,error : function(data) {
			alert("error : 수정실패");
		}
	});

}

function reinsert(obj,order) {
	/*var temptourno = document.getElementById('tourno').value;
    var tempuserid = document.getElementById('userid').value;
    var recontent = document.getElementById('recontent').value;
	 
    var tempdata = {"tourno":temptourno,"userid":tempuserid, "recontent":recontent,"reorder":order};

	 
	 $.ajax({
		 url: '/tourreinsert'
		,data : tempdata
		,dataType : 'json'
		,contentType: "application/json;charset=utf-8"
		,success : function(data) {
			
			replaceReply(data);
		}
		,error : function(data) {
			 console.log('reple insert error');
		}
		 
	 });*/
}


function rereinsert(obj,order) {
		$('#re_rebox').remove();
		var result ='<div id="re_rebox" class="tourreple_list" style="padding: 30px"><form>';
		 	result += '<textarea id="recontent" cols="100" rows="4" placeholder="내용을 입력하세요."></textarea>';
		 	result += '<button id="resave_btn" type="button" onclick="reinsert(this,' + order + ')">저장</button>';
		 	result += '</form></div>';
		 	console.log($(obj).parent());
		 	$(obj).parent().after(result); 
	 //else if() 멤버
}

function changeState(tourno) {
	var tourselect = document.getElementById("tourstatesel"+tourno);
	var tempstate = tourselect.options[tourselect.selectedIndex].value;
	var tempdata = {
			"tourno":tourno
			,"tourstate":tempstate
	}
	
	$.ajax({
		url:"/tourupdatestate"
		,data : tempdata
		,dataType : "json"
		,contentType: "application/json;charset=utf-8"
		,success:function(data) {
			alert("수정 완료");
		}
		,error : function(data) {
			alert("error : 수정실패");
		}
	});
}

function selectState(obj) {
	var tempstate = obj.options[obj.selectedIndex].value;
	var hostno = document.getElementById('hostno').value;
	var tempdata = { "tourstate":tempstate
						,"hostno":hostno
					};
	
	
	console.log(hostno);
	
	$.ajax({
		url:"/tourhostlistre"
		,data : tempdata
		,dataType : "json"
		,contentType: "application/json;charset=utf-8"
		,success:function(data) {
			replaceTourList(data);
			selectImg();
		}
		,error : function(data) {
			alert("error : 수정실패");
		}
	});
	
}
function replaceTourList(data) {
	let result ="";
	$.each(data,function(index,item){
		result += '<tr class=" border-b border-gray-200 ">';
		result += '<td class=" flex items-center px-5 py-5 bg-white text-sm">';
		result += '<div class="tourhostpage_imgbox" data-pop="' + item.populartour +'">';
		result += '</div>';
		result += '<a href="/tourdetail/' + item.tourno + '">';
		result += '<div class="px-3 py-2 w-full flex items-center justify-between leading-none">';
		result += '<div class="truncate">';
		result += '<div style="text-align: center;">';
		result += '<h2 style="margin-bottom:10px; font-size:20px;">' + item.tourtitle + '</h2> <p>From' + item.startspot + ' <br>To ' + item.endspot + '</p>';
		result += '</div></div></div>';
		result += '</a></td>';
		result += '	<td class="hidden md:table-cell  px-5 py-5 border-b border-gray-200 bg-white text-sm">';
		result += '<p class="text-gray-900 whitespace-no-wrap">' + item.tourday + ' ' + item.tourtime + '</p>';
		result += '</td>';
		result += '<td class="hidden md:table-cell px-5 py-5 border-b border-gray-200 bg-white text-sm text-center" onclick="detailinfo(this)" data-tourno="' + item.tourno + '" data-openwin="0">';
		result += '<span class="text-gray-900 text-sm">' + item.cancount + ' / ' + item.totalcount + '</span><br>';
		result += '<input class="tourhostpage_list_btn" type="button" value="명단 보기">';
		result += '</td>';
		result += '<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">';
		result += '<div class="text-gray-500">';
		result += '<select class="tourstatesel" id="tourstatesel'+ item.tourno + '">';
		result += '<option value="0">모집중</option><option value="1">마감</option><option value="2">종료</option>';
		result += '</select>';
		result += '<input type="hidden" value="' + item.tourstate + '">';
		result += '<input type="button" class="tourhostpage_state_btn" value="상태변경" onclick="changeState(' + item.tourno + ')">';
		result += '</div></td>';
		result += '<td>';
		result += '<form action="tourcancel">';
		if(item.tourstate==0 || item.tourstate==1) {
			result += '<a href="/tourupdate/' + item.tourno + '" class="tourhostpage_update_btn">편집</a>';
			result += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
		} else {
			result += '<input type="button" value="종료">';
		}
		result += '</form></td></tr>';
	});
	
	$('#tbodylist').html(result);
}