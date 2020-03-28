/* 전체 checkbox on , off 기능 구현 코드 */
	function checkAll() {
		
		var list_checkbox = document.getElementsByClassName("list_checkbox");
		
		if(main_checkbox.checked == true){
			
			for(var j = 0 ; j < list_checkbox.length ; j++){
				
				list_checkbox[j].checked = true ;
			}
			
		}else{
			
			for(var j = 0 ; j < list_checkbox.length ; j++){
				
				list_checkbox[j].checked = false ;
			}
			
		}
	}
	
	function plusPrice(){
		
		var list_checkbox2 = document.getElementsByClassName("list_checkbox");
		
		var plus_price = document.getElementsByClassName("price");
		
		var cart_price = 0;
		
		for(var k = 0 ; k < list_checkbox2.length ; k++){
			
			if(list_checkbox2[k].checked == false){
				
				cart_price -= plus_price[k].value*1 ;
				
			}else{
				
				cart_price += plus_price[k].value*1;
				
			}
				
		}
		
		console.log(cart_price);
		
	} //end plusPirce function
	

document.addEventListener("DOMContentLoaded",function(){
	
	var price = document.getElementsByClassName("price");
	
	var list_checkbox1 = document.getElementsByClassName("list_checkbox");
	
	var first_price = 0;
	
	var delivery_price = 0;
	
	
	/* 리스트에 들어온 모든 값들을 더해주는 식이다. 그런데 문자타입으로 값을 받네 
	 * 		형변환을 시켜주면 된다. 숫자로 (*1) , 문자로(+"")
	 * */
	
	
	/*for(var i = 0 ; i < price.length ; i++){
		
			first_price += price[i].value*1;	
		
	}*/
	
	/* 물건들 총 합계 */
	
	
	
	document.getElementById('price_text').innerText = first_price + "원";
	
	/* 택배비 추가 코드 */
	document.getElementById("delivery_price_text").innerText = 0 + "원";
	
	/* 물건들  + 택배 = 총 합계 */
	var total_price = first_price + delivery_price;
	
	var text3 = document.getElementById("total_price_text");
	
	text3.innerText = " = " + total_price + "원";
	
	document.getElementById("total_price").value = total_price;
	
	
});


	


