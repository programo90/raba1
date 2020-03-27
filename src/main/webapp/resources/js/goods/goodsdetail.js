/**
 * 
 */
document.addEventListener("DOMContentLoaded",function(){
	
	var optionsize = document.getElementsByClassName('sizeoption');
	
	var optionamount = document.getElementsByClassName('amountoption');
	
	var sizeselect = document.getElementById('p_size');
	
	for(var i = 0 ; i < optionsize.length ; i++ ){
		
		if(optionsize[i].value == 'f'){
			
			var str = document.createElement("option");
			
			str.value = 'f';
			
			str.innerText = "free (" + optionamount[i].value + "개)";
			
			
		}else if(optionsize[i].value == 's'){
			
			var str = document.createElement("option");
			
			str.value = 's';
			
			str.innerText = "small (" + optionamount[i].value + "개)";
			
		}else if(optionsize[i].value == 'm'){
			
			var str = document.createElement("option");
			
			str.value = 'm';
			
			str.innerText = "medium (" + optionamount[i].value + "개)";
			
		}else if(optionsize[i].value == 'l'){
			
			var str = document.createElement("option");
			
			str.value = 'l';
			
			str.innerText = "large (" + optionamount[i].value + "개)";
			
		}else if(optionsize[i].value == 'xl'){
			
			var str = document.createElement("option");
			
			str.value = 'xl';
			
			str.innerText = "xlarge (" + optionamount[i].value + "개)";
			
		}
		
		sizeselect.appendChild(str);
	}//end for문
	
	/* 사이즈가 선택되면 그에 맞는 갯수가 max 값에 입력이 된다*/
	
	
	sizeselect.addEventListener("change",function(){
		
		var size = document.getElementById("p_size").value;
		
		var optionno = document.getElementsByClassName("nooption");
		
		for(var j =0 ; j < optionsize.length; j++){
			
			if(optionsize[j].value == size){
				
				var limitamount = optionamount[j].value;
				
				var selectedno = optionno[j].value;
				
				console.log(selectedno);
			}
		}//for 문
		
		document.getElementById("p_amount").max = limitamount ;
		
		document.getElementById("pno").value = selectedno;
		
		
		/* userid가 null인데 그이유는 login을 하지 않은 상태로 접근을 하기 때문이다.*/
		console.log(document.getElementById("usercode").value);
		
	});
	
	
	
	
});