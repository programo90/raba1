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
              <h2 class="text-4xl leading-9 font-extrabold text-gray-900 sm:text-5xl sm:leading-none">
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
                                주문 정보 ${userinfo.username } <span class="text-blue-600 ">3582365935</span>
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
                                        정일진 / 010-9009-000 <br>
                                        iljin10637@gmail.com
                                    </dd>
                                </div>
                                <div class="bg-white items-center px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                    <dt class="text-sm  leading-5 font-medium text-gray-500">
                                        배송 정보
                                    </dt>
                                    <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                        정일진 / 010-9009-000 <br>
                                        (12314) 경기도 성남시 중원구 광명로 101 <br>
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
                                        문앞에 놓아주세요!  <br>
                                        현관 비밀 번호는 없습니다! 잘부탁드립니다. 
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
                            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 border-b-2 border-gray-100">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    배송비
                                </dt>
                                <dd class="mt-1 text-sm justify-end leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    $120,000
                                </dd>
                            </div>
                            <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6 ">
                                <dt class="text-sm leading-5 font-semibold text-gray-600">
                                    결제 금액
                                </dt>
                                <dd class="mt-1 text-xl leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    $240,000
                                </dd>
                            </div>
                            <!-- <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    About
                                </dt>
                                <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim incididunt cillum culpa
                                    consequat. Excepteur qui ipsum aliquip consequat sint. Sit id mollit nulla mollit
                                    nostrud in ea officia proident. Irure nostrud pariatur mollit ad adipisicing
                                    reprehenderit deserunt qui eu.
                                </dd>
                            </div> -->
                            <!-- <div class="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt class="text-sm leading-5 font-medium text-gray-500">
                                    Attachments
                                </dt>
                                <dd class="mt-1 text-sm leading-5 text-gray-900 sm:mt-0 sm:col-span-2">
                                    <ul class="border border-gray-200 rounded-md">
                                        <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm leading-5">
                                            <div class="w-0 flex-1 flex items-center">
                                                <svg class="flex-shrink-0 h-5 w-5 text-gray-400" fill="currentColor"
                                                    viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd"
                                                        d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z"
                                                        clip-rule="evenodd" />
                                                </svg>
                                                <span class="ml-2 flex-1 w-0 truncate">
                                                    resume_back_end_developer.pdf
                                                </span>
                                            </div>
                                            <div class="ml-4 flex-shrink-0">
                                                <a href="#"
                                                    class="font-medium text-indigo-600 hover:text-indigo-500 transition duration-150 ease-in-out">
                                                    Download
                                                </a>
                                            </div>
                                        </li>
                                        <li
                                            class="border-t border-gray-200 pl-3 pr-4 py-3 flex items-center justify-between text-sm leading-5">
                                            <div class="w-0 flex-1 flex items-center">
                                                <svg class="flex-shrink-0 h-5 w-5 text-gray-400" fill="currentColor"
                                                    viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd"
                                                        d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z"
                                                        clip-rule="evenodd" />
                                                </svg>
                                                <span class="ml-2 flex-1 w-0 truncate">
                                                    coverletter_back_end_developer.pdf
                                                </span>
                                            </div>
                                            <div class="ml-4 flex-shrink-0">
                                                <a href="#"
                                                    class="font-medium text-indigo-600 hover:text-indigo-500 transition duration-150 ease-in-out">
                                                    Download
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </dd>
                            </div> -->
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>