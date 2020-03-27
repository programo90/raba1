/**
 * 
 */
document.addEventListener("DOMContentLoaded",function(){
	
	/* 판매상태  */
	
	var optioncheck = document.getElementsByClassName("optioncheck");
	
	for(var i = 0 ; i<optioncheck.length; i++ ){

		/* select 전의 input의 value값을 가져와야 한다. */
		var pstate = optioncheck[i].previousElementSibling.value;
		
		var opts = optioncheck[i].children;
		
		opts[pstate].selected = true;
		
	}//option check for 문
	
});