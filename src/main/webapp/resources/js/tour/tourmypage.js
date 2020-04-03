window.onload = function() {
	
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