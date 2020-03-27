/**
 * 
 */						
document.addEventListener("DOMContentLoaded",function(){
	
	console.log("checkbox test");
	
	var templist = document.getElementsByClassName('sizecheckbox');
	
	/*var ttemplist = document.getElementsByClassName('inputnumber');*/
						
	var psize = document.getElementById('getsize').value;
						
	var pamount = document.getElementById('getamount').value;
	
	var pstate = document.getElementById('getstate').value;
	
	
	for(var i=0; i<templist.length;i ++) {
							
		if(templist[i].value == psize) {
								
			templist[i].disabled = false;
			
			templist[i].checked = true;
			
			templist[i].nextElementSibling.disabled = false;
			
			/*ttemplist[i].value = pamount;*/
			/* next로 value 값을 넣을 수는 없는건가??*/
			templist[i].nextElementSibling.value = pamount;
			
			
		}
						
	}
	
	/* 판매상태  */
	var option =document.querySelectorAll("select option");
	
	for(var i= 0 ; i<option.length; i++){
		
		if(option[i].value == pstate ){
			
			$("select option:eq("+i+")").attr("selected","selected");
			
			break;
		}
	}
	
	
}); //document