 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/mypage/style.css">
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
document.getElementsByClassName('adminnav')[5].style.backgroundColor="#e8e8e8";
	$(document).ready(function(){
		
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
		
	});
</script>
 <script src="/resources/js/goods/list_goods.js"></script>
 </head>
 <body>
         <div class="admincontents">
             <div class="admin_userbox">
                 관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
             </div>
             <section class="admin_sectionbox">
                 <!-- 여기서 div만들고 시작하세요 controller에 file등록하고 사용하세요! ~~  -->
            <div class="w-full block lg:-mt-5 lg:flex lg:w-12/12 min-h-screen antialiased bg-white">
                <div class="lg:w-1/2">
                    <div class="w-100% m-5 bg-white shadow overflow-hidden sm:rounded-lg">
                        <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">
                                주문 정보  <span class="text-blue-600 ">${orderinfo.oderno }</span>
                            </h3>
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
                                order date <span>${orderinfo.salesdate }</span>
                            </p>
                        </div>
                        <div>
                            <dl>
                                <div class="bg-gray-50 items-center px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm leading-5 font-medium text-gray-500">
                                        주문자
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        ${orderinfo.username } / ${orderinfo.phone } <br>
                                        ${orderinfo.useremail }
                                    </dd>
                                </div>
                                <div class="bg-white items-center px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm  leading-5 font-medium text-gray-500">
                                        배송 정보
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        ${orderinfo.orderuname } / ${orderinfo.orderuphone } <br>
                                        (${orderinfo.orderuaddr1 }) ${orderinfo.orderuaddr2 } ${orderinfo.orderuaddr3 } <br>
                                        101호 <br>
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
						                                        현금영수증
						                                    </dt>
						                            	<dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
						                                        ${orderinfo.cashreceipts }
						                                    </dd>
						                                </div>
													</c:when>
													<c:when test="${orderinfo.deltype eq '카드결제' }">
													</c:when>
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
                                                    <span class="text-gray-400 text-sm"> <span class="format-money"> ${goodsinfo.p_price }</span> 원 / 1ea</span> <br>
                                                    
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
                                   <span class="format-money">${orderinfo.totalprice  } </span>원   
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
                                   <span class="format-money">${orderinfo.totalprice  }</span> 원   
                                </dd>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>
            </section>
        </div>
 </body>
 </html>