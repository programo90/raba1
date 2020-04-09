<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>B.A. Pay</title>
<link rel="stylesheet" href="/resources/css/pay/pay.css">
<link rel="stylesheet" href="/resources/css/pay/pay2.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				if ("카드결제" == "카드결제") {

					//라디오 버튼 값으로 선택
					$('input:radio[name="deltype"][value="카드결제"]').prop(
							'checked', true);
					//셀렉트 박스 값으로 선택
					//공연/전시 카테고리 hide
					$( "#pay2_1" ).hide();
					$("#moneyc").hide();
					//스포츠 카테고리 show
					$("#cardc").show();
					//스포츠 일때 담당MD 비활성화
					/*$( "#mdName" ).prop( "disabled", true );*/
					$("#check_module").show();
					$("#paystart2").hide();
					$("#cardp").show();
					$("#moneyp").hide();
					$( "#pay3_1" ).show();
					//담당MD 입력값 초기화;
					$("#orderstatus").val("결제완료");
					$("#del").val("카드결제");
				}
				//라디오 버튼 변경시 이벤트
				$("input[name='deltype']:radio").change(function() {
					//라디오 버튼 값을 가져온다.
					var deltype = this.value;

					if (deltype == "카드결제") {//스포츠인 경우
						//스포츠 일때 공연/전시 카테고리 hide
                        $( "#pay2_1" ).hide();
                        $("#moneyc").hide();
                        //스포츠 일때 스포츠 카테고리 show
                        $( "#cardc" ).show();
                        //스포츠 일때 담당MD 비활성화
                        $( "#check_module" ).show();
                        $( "#paystart2" ).hide();
                        $( "#cardp" ).show();
                        $( "#moneyp" ).hide();
                        $( "#pay3_1" ).show();
                        $("#orderstatus").val("결제완료");
                        $("#del").val("카드결제");
					} else if (deltype == "무통장입금") {//무통장입금 경우
						//공연/전시 일때 공연/전시 카테고리 show
                        $( "#pay2_1" ).show();
                        $("#moneyc").show();
                        //공연/전시 일때 스포츠 카테고리 show
                        $( "#cardc" ).hide();
                        //공연/전시 일때 담당 MD 활성화
                        $( "#check_module" ).hide();
                         $( "#paystart2" ).show();
                        $( "#cardp" ).hide();
                        $( "#pay3_1" ).hide();
                        $( "#moneyp" ).show();
                        $("#orderstatus").val("입금대기");
                        $("#del").val("무통장입금");
					}

				});
				
				Number.prototype.format = function(){
				    if(this==0) return 0;

				    var reg = /(^[+-]?\d+)(\d{3})/;
				    var n = (this + '');

				    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

				    return n;
				};
				
				String.prototype.format = function(){
				    var num = parseFloat(this);
				    if( isNaN(num) ) return "0";

				    return num.format();
				};
				
				jQuery('.format-money').text(function() {
				    jQuery(this).text(
				        jQuery(this).text().format()
				    );
				});
					// Handler when the DOM is fully loaded
					
						var img_uuid = document.getElementsByClassName("img_uuid");
						var img_fileName = document.getElementsByClassName("img_fileName");
						var img_uploadPath = document.getElementsByClassName("img_uploadPath");
						var img_fileType = document.getElementsByClassName("img_fileType");
						
						var goods_img = document.getElementsByClassName("paycartimg2");
						
						
						
						for(var i =0 ; i < goods_img.length; i++){
							
							var str = "";
							
							var uuid = img_uuid[i].value;
							var fileName = img_fileName[i].value;
							var uploadPath = img_uploadPath[i].value;
							var fileType = img_fileType[i].value;
							
							var fileCallPath = encodeURIComponent(uploadPath+"/s_"+uuid+"_"+fileName);
							
							console.log("fileCallPath" +fileCallPath);
							
							str += "<div class='goods_img' data-path='"+uploadPath+"' data-uuid='"+uuid+"' data-filename='"+fileName+"' data-type='"+fileType+"' >";
							str += "<img src='/display?fileName="+fileCallPath+"' alt='"+fileName+"'>";
							str += "</div>";
							
							goods_img[i].innerHTML=str;
							
						}
