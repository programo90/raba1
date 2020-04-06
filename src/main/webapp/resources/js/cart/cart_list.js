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
		document.getElementById("price_text").innerText = plusprice + "원";
		
		document.getElementById("delivery_price_text").innerText = deliveryprice + "원";
		
		document.getElementById("total_price_text").innerText =plusprice + deliveryprice + "원" ;
	
		document.getElementById("total_price").value =  plusprice + deliveryprice;
	}
	
	function delete_cno(){
		
		alert("delete!!");
		
		var list_checkbox = document.getElementsByClassName("list_checkbox");
		
		var cnolist = document.getElementsByClassName("cnolist");
		
		var arrCno = new Array();
		
		for(var i = 0 ; i < list_checkbox.length; i++){
			
			if(list_checkbox[i].checked == true){
				
				arrCno.push(cnolist[i].value);
				
			}
		}
		
		$.ajax({
			
			url : "/deleteCno" ,
			data : arrCno,
			type : 'post',
			
			
			
		});
		
	}

