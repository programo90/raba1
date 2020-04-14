window.onload = function(){
	
	plusPrice();
	
	/* 재고를 확인하는 function을 생성  */
	
	check_amount();
	
}

function check_amount(){
	
	var cnolist = document.getElementsByClassName("cnolist");
	
	var list_checkbox = document.getElementsByClassName("list_checkbox");
	
	var cartlist = document.getElementsByClassName("cartlist");
	
	
	var arrCno = [];
	
	
	for(var i = 0 ; i < cnolist.length; i++){
		
			arrCno.push(cnolist[i].value);
			
		}
	
	var tempdata = {"arr":arrCno};
	
	console.log(tempdata);
	
	jQuery.ajaxSettings.traditional = true;
	
	$.ajax({
		
		url : "/checkAmount" ,
		data : tempdata,
		dataType : 'json',
		contentType: "application/json;charset=utf-8",
		success : function(result){
			
			
			for(var j = 0 ; j < result.length; j++){
				
				var pamount = result[j]*1;
				
				if(pamount <= 0){
					
					//console.log("pamount :" +pamount);
					alert("재고가 소진된 제품은 결제가 불가합니다.");
					
					list_checkbox[j].disabled = true;
					
					/*cartlist[j].remove();*/
					
				}
			}
			
		},error : function(error){
			
			alert("결제할 제품이 없습니다.");
		}
		
	}); // end ajax
	
	
	
}





/* 주문 상품을 선택하지 않고 상품 주문을 선택할 시 오류를 막는 코드 */
function check_submit(){
	
	var orderdata = document.getElementById("orderdata");
	
	var first_cno =  orderdata.firstChild;
	
	if(first_cno == null)
		{
			
			alert("결제할 제품을 선택해주세요.")
			
			return ;
		
		}
	
	var paysubmit = document.getElementById("paysubmit");	
	
	paysubmit.submit();
}



/* 전체 checkbox on , off 기능 구현 코드 */
	function checkAll() {
		
		var list_checkbox = document.getElementsByClassName("list_checkbox");
		
		if(main_checkbox.checked == true){
			
			for(var j = 0 ; j < list_checkbox.length ; j++){
				
				if(list_checkbox[j].disabled==false){
					
					list_checkbox[j].checked = true ;
					
				}
				
			}
			
		}else{
			
			for(var j = 0 ; j < list_checkbox.length ; j++){
				
				if(list_checkbox[j].disabled==false){
				
					list_checkbox[j].checked = false ;
					
				}
				
			}
			
		}
	}
	
	/* checkbox가 onclick이 되면 실행이 되는 기능이다. */
	function plusPrice(){
		
		/* 클릭된 cno들은 class를 가지게 된다. 
		 * 
		 * 클릭된 cno는 checked = true 이다.
		 * 
		 * 그래서 아래서 훑는 것이 checked = true 인지를 훑는 것이다.
		 * 
		 * 
		 * 
		 * */
		
		
		/*먼저 클릭된 cno가 몇번째 cno인지 확인을 해야하므로 총 갯수를 가지고 훑는다.*/
		
		var list_checkbox = document.getElementsByClassName("list_checkbox");
		
		var cnolist = document.getElementsByClassName("cnolist");
		
		var price = document.getElementsByClassName("price");
		
		var orderdata = document.getElementById("orderdata");
		
		var hiddencno_list = document.getElementsByClassName("temp");
		
		/* hiddencno_list 초기화 */
		
		$("#orderdata *").remove();
		
		
		/* 체크된 checkbox의 갯수를 세기 위함 */
		/*var chcknum = 0;*/
		
		var plusprice = 0;
		
		var deliveryprice = 0;
		
		var i = 0;
		
		for(i = 0 ; i < list_checkbox.length ; i ++){
			
			if(list_checkbox[i].checked == true){
				
				var hiddencno = document.createElement("input");
				/*chcknum += 1*1;*/
				
				plusprice += price[i].value*1;
				
				/* input type = hidden  name = cnolist2  value = cnolist */
				hiddencno.type = 'hidden';
				
				hiddencno.value = cnolist[i].value; 
				
				hiddencno.name = "cnolist2" ;
				
				orderdata.appendChild(hiddencno);
				
			}
			
			
		}
		
		
		//test
		/*console.log("선택된 값의 갯수" + chcknum);*/
		/*console.log("plus price : " + plusprice);*/
	
		
		
		/* 페이지에 보여지는 가격들을 위한 코드 */
		
		/*var span = document.createElement('span');
		
		span.innerText = plusprice;
		
		span.classList.add("format-money");
		
		document.getElementById("price_text").appendChild(span);
		*/
		
		document.getElementById("price_text").innerText = plusprice + "원";
		
		/*document.getElementById("price_text").classList.add(".format-money");*/
		
		if(plusprice*1 >= 50000){
			
			deliveryprice = 0;
			
		}else if(plusprice == 0 ){
			
			deliveryprice = 0;
		}else{
			
			deliveryprice = 3000;
		}
		
		
		document.getElementById("delivery_price_text").innerText = deliveryprice+ "원";
		
		document.getElementById("total_price_text").innerText = plusprice + deliveryprice + "원";
	
		document.getElementById("total_price").value =  plusprice + deliveryprice ;
	}
	
	
	 /* 부분 선택 삭제 구현 중 배열로 ajax값을 날리는데 문제가 있음 */
	function delete_cno(){
		
		var userid = document.getElementById('userid');
		
		var list_checkbox = document.getElementsByClassName("list_checkbox");
		
		var cnolist = document.getElementsByClassName("cnolist");
		
		var arrCno = [];
		
		for(var i = 0 ; i < list_checkbox.length; i++){
			
			if(list_checkbox[i].checked == true){
				console.log(cnolist[i].value);
				/*arrCno.push(cnolist[i].value);*/
				arrCno.push(cnolist[i].value);
				
			}
		}
		var tempdata = {"arr":arrCno, "userid":userid.value};
		console.log(tempdata);
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			
			url : "/deleteCno" ,
			data : tempdata,
			dataType : 'json',
			contentType: "application/json;charset=utf-8",
			success : function(result){
				
				alert("삭제되었습니다.");
				window.location.href  = '/cart_list/'+result;
				
			},error : function(error){
				
				alert("삭제할 상품을 선택해주세요.");
			}
			
		}); // end ajax
		
	}
	
	function delete_ALL(){
		
		var userid = document.getElementById('userid');
		
		var temp = {"userid":userid.value};
		
		$.ajax({
			url : '/deleteAll',
			data : temp ,
			dataType : 'json',
			contentType: "application/json;charset=utf-8",
			success : function(result){
				
					alert("장바구니를 비웠습니다.");
					window.location.href  = '/cart_list/'+result;
				
			},error : function(data) {
				
		 		alert("에러 : 관리자에게 문의하세요");
		 	}
			
		});
		
	}
	

