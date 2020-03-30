<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    
    <!-- security session에서 userid를 불러옵니다. -->
    <sec:authorize access="isAuthenticated()">
      <sec:authentication property='principal.username' var="userid"/>
      <input type="text" id="userid" value="${userid}">      
   	</sec:authorize>
   	<!-- security session에서 userid를 불러옵니다. -->
   	
   		
        <div class="mt-2">
            <div class="bg-gray-50">
                <div class="max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center lg:justify-between">
                  <h2 class="text-4xl leading-9 font-extrabold text-gray-900 sm:text-5xl sm:leading-none">
                		${username}님 안녕하세요! 
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
                        <a href="/mypage" class="block p-4 text-gray-800 font-bold hover:text-purple-600 hover:font-bold ">주문 내역</a>
                    </li>
                    <li class="inline-block mr-10  ">
                        <a href="/wishlist/${userid}" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">위시 리스트</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">주행 거리</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="#" onclick="openModal()" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">정보 수정</a>
                    </li>
                </ul>
            </div>
                
                <div class="w-full lg:w-10/12 min-h-screen antialiased bg-white">
                    <div class="container mx-auto px-4 sm:px-8">
                        <div >
                            <div>
                                <h2 class="text-gray-800 text-2xl font-semibold leading-tight">주문 내역</h2>
                            </div>

                            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
		                    	<table class="table-fixed min-w-full leading-normal">
			                     	<thead>
			                           	<tr>
		                                 	<th class="w-5/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
			                                  	product
		                                	</th>
                                            <th class="hidden md:table-cell w-3/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                price
                                            </th>
                                            <th class="hidden md:table-cell w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                order date
                                            </th>
                                            <th class="w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                Status
                                            </th>
                                        </tr>
		                        	 </thead>
			                         <tbody>
			                     		<tr class=" border-b border-gray-200 ">	
			                          		<td class=" flex items-center px-5 py-5 bg-white text-sm">
			                               		<img src="./resources/img/mypage/product.png" alt="product" class="m-3 my-auto h-12 w-12 flex-shrink-0">
				                               	<div class="px-3 py-2 w-full flex items-center justify-between leading-none">
				                                   <div class="truncate">
				                                       <a href="#"> Spream acho-bag 300*200</a> <br>
				                                       <span class="text-gray-400 text-sm">49,000원 / 1ea</span> <br>
				                                       <button
				                                           class="mt-1 bg-gray-400 hover:bg-gray-500 text-white px-1 py-1 rounded-lg text-xs focus:outline-none focus:shadow-outline">
				                                           주문서 보기
				                                       </button>
				                                   </div>
				                               </div>
			                                </td>
			                                <td
			                                    class="hidden md:table-cell px-5 py-5 border-b border-gray-200 bg-white text-sm text-center">
			                                    <span class="text-gray-900 text-sm">49,000원</span>
			                                </td>
			                                <td class="hidden md:table-cell  px-5 py-5 border-b border-gray-200 bg-white text-sm">
			                                    <p class="text-gray-900 whitespace-no-wrap">
			                                        Jan 21, 2020
			                                    </p>
			                                </td>
			                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
			                                    <div class="text-gray-500">
			                                        입금대기
			                                    </div>
			                                </td>
			                      		</tr>
			                    	</tbody>
			               		</table>
                                <div
                                    class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between          ">
                                    <span class="text-xs xs:text-sm text-gray-900">
                                        Showing 1 to 4 of 50 Entries
                                    </span>
                                    <div class="inline-flex mt-2 xs:mt-0">
                                        <button
                                            class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-l">
                                            Prev
                                        </button>
                                        <button
                                            class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-r">
                                            Next
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- (모달 html 시작)모달모달모달모달 @일진 -->
	<div class="main-modal fixed w-full h-full inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster" style="background: rgba(0,0,0,.7);">
		<div class="modal-container flex w-full mx-auto justify-center px-4 sm:px-0 z-50 sm:w-3/4 xl:w-1/2 ">
            <div class="modal-content flex rounded-lg shadow-lg w-full  bg-white sm:mx-0" style="height: 500px">
                <div class="flex flex-col w-full md:w-1/2 p-4">
                    <div class="flex flex-col flex-1 justify-center  m-0 mb-8">
                        <div class="w-full mt-4">
                            <form class="form-horizontal w-3/4 mx-auto" method="POST" action="#">
								<p class="text-gray-800 font-4xl font-extrabold">Customer information</p>
								<div class="">
								  <label class="block text-sm text-gray-600" for="cus_name">Name</label>
								  <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="cus_name" name="cus_name" type="text" required="" placeholder="Your Name" aria-label="Name">
								</div>
								<div class="mt-2">
								  <label class="block text-sm text-gray-600 " for="cus_email">Email</label>
								  <input class="w-full px-5  py-4 text-gray-700 bg-gray-200 rounded text-xs" id="cus_email" name="cus_email" type="text" required="" placeholder="Your Email" aria-label="Email">
								</div>
								<div class="mt-2">
									<label class="block text-sm text-gray-600" for="cus_name">Phone number</label>
									<input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="cus_name" name="cus_name" type="text" required="" placeholder="Your phone number" aria-label="Name">
								  </div>
								<div class="mt-2">
								  <label class=" block text-sm text-gray-600" for="cus_email">Address</label>
								  <input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="cus_email" name="cus_email" type="text" required="" placeholder="도로명 주소" aria-label="Email">
								</div>
								<div class="mt-2">
								  <label class="hidden text-sm block text-gray-600" for="cus_email">상세 주소</label>
								  <input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="cus_email" name="cus_email" type="text" required="" placeholder="상세주소" aria-label="Email">
								</div>
								<div class="inline-block mt-2 w-1/2 pr-1">
								  <label class="hidden block text-sm text-gray-600" for="cus_email">우편번호</label>
								  <input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="cus_email" name="cus_email" type="text" required="" placeholder="우편번호" aria-label="Email">
								</div>
								<div class="text-center mt-2">
									<a class="no-underline hover:underline text-blue-dark text-xs text-gray-600" href="#">
										프로필 사진은 카카오에서 변경이 가능합니다.
									</a>
								</div>
								<div class="mt-3 flex">
								  <button class="px-2 py-1 mx-auto text-white font-normal tracking-wider bg-gray-700 hover:bg-gray-800 rounded text-sm" type="submit">수정 완료</button>
								</div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80'); background-size: cover; background-position: center center;">
                    <div class="flex justify-end items-center pb-3">
                        <div class="modal-close cursor-pointer z-50">
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
	<!-- (모달 html 끝)모달모달모달모달 @일진 -->
	<!-- (모달 script 시작)모달모달모달모달 @일진 -->
	<script>
		const modal = document.querySelector('.main-modal');
		const closeButton = document.querySelectorAll('.modal-close');

		const modalClose = () => {
			modal.classList.remove('fadeIn');
			modal.classList.add('fadeOut');
			setTimeout(() => {
				modal.style.display = 'none';
			}, 500);
		}

		const openModal = () => {
			modal.classList.remove('fadeOut');
			modal.classList.add('fadeIn');
			modal.style.display = 'flex';
		}

		for (let i = 0; i < closeButton.length; i++) {

			const elements = closeButton[i];

			elements.onclick = (e) => modalClose();

			modal.style.display = 'none';

			window.onclick = function (event) {
				if (event.target == modal) modalClose();
			}
		}
	</script>
	<!-- / (모달 script 끝)모달모달모달모달 @일진 -->
        
</body>

</html>