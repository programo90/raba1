<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage/style.css">
<!-- <link rel="stylesheet" href="./resources/css/common.css"> -->

<!-- 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<script src="/resources/js/cafe/cafe.js"></script> -->
<title>Insert title here</title>

</head>
<body class="block">
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
                                        (${orderinfo.orderuaddr1 }) ${orderinfo.orderuaddr2 } ${orderinfo.orderuaddr3 } <br>
                                        101호 <br>
                                        <button class="bg-white mt-2 hover:bg-gray-100 text-gray-800 font-normal py-1 px-2 border border-gray-400 rounded-full shadow">
                                            배송정보 수정
                                          </button>
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
						                                        <button class="bg-white hover:bg-gray-100 text-gray-800 font-normal py-1 px-2 -ml-2 -mt-1 border border-gray-400 rounded-full shadow">
						                                            현금영수증 신청
						                                          </button>
						                                          <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
						                                            주문일로부터 5일이 지나면 신청이 불가능합니다.
						                                        </p>
						                                    </dd>
						                                </div>
													</c:when>
													<c:when test="${orderinfo.deltype eq '카드결제' }">
													카드결제  페이지를 꾸며주세요. 작성하세요 ~~~
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
                                                    <span class="text-gray-400 text-sm">${goodsinfo.p_price }원 / 1ea</span> <br>
                                                    
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
                                   ${orderinfo.totalprice  }원   
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
                                   ${orderinfo.totalprice  }원   
                                </dd>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>