window.onload = function() {
	var tempimgbox = document.getElementsByClassName('tourmypage_imgbox');
	
	for(var i=0; i<tempimgbox.length; i++) {
		var temppop = tempimgbox[i].data-set.pop;
		
		if(temppop==0) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/custom-1.png">';
		} else if(temppop == 1) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/custom-1-1.png">';
		} else if(temppop == 2) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/custom-2-1.png">';
		} else if(temppop == 3) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/custom-3-1.png">';
		} else if(temppop == 4) {
			tempimgbox[i].innerHTML = '<img style="width:100%" alt="img" src="/resources/img/tour/custom-4-1.png">';
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