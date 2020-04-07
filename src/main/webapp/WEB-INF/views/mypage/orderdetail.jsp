<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage/style.css">
	   	<!-- ajax script -->
	    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	    <!-- END ajax script -->
<title>Insert title here</title>

</head>
<body class="block">

<!-- 모달(현금영수증 신청)  -->
	<div class="main-modal3 fixed w-full h-full inset-0 z-50 overflow-hidden flex justify-center items-center animated3 fadeIn3 faster"
		style="background: rgba(0,0,0,.7);">
		
        <!--Title-->
		<div class="modal-container flex mx-auto justify-center px-4 sm:px-0 z-50 w-full sm:w-3/4 xl:w-1/2 ">

            
            <div class="modal-content flex rounded-lg shadow-lg w-full  bg-white sm:mx-0" style="height: 500px">
                <div class="flex flex-col w-full md:w-1/2 p-4">
                    <div class="flex flex-col flex-1 justify-center m-0 mb-8">
                        <div class="w-full mt-4">
                            <form class="form-horizontal w-3/4 mx-auto" id="frm" method="POST">
                            <!-- form안에 아래의 csrf input을 넣어주세요 -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<input type="hidden" value="${orderinfo.oderno }" id="oderno"/>
								<p class="text-gray-800 text-center font-4xl font-extrabold">현금 영수증 신청</p>
								<div class="mt-2">
									<input  class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="cashreceipts" name="cus_name" type="number"  placeholder="번호를 입력해주세요 " >
								</div>
								<div class="mt-3 flex">
								  <button class="px-2 py-1 mx-auto text-white font-normal tracking-wider bg-gray-700 hover:bg-gray-800 rounded text-sm" onclick="updateCashReceipts()"> 신청하기 </button>
								</div>
                            </form>
                            
                        </div>
                    </div>
                </div>
                
                <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80'); background-size: cover; background-position: center center;">
                    <div class="flex justify-end items-center pb-3">
            
                        <div class="modal-close3 cursor-pointer z-50">
                            <svg class="fill-white text-2xl p-2  " xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                viewBox="0 0 18 18">
                                <path
                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                </path>
                            </svg>
                        </div>
                    </div>
                </div>
                
            </div>
            
		</div>
	</div>
<!-- END 모달html(현금영수증 신청)  -->


<!-- 모달(배송정보 수정 신청)  -->
	<div class="main-modal2 fixed w-full h-full inset-0 z-50 overflow-hidden flex justify-center items-center animated2 fadeIn2 faster"
		style="background: rgba(0,0,0,.7);">
		
        <!--Title-->
		<div class="modal-container flex mx-auto justify-center px-4 sm:px-0 z-50 w-full sm:w-3/4 md:w-1/2 ">

            
            <div class="modal-content flex rounded-lg shadow-lg w-full  bg-white sm:mx-0" style="height: 500px">
                <div class="flex flex-col w-full md:w-1/2 p-4">
                    <div class="flex flex-col flex-1 justify-center m-0 mb-8">
                        <div class="w-full mt-4">
                            <form class="form-horizontal w-3/4 mx-auto"  method="POST" >
                            <!-- form안에 아래의 csrf input을 넣어주세요 -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<p class="text-gray-800 font-4xl font-extrabold">배송정보 수정 </p>
								<div class="">
								  <label class="block text-sm text-gray-600" for="cus_name">받는 이 </label>
								  <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="orderuname" name="cus_name" type="text" required="" placeholder="Your Name" aria-label="Name" value="${orderinfo.orderuname }">
								</div>
								<div class="mt-2">
									<label class="block text-sm text-gray-600" for="cus_name">전화 번호</label>
									<input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="orderuphone" name="cus_name" type="text" required="" placeholder="Your phone number" aria-label="Name" value="${orderinfo.orderuphone}">
								</div>
								<div class="mt-2">
									<label class=" block text-sm text-gray-600" for="cus_email">주소</label>
									<input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="orderuaddr2" name="cus_email" type="text" required="" placeholder="도로명 주소" aria-label="Email" value="${orderinfo.orderuaddr2}">
								</div>
								<div class="mt-2">
									<label class="hidden text-sm block text-gray-600" for="cus_email">상세 주소</label>
									<input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="orderuaddr3" name="cus_email" type="text" required="" placeholder="상세주소" aria-label="Email" value="${orderinfo.orderuaddr3}">
								</div>
								<div class="inline-block mt-2 w-1/2 pr-1">
									<label class="hidden block text-sm text-gray-600" for="cus_email">우편번호</label>
									<input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="orderuaddr1" name="cus_email" type="text" required="" placeholder="우편번호" aria-label="Email" value="${orderinfo.orderuaddr1}">
								</div>
								<div class="mt-2">
									<label class="block text-sm text-gray-600 " for="cus_msg">배송 메모 </label>
									<input class="w-full px-5  py-4 text-gray-700 bg-gray-200 rounded text-xs" id="ordermg" name="cus_email" type="text" required="" placeholder="Your Email" aria-label="Email" value="${orderinfo.ordermg}">
								</div>
								<div class="mt-3 flex">
								  <button class="px-2 py-1 mx-auto text-white font-normal tracking-wider bg-gray-700 hover:bg-gray-800 rounded text-sm" onclick="updateShipInfo()" >수정 완료</button>
								</div>
                            </form>
                            
                        </div>
                    </div>
                </div>
                
                <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80'); background-size: cover; background-position: center center;">
                    <div class="flex justify-end items-center pb-3">
            
                        <div class="modal-close2 cursor-pointer z-10">
                            <svg class="fill-white text-2xl p-2  " xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                viewBox="0 0 18 18">
                                <path
                                    d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
                                </path>
                            </svg>
                        </div>
                    </div>
                </div>
                
            </div>
            
		</div>
	</div>
