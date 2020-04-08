window.onload = function() {
	document.getElementsByClassName('adminnav')[6].style.backgroundColor="#e8e8e8";
	
	var touradminsel = document.getElementsByClassName('tourstatesel');
	for(var i = 0; i<touradminsel.length;i++) {		
		var selval = touradminsel[i].nextElementSibling.value;
		touradminsel[i].children[selval].selected = true;
	}
}

function updatestate(tourno) {
	var tourselect = document.getElementById("tourstatesel"+tourno);
	var tourstate = tourselect.options[tourselect.selectedIndex].value;
	var tempdata = {
		"tourno":tourno
		,"tourstate":tourstate
	};
	
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
function deletetour(tourno) {
	var tempdata = {
		"tourno":tourno	
	};
	
	$.ajax({
		url:"/atourdelete"
		,data : tempdata
		,dataType : "json"
		,contentType: "application/json;charset=utf-8"
		,success:function(data) {
			if(data==1) {
				location.href = '/touradmin';
			}
		}
		,error : function(data) {
			alert("error : 수정실패");
		}
	});
	
}