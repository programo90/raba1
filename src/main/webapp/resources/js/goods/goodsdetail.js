/**
 * 
 */
document.addEventListener("DOMContentLoaded",function(){
	
	var optionsize = document.getElementsByClassName('sizeoption');
	
	var optionamount = document.getElementsByClassName('amountoption');
	
	var sizeselect = document.getElementById('p_size');
	
	for(var i = 0 ; i < optionsize.length ; i++ ){
		
		if(optionsize[i].value == 'FREE' && optionamount[i].value > 0){
			
			var str = document.createElement("option");
			
			str.classList.add("check_option")
			
			str.value = 'FREE';
			
			str.innerText = "FREE (" + optionamount[i].value + "개)";
			
			
		}else if(optionsize[i].value == 'SMALL' && optionamount[i].value > 0){
			
			var str = document.createElement("option");
			
			str.classList.add("check_option")
			
			str.value = 'SMALL';
			
			str.innerText = "SMALL (" + optionamount[i].value + "개)";
			
		}else if(optionsize[i].value == 'MEDIUM'  && optionamount[i].value > 0){
			
			var str = document.createElement("option");
			
			str.classList.add("check_option")
			
			str.value = 'MEDIUM';
			
			str.innerText = "MEDIUM (" + optionamount[i].value + "개)";
			
		}else if(optionsize[i].value == 'LARGE' && optionamount[i].value > 0){
			
			var str = document.createElement("option");
			
			str.classList.add("check_option")
			
			str.value = 'LARGE';
			
			str.innerText = "LARGE (" + optionamount[i].value + "개)";
			
		}else if(optionsize[i].value == 'XLARGE' && optionamount[i].value > 0){
			
			var str = document.createElement("option");
			
			str.classList.add("check_option")
			
			str.value = 'XLARGE';
			
			str.innerText = "XLARGE (" + optionamount[i].value + "개)";
			
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
		
		document.getElementById("pno").value = selectedno*1;
		
		
		/* userid가 null인데 그이유는 login을 하지 않은 상태로 접근을 하기 때문이다.*/
		/*console.log(document.getElementById("target").value);*/
		
	});
	
});

function addCart( ){
	
	console.log("add cart!!");
	
	var userid = document.getElementById('userid');
	
	var pno = document.getElementById('pno');
	
	var pamount = document.getElementById('p_amount');
	
	var pname = document.getElementById('pname');
	
	var tempData = {"userid":userid.value, "pno":pno.value,	 "pamount":pamount.value,"pname":pname.value};
	
	console.log("userid : " +userid.value+"상품번호  : "+ pno.value+"수량  : "+pamount.value+"상품명 : "+pname.value);
	
	
	
	$.ajax({
		url: '/addcart',
		data : tempData,
		dataType : 'json',
		contentType: "application/json;charset=utf-8",
       	success : function(result){
			
			alert("장바구니에 상품을 담았습니다.");
			
			/*window.location.href  = '/goods_detail/'+result;*/
		},
		error : function(data){
			
			alert("사이즈를 선택해주세요.");
		}
		
		
		
	});// end ajax
	
	
}// end addcart function

/* login check */
function alertlogin(){
	
	alert("로그인 후 가능합니다.");
	
}




