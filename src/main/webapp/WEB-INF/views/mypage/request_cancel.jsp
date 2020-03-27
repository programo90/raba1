<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/mypage/style.css">
    <!-- <link rel="stylesheet" href="./resources/css/common.css"> -->

    <!-- 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<script src="/resources/js/cafe/cafe.js"></script> -->
    <title>Insert title here</title>
</head>

<body class="block">
    <div class="mt-2">
        <div class="bg-gray-50">
            <div
                class="max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center lg:justify-between">
                <h2 class="text-4xl leading-9 font-extrabold text-gray-900 sm:text-5xl sm:leading-none">
                    회원님 안녕하세요!
                    <br />
                    <span class="text-indigo-600">BREAK AWAY</span>
                </h2>
                <div class="mt-8 flex lg:mr-0 inline-flex lg:flex-shrink-0 lg:mt-0">
                    <div class="inline-flex rounded-md shadow">
                        <a href="#"
                            class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
                            주행거리 확인
                        </a>
                    </div>
                    <div class="ml-3 inline-flex rounded-md shadow">
                        <a href="#"
                            class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-indigo-600 bg-white hover:text-indigo-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
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
                                주문 취소 요청 <span class="text-blue-600 ">${id}</span>
                            </h3>
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">
                                order date 2020-03-12
                            </p>
                        </div>
                        <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-gray-500">주문하신 상품 단위로 취소요청이 가능합니다.(수량 부분취소
                                불가)<br>상품이 발송되기 전에 취소요청을 하실 수 있습니다.</p>
                            <p class="mt-1 max-w-2xl text-sm leading-5 text-red-700">단, 상품을 이미 발송한 경우 취소처리가 거부될 수
                                있습니다.<br>쿠폰을 사용한 주문을 취소/반품하여 쿠폰 사용이 취소된 경우 유효기간이 경과하지 않았으면 반환되어 다시 사용이 가능합니다.<br>(쿠폰의 경우
                                모든 상품을 취소/반품해야 반환됩니다.)</p>
                        </div>
                        <div class="px-4 py-5 sm:px-6">
                            <form class="w-full max-w-sm">
                                <div class="md:flex md:items-center mb-6">
                                    <div class="md:w-1/3">
                                        <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4"
                                            for="inline-full-name">
                                            취소 사유 선택
                                        </label>
                                    </div>
                                    <div class="md:w-2/3 inline-block relative w-64">
                                        <select
                                            class="text-sm text-gray-700 block appearance-none w-full bg-white border border-gray-400 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline">
                                            <option>취소 사유 선택</option>
                                            <option value="INTENT_CHANGED">구매 의사 취소</option>
                                            <option value="COLOR_AND_SIZE">색상 및 사이즈 변경</option>
                                            <option value="WRONG_ORDER">다른 상품 잘못 주문</option>
                                            <option value="PRODUCT_UNSATISFIED">서비스 및 상품 불만족</option>
                                            <option value="DELAYED_DELIVERY">배송 지연</option>
                                            <option value="DROPPED_DELIVERY">배송 누락</option>
                                            <option value="SOLD_OUT">상품 품절</option>
                                            <option value="BROKEN">상품 파손</option>
                                            <option value="INCORRECT_INFO">상품 정보 상이</option>
                                            <option value="WRONG_DELIVERY">오배송</option>
                                            <option value="WRONG_OPTION">색상 등이 다른 상품을 잘못 배송</option>
                                        </select>
                                        <div
                                            class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                            <svg class="fill-current h-7 w-7" xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 20 20">
                                                <path
                                                    d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                                                </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="md:flex md:items-center mb-6">
                                    <div class="md:w-1/3">
                                        <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4"
                                            for="inline-username">
                                            취소 요청 내용
                                        </label>
                                    </div>
                                    <div class="box border rounded flex flex-col shadow bg-white md:w-2/3">
                                        <textarea placeholder=" Hey, What's the matter?"
                                            class="h-32 resize-none border rounded "></textarea>
                                    </div>
                                </div>

                                <div class="md:flex md:items-center">
                                    <div class="md:w-1/3"></div>
                                    <div class="md:w-2/3">
                                        <button
                                            class="shadow bg-teal-500 hover:bg-teal-400 focus:shadow-outline focus:outline-none text-white font-semibold py-1 px-2 rounded-lg"
                                            type="button">
                                            주문 취소
                                        </button>
                                    </div>
                                </div>
                            </form>
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
                                        무통장 입금
                                    </dd>
                                </div>
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
                                        할인 혜택
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        Yellow 등급 혜택 <br>
                                        상품 구매 시 15% 할인 혜택 적용
                                    </dd>
                                </div>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="xl:w-1/2 w-100% m-5 bg-white shadow overflow-hidden sm:rounded-lg">
                    <div class="px-4 py-5 border-b border-gray-200 sm:px-6">
                        <h3 class="text-lg leading-6 font-medium text-gray-900">
                            취소 상품 정보
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
                                        <li class="flex items-center justify-between ">
                                            <img src="./resources/img/mypage/product.png" alt="product" class="m-3 my-auto h-12 w-12 flex-shrink-0">
                                            <div class="px-3 py-2 w-full flex items-center justify-between leading-none xl:px-0">
                                                <div class="truncate">
                                                   <p class="xl:w-32 truncate pb-2"> Spream acho-bag 300*200</p> 
                                                    <span class="text-gray-400 text-sm">49,000원 / 1ea</span> <br>
                                                    <button class="mt-1 bg-gray-400 hover:bg-gray-500 text-white px-1 py-1 rounded-lg text-xs">
                                                        취소
                                                    </button>
                                                </div>
                                                <div class="text-gray-600 text-sm px-2">입금대기</div>
                                            </div>
                                        </li>
                                        <li class="flex items-center justify-between">
                                            <img src="./resources/img/mypage/product2.png" alt="product2" class="m-3 my-auto h-12 w-12 flex-shrink-0">
                                            <div class="px-3 py-2 w-full flex items-center justify-between leading-none xl:px-0">
                                                <div>
                                                    <p class="w-48 xl:w-32 truncate pb-2">Digital Camera lens 300*200</p>  
                                                    <span class="text-gray-400 text-sm">49,000원 / 1ea</span> <br>
                                                    <button class="mt-1 bg-gray-400 hover:bg-gray-500 text-white px-1 py-1 rounded-lg text-xs">
                                                        취소
                                                    </button>
                                                </div>
                                                <div class="text-gray-600 text-sm px-2">입금대기</div>
                                            </div>
                                        </li>
                                    </ul>
                                </dd>
                            </div>
                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    상품 가격
                                </dt>
                                <dd class="mt-개 text-sm justify-end leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    $120,000
                                </dd>
                            </div>
                            <div
                                class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 border-b-2 border-gray-100">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    배송비
                                </dt>
                                <dd class="mt-1 text-sm justify-end leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    $120,000
                                </dd>
                            </div>
                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 ">
                                <dt class="text-sm leading-5 font-semibold text-gray-600">
                                    환불 예정 금액
                                </dt>
                                <dd class="mt-1 text-2xl leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    $240,000
                                </dd>
                            </div>
                           
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
</body>

</html>