/* 						$(function(){ //memberForm form태그에 대한 validation 시작 
							$("#userinput").validate({ rules: 
							{ 
								// id , name 은 폼태그내에 존재하는 name명이다. 
								orderuname :{required : true}, 
								orderuaddr1 : { required : true },
								orderuaddr2 : { required : true },
								orderuaddr3 : { required : true },
								orderuphone : { required : true }
									}, 
									messages: { // id , name 은 폼태그내에 존재하는 name명이다. // alert에 들어가는 문자내용 // 하지만 text로만 화면에 보여진다는 것! 
										orderuname: { required: "이름을 입력하세요" }, 
										orderuaddr1: { required: "주소를 입력하세요" }, 
										orderuaddr2: { required: "주소를 입력하세요" },
										orderuaddr3: { required: "주소를 입력하세요" },
										orderuphone: { required: "핸드폰번호를 입력하세요" }
										}, //검증이 끝난후에 작업할 부분 (submit??) 
								}) 
									}) */

			});
</script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property='principal.username' var="userid" />
		<input type="hidden" name="userid" id="userid" value="${userid}">
	</sec:authorize>

	<div class="contents">
		<!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
		<form action="pay_resert/" method="post" name="userinput">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="paycart">
				<div class="paycartname">
					<div class="paycartimg">
						<span>이미지</span>
					</div>
					<div class="paygoods">
						<span>상품정보</span>
					</div>
					<div class="paydelivery">
						<span>사이즈</span>
					</div>
					<div class="paypri">
						<span>판매가</span>
					</div>
					<div class="payamount">
						<span>수량</span>
					</div>
					<div class="paypritotal">
						<span>합계</span>
					</div>
				</div>
				<c:forEach var="Goodslist" items="${goods}">
					<div class="paycartlist">
						<div class="paycartimg2">
							
						</div>
						<div class="paygoods">
							<span>${Goodslist.p_name }</span>
						</div>
						<input type="hidden" name="pname" id="pname"
							value="${Goodslist.p_name }" />
						<div class="paydelivery">
							<span>${Goodslist.p_size }</span>
						</div>
						<div class="paypri">
							<span class="format-money">${Goodslist.p_price }</span> 원
						</div>
						<div class="payamount">
							<span>${Goodslist.p_amount } 개</span>
						</div>
						<div class="paypritotal">
							<span class="format-money">${Goodslist.p_price * Goodslist.p_amount}</span> 원
						</div>
					</div>
					<input type="hidden" name="ordercpricelist" id="ordercprice"value="${Goodslist.p_price }" />
					<input type="hidden" name="ordercamountlist" id="ordercamount"value="${Goodslist.p_amount }" />
					<input type="hidden" name="ordercpnolist" id="ordercpno"value="${Goodslist.p_no }" />
				</c:forEach>
						<input type="hidden" name="totalprice" id="totalprice" value="${totalprice }" />
						<input type="hidden" name="userid" id="userid" value="${userid}">
				<div class="paysal">
					<div class="salprice">
						<%-- <span>상품구매금액 <span class="format-money">${totalprice }</span> + 배송비  = 합계 : <span class="format-money"> ${totalprice }</span> 원</span> --%>
					</div>
				</div>
			</div>
			<div class="orderArea">
				<h2>배송 정보</h2>
				<br>
				<div class="order">
					<div class="orderArea1">
						<span>배송지 선택</span>
					</div>
					<div class="orderArea1_1">
						<input type="radio" checked> <label>회원 정보와 동일</label>
					</div>
				</div>
				<div class="order3">
					<div class="orderArea1">
						<span>받으시는분</span>
					</div>
					<div class="orderArea1_1">
						<input type="text" name="orderuname" id="orderuname" size="10"
							value="${user.username }" required="required">
					</div>
				</div>
				<div class="order4">
					<div class="orderArea4">
						<span>주소</span>
					</div>
					<div class="orderArea4_1">
						<p>
							<input type="text" name="orderuaddr1" id="orderuaddr1" size="5"
								value="${user.address }" required="required">
							<button type="button" onclick="execPostCode();"
								class="postalcode">우편번호</button>
						</p>
						<p>
							<input type="text" name="orderuaddr2" id="orderuaddr2"
								value="${user.address2 }" size="100" required="required">
						</p>
						<p>
							<input type="text" name="orderuaddr3" id="orderuaddr3"
								value="${user.address3 }" size="100" required="required">
						</p>
					</div>
				</div>
				<div class="order3">
					<div class="orderArea1">
						<span>휴대전화</span>
					</div>
					<div class="orderArea1_1">
						<input type="text" name="orderuphone" id="orderuphone" size="12"
							value="${user.phone }" required="required">
					</div>
				</div>
				<div class="order3">
					<div class="orderArea1">
						<span>이메일</span>
					</div>
					<div class="orderArea1_1">
						<input type="text" name="orderuemail" id="orderuemail" size="30"
							value="${user.useremail }" >
					</div>
				</div>
				<div class="order2">
					<div class="orderArea6">배송메세지</div>
					<div class="orderArea6_1">
						<textarea class="odertext" name="ordermg" id="ordermg"></textarea>
					</div>
				</div>
			</div>

			<!--결제 수단-->
			<div class="orderArea">
				<h2>결제 수단</h2>
				<br>
				<div class="pay">
					<div class="paylast">
					<div class="pay1">
						<input type="radio" value="카드결제" id="deltype" name="deltype"
							checked> <label>카드결제 </label><input type="radio"
							value="무통장입금" id="deltype" name="deltype"> <label>무통장
							입금</label>
					</div>
                                <div class="pay2"><div class="pay3_1" id="pay3_1"><span id="cardc">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span></div>
                               <div class="pay2_1" id="pay2_1">
                               <div class="pay2_2"><span>결제 안내</span></div>
                               <div class="pay2_3"></div><label for="holder">입금자</label> <input type="text" id="payuname" name="payuname" size="12" > <span id="moneyc">(입금계좌 국민은행 05100204153630 예금주 이태관)</span></div>
                               </div>
                     </div>
                     					<div class="paybtn">
						<span id="cardp">카드 결제 최종금액</span> <span id="moneyp">무통장 입금
							최종금액</span><br>
						<span id="oprice" class="format-money">${totalprice }</span> <span id="oprice">원</span><br><br>
						<input type="button" class="paystart" id="check_module" value="결제하기">
						<input type="submit" class="paystart" id="paystart2" value="결제하기">
						<!-- 결제하기(무통) -->
					</div>
				</div>
				<input type="hidden" name="orderstatus" id="orderstatus" />
				<input type="hidden" name="del" id="del"/>
				<input type="hidden" name="postno" id="postno" value=""/>
			</div>
		</form>
		<!--무이자 할부 이용안내-->
		<div class="paycomment">
			<p class="comment1">할부 이용안내</p>
			<br>
			<p class="comment2">무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우
				전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.</p>
			<p class="comment2">무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기
				바랍니다.</p>
		</div>

		<!--이용안내-->
		<div class="paycomment2">
			<p class="comment1">아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</p>
			<br>
			<p class="comment2">KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</p>
			<p class="comment2">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능</p>
			<p class="comment2">(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</p>
			<p class="comment2">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후
				재시작해야만 결제가 가능합니다.</p>
			<p class="comment2">(무통장 포함)</p>
			<br>
			<p class="comment1">세금계산서 발행 안내</p>
			<br>
			<p class="comment2">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만
				요청하실 수 있습니다.</p>
			<p class="comment2">세금계산서는 사업자만 신청하실 수 있습니다.</p>
			<p class="comment2">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</p>
			<p class="comment2">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로
				사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</p>
			<p class="comment2">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</p>
			<br>
			<p class="comment1">부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</p>
			<br>
			<p class="comment2">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에
				대해서는 세금계산서 발행이 불가하며</p>
			<p class="comment2">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</p>
			<p class="comment2">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서
				발행이 가능함을 양지하여 주시기 바랍니다.</p>
			<br>
			<p class="comment1">현금영수증 이용안내</p>
			<br>
			<p class="comment2">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로,
				예치금)에 대해 발행이 됩니다.</p>
			<p class="comment2">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</p>
			<p class="comment2">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</p>
			<p class="comment2">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경
				될 수 있습니다.)</p>
			<p class="comment2">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</p>
		</div>
		<c:forEach var="Imagelist" items="${imglist }">
				<input type="hidden" class="img_uuid" value="${Imagelist.uuid }">
				<input type="hidden" class="img_uploadPath" value="${Imagelist.uploadPath }">
				<input type="hidden" class="img_fileName" value="${Imagelist.fileName }">
				<input type="hidden" class="img_fileType" value="${Imagelist.fileType }">
		</c:forEach>
	</div>
	<script>
		$("#check_module").click(function() {
			var IMP = window.IMP;
			IMP.init('imp05668421');
			IMP.request_pay({
				pg : 'inicis',
				pay_method : 'card',
				merchant_uid : "12" + new Date().getTime(),
				name : "B.A. GOODS",
				amount : totalprice.value,
				buyer_email : orderuemail.value,
				buyer_name : orderuname.value,
				buyer_tel : orderuphone.value,
				buyer_addr : orderuaddr2.value,
				buyer_postcode : orderuaddr1.value
			},
			
			function(rsp) {
			    
			    var ordercamount = '';
			    var ordercpno ='';
			    var ordercprice='';
			    var temp = document.getElementsByName('ordercamountlist');
			    var temp2 = document.getElementsByName('ordercpnolist');
			    var temp3 = document.getElementsByName('ordercpricelist');
			    var tempid = ''+document.getElementById('userid').value;
			    for(var i=0; i<temp.length; i++) {
			    	ordercamount += temp[i].value;
			    	ordercpno += temp2[i].value;
			    	ordercprice += temp3[i].value;
			    	
			    	if(i!= (temp.length-1)) {
			    		ordercamount += ',';
			    		ordercpno += ',';
			    		ordercprice += ',';
			    	}
			    }
			    
			    console.log(tempid);
			    
			    
				if ( rsp.success ) {
			    	var Data={
			    			"ordermg" : ordermg.value,
			    			"totalprice" : totalprice.value,
			    			"userid" :  tempid,
			    			"deltype" : del.value,
			    			"ordercprice" : ordercprice,
			    			"ordercamount" : ordercamount,   
			    			"ordercpno" : ordercpno,
			    			"orderuname" : rsp.buyer_name,
			    			"orderuaddr1" : rsp.buyer_postcode,
			    			"orderuaddr2" : rsp.buyer_addr,
			    			"orderuaddr3" : orderuaddr3.value,
			    			"orderuemail" : rsp.buyer_email,
			    			"orderuphone" : rsp.buyer_tel,
			    			"orderstatus" : orderstatus.value,
			    			"postno" : postno.value,
			    		}
			    	
			    	console.log(Data);
			    	
			      let parameterName='${_csrf.headerName}';
			      let token='${_csrf.token}';
			    	jQuery.ajax({
			    		url: "/payinsert/complete", //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
			    		dataType: 'JSON',
			    		contentType: "application/json; charset=utf-8",
			    		data: JSON.stringify(Data),
			            beforeSend : function(xhr){
			             xhr.setRequestHeader(parameterName, token);
			          }
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		});
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num; 
 			        location.href="/mypage"; 
			        
			     } else {

			        // 결제 실패 시 로직,
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;

			     }
			});
		});
		
		
		/* 도로명주소 api */
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=orderuaddr1]").val(data.zonecode);
					$("[name=orderuaddr2]").val(fullRoadAddr);

					/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
					document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				}
			}).open();
		}
	</script>
</body>
</html>