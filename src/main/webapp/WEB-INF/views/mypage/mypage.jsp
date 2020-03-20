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
                        <a href="/mypage" class="block p-4 text-gray-800 font-bold hover:text-purple-600 hover:font-bold ">주문 내역</a>
                    </li>
                    <li class="inline-block mr-10  ">
                        <a href="/wishlist" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">위시 리스트</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">주행 거리</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">정보 수정</a>
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
                                                <th
                                                    class="w-5/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                    product
                                                </th>
                                                <th
                                                    class="hidden md:table-cell w-3/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                    price
                                                </th>
                                                <th
                                                    class="hidden md:table-cell w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                    order date
                                                </th>
                                                <th
                                                    class="w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                                    Status
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class=" border-b border-gray-200 ">
                                                <td
                                                    class=" flex items-center px-5 py-5 bg-white text-sm">
                                                    <img src="./resources/img/mypage/product.png" alt="product"
                                                        class="m-3 my-auto h-12 w-12 flex-shrink-0">
                                                    <div
                                                        class="px-3 py-2 w-full flex items-center justify-between leading-none">
                                                        <div class="truncate">
                                                            <a href="#"> Spream acho-bag 300*200</a> <br>
                                                            <span class="text-gray-400 text-sm">49,000원 / 1ea</span> <br>
                                                            <button
                                                                class="mt-1 bg-gray-400 hover:bg-gray-500 text-white px-1 py-1 rounded-lg text-xs focus:outline-none focus:shadow-outline">
                                                                주문서 보기
                                                            </button>
                                                        </div>

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
</body>

</html>