<!-- END 모달(배송정보 수정 신청)  -->


    <div class="mt-2">
        <div class="bg-gray-50">
            <div class="max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center lg:justify-between">
              <h2 class=" text-4xl leading-9 font-extrabold text-gray-900 sm:text-5xl sm:leading-none abc">
               회원님 안녕하세요!
                <br />
                <span class="text-indigo-600">BREAK AWAY</span>
              </h2>
              <div class="mt-8 flex lg:mr-0 inline-flex lg:flex-shrink-0 lg:mt-0">
                <div class="inline-flex rounded-md shadow">
                  <a href="#" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
                    주행거리 확인
                  </a>
                </div>
                <div class="ml-3 inline-flex rounded-md shadow">
                  <a href="#" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-indigo-600 bg-white hover:text-indigo-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
                    라이딩 일정 확인
                  </a>
                </div>
              </div>
            </div>
          </div>
    </div>
    <div class="w-full max-w-screen-xl mx-auto px-6">
        <div class="lg:flex  -mx-6">
            <div class="hidden bg-white ml-5  lg:w-2/12 lg:grid ">
                <ul class="list-reset">
                    <li class="inline-block mr-10 ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600 ">주문 내역</a>
                    </li>
                    <li class="inline-block mr-10  ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600">위시 리스트</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600">주행 거리</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600">정보 수정</a>
                    </li>
                </ul>
            </div>
            <div class="w-full block lg:-mt-8 lg:flex lg:w-10/12 min-h-screen antialiased bg-white">
                <div class="lg:w-1/2">
                    <div class="w-100% m-5 bg-white shadow overflow-hidden sm:rounded-lg">
                        <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">
                                주문 정보  <span class="text-blue-600 ">${orderinfo.oderno }</span>
                            </h3>
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
                                order date 2020-03-12
                            </p>
                        </div>
                        <div>
                            <dl>
                                <div class="bg-gray-50 items-center px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        주문자
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        ${userinfo.username } / ${userinfo.phone } <br>
                                        ${userinfo.useremail }
                                    </dd>
                                </div>
                                <div class="bg-white items-center px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm  leading-5 font-medium text-gray-500">
                                        배송 정보
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        ${orderinfo.orderuname } / ${orderinfo.orderuphone } <br>
                                        (${orderinfo.orderuaddr1 }) ${orderinfo.orderuaddr2 } <br>
                                         ${orderinfo.orderuaddr3 }
                                    <c:choose>
										<c:when test="${orderinfo.orderstatus == '결제대기'}">
                                          	<br>
                                        	<button onclick="openModal2()" class="bg-white mt-2 hover:bg-gray-100 text-gray-800 font-normal py-1 px-2 border border-gray-400 rounded-full shadow">
                                            	배송정보 수정
                                         	</button>
                                        </c:when>
                                        <c:when test="${orderinfo.orderstatus == '결제완료'}">
                                          	<br>
                                        	<button onclick="openModal2()" class="bg-white mt-2 hover:bg-gray-100 text-gray-800 font-normal py-1 px-2 border border-gray-400 rounded-full shadow">
                                            	배송정보 수정
                                         	</button>
                                        </c:when>
                                        <c:otherwise/>
                                    </c:choose>
                                    </dd>
                                </div>
                                <div class="bg-gray-50 items-center px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        배송메모
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        ${orderinfo.ordermg}
                                    </dd>
                                </div>
                            </dl>
                        </div>
                        
                    </div>
                    <div class="w-100% m-5 bg-white shadow overflow-hidden sm:rounded-lg">
                        <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">
                                결제 정보 
                            </h3>
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
                                Payment information
                            </p>
                        </div>
                        
                        <div>
                            <dl>
                                <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        결제 방법
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        ${orderinfo.deltype }
                                    </dd>
                                </div>
                                
                                
                                
                                
                                				<c:choose>
													<c:when test="${orderinfo.deltype eq '무통장입금' }">
						                                <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
						                                    <dt class="text-sm leading-5 font-medium text-gray-500">
						                                        계좌 정보 
						                                    </dt>
						                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
						                                        농협 352-23525-01-223 예금주: 정일진(RABA) 
						                                    </dd>
						                                </div>
						                                <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
						                                    <dt class="text-sm leading-5 font-medium text-gray-500">
						                                        입금 기간
						                                    </dt>
						                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
						                                        2020-03-18 22:07 까지
						                                    </dd>
						                                </div>
						                                
						                                <div class="bg-white  px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
						                                    <dt class="text-sm  leading-5 font-medium text-gray-500">
						                                        현금영수증 ${orderinfo.cashreceipts eq null}
						                                    </dt>
						                                    
						                                 
						                                    <c:choose>
						                                    	<c:when test="${orderinfo.cashreceipts eq null}">
								                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
								                                        <button onclick="openModal3()" class="bg-white hover:bg-gray-100 text-gray-800 font-normal py-1 px-2 -ml-2 -mt-1 border border-gray-400 rounded-full shadow">
								                                            현금영수증 신청
								                                          </button>
								                                          <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
								                                            주문일로부터 5일이 지나면 신청이 불가능합니다.
								                                        </p>
								                                    </dd>
						                                    	</c:when>
						                                    	<c:otherwise>
						                                    			<dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
						                                       				현금영수증 신청이 완료되었습니다.  
						                                    			</dd>
						                                    	</c:otherwise>
						                                    </c:choose>
						                                    
						                                    
						                                </div>
													</c:when>
													<c:when test="${orderinfo.deltype eq '카드결제' }">
													</c:when>
													<c:otherwise>
											          판매자에게 문의하세요.
											         </c:otherwise> 
												</c:choose>
						                                
						                                
						                                
						                                
                               
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="xl:w-1/2 w-100% m-5 bg-white shadow overflow-hidden sm:rounded-lg">
                    <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                        <h3 class="text-lg leading-6 font-medium text-gray-900">
                            상품 정보
                        </h3>
                        <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
                            Product information
                        </p>
                    </div>
                    <div>
                        <dl>
                            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    상품 내역
                                </dt>
                                <dd class="mt-1 sm:mt-0 sm:col-span-2">
                                    <ul class="rounded-lg bg-white shadow-md overflow-hidden">
                                    
                                     <c:forEach var="goodsinfo" items="${goodslist}">
                                        <li class="flex items-center justify-between py-6 border-b border-gray-200 last:border-b-0 ">
                                            <img src="/resources/img/mypage/product.png" alt="product" class="m-3 my-auto h-12 w-12 flex-shrink-0">
                                            <div class="px-3 py-2 w-full flex items-center justify-between leading-none xl:px-0">
                                                <div class="truncate">
                                                    <p class="xl:w-32 truncate pb-2"> ${goodsinfo.p_name }</p> 
                                                    <span class="text-gray-400 text-sm"><span class="format-money">${goodsinfo.p_price }</span>원 / 1ea</span> <br>
                                                    
                                                </div>
                                                <div class="text-gray-600 text-sm px-2">${goodsinfo.orderstatus}</div>
                                            </div>
                                        </li>
                                      </c:forEach>
                                       
                                    </ul>
                                </dd>
                            </div>
                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    상품 가격
                                </dt>
                                <dd class="mt-개 text-sm justify-end leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                   <span class="format-money">${orderinfo.totalprice  }</span>원   
                                </dd>
                            </div>
                            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 border-b-2 border-gray-100">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    배송비
                                </dt>
                                <dd class="mt-1 text-sm justify-end leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                  	무료 
                                </dd>
                            </div>
                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 ">
                                <dt class="text-sm leading-5 font-semibold text-gray-600">
                                    결제 금액
                                </dt>
                                <dd class="mt-1 text-xl leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                   <span class="format-money">${orderinfo.totalprice  }</span>원   
                                </dd>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<script>
	
	/* 모달 스크립트 (배송정보 수정 신청)  */ 
		const modal2 = document.querySelector('.main-modal2');
		const closeButton2 = document.querySelectorAll('.modal-close2');

		const modalClose2 = () => {
			modal2.classList.remove('fadeIn2');
			modal2.classList.add('fadeOut2');
			setTimeout(() => {
				modal2.style.display = 'none';
			}, 500);
		}

		const openModal2 = () => {
			modal2.classList.remove('fadeOut2');
			modal2.classList.add('fadeIn2');
			modal2.style.display = 'flex';
		}

		for (let i = 0; i < closeButton2.length; i++) {

			var elements = closeButton2[i];

			elements.onclick = (e) => modalClose2();

			modal2.style.display = 'none';

		}
		/* END 모달 스크립트 (배송정보 수정 신청)  */ 
		
		/* 모달 스크립트 (현금영수증 신청)  */ 
		const modal3 = document.querySelector('.main-modal3');
		const closeButton3 = document.querySelectorAll('.modal-close3');

		const modalClose3 = () => {
			modal3.classList.remove('fadeIn3');
			modal3.classList.add('fadeOut3');
			setTimeout(() => {
				modal3.style.display = 'none';
			}, 500);
		}

		const openModal3 = () => {
			modal3.classList.remove('fadeOut3');
			modal3.classList.add('fadeIn3');
			modal3.style.display = 'flex';
		}

		for (let i = 0; i < closeButton3.length; i++) {

			var elements = closeButton3[i];

			elements.onclick = (e) => modalClose3();

			modal3.style.display = 'none';

			window.onclick = function (event) {
				if (event.target == modal3) { modalClose3(); modalClose2();} 
				else if (event.target == modal2) { modalClose3(); modalClose2();}
			}
			/* 모달창을 닫아줄 때 사용합니다. if문을 사용해서 페이지에 있는 모든 modal창의 function을 체크해서 닫아주어야합니다.   */
			
		}
		/* END 모달 스크립트 (현금영수증 신청) */
		
			/* ajax script */
			function updateCashReceipts(){
				var oderno = document.getElementById('oderno').value;
				var cashreceipts = document.getElementById('cashreceipts').value;
				
				var tempdata = {"cashreceipts" : cashreceipts, "oderno" : oderno}; 
				$.ajax({
						url : '/updateCashReceipts'
						, data : tempdata
						, dataType: 'json'
						, contentType: 'application/json;charset=utf-8'
						, success : function(data){
							alert("현금영수증 신청을 완료했습니다"); 
						}
						, error : function(data){
							alert("에러 : 관리자에게 문의하세요");
						}
				
					});
				};
			/*  END ajax script */
			
			/* ajax script */
			function updateShipInfo(){
				console.log("ddd나와!!!" + oderno)
				var orderuname = document.getElementById('orderuname').value;
				var orderuphone = document.getElementById('orderuphone').value;
				var orderuaddr1 = document.getElementById('orderuaddr1').value;
				var orderuaddr2 = document.getElementById('orderuaddr2').value;
				var orderuaddr3 = document.getElementById('orderuaddr3').value;
				var ordermg = document.getElementById('ordermg').value;
				var oderno = document.getElementById('oderno').value;
				
				var tempdata = {"orderuname" : orderuname, "orderuphone" : orderuphone, "orderuaddr1" : orderuaddr1, "orderuaddr2" : orderuaddr2, "orderuaddr3" : orderuaddr3, "ordermg" : ordermg,  "oderno" : oderno }; 
				$.ajax({
						url : '/updateShipInfo'
						, data : tempdata
						, dataType: 'json'
						, contentType: 'application/json;charset=utf-8'
						, success : function(data){
							alert("현금영수증 신청을 완료했습니다"); 
						}
						, error : function(data){
							alert("에러 : 관리자에게 문의하세요");
						}
				
					});
				};
			/*  END ajax script */
			
			/* 콤마를찍어줍니다  */
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
    		/* END 콤마를찍어줍니다  class에 format-money를 작성해주세요 */
			
	</script>
    
</body>
</html>