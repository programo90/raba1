<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/mypage/style.css">

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
                    <a href="/mypage" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold ">주문 내역</a>
                </li>
                <li class="inline-block mr-10  ">
                    <a href="#" class="block p-4 text-gray-800 font-bold hover:text-purple-600 hover:font-bold">위시 리스트</a>
                </li>
                <li class="inline-block mr-10 ">
                    <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">주행 거리</a>
                </li>
                <li class="inline-block mr-10 ">
                    <a href="#" class="block p-4 text-gray-800 font-normal hover:text-purple-600 hover:font-bold">정보 수정</a>
                </li>
            </ul>
        </div>
            <!-- 위시 리스트  -->
              <div class="max-w-screen-xl mx-auto sm:w-full my-2 px-4 md:px-4 lg:w-3/4 xl:w-10/12 ">
                
                <div class='relative text-gray-800 mb-2 text-4xl font-bold overflow-visible'>
                    <span class="inline-block"> 위시 리스트</span>
                    <div class="absolute text-white text-sm top-0 left-0 mt-3 ml-48 px-3 py-1 bg-gray-500 rounded-full">7</div>
                </div>
                
                <div class="flex flex-wrap -mx-1 lg:-mx-4 lg:-mt-4">
                    
                    
                    <!-- Column -->
                    <div class="mx-0 my-1 px-1 w-1/2 md:w-1/3 sm:mb-8 lg:my-4 lg:px-1 xl:w-1/4 xl:flex-auto xl:mr-2">
            
                      <!-- Article -->
                      <article class="overflow-hidden rounded-lg shadow-md">
          
                          <a href="#">
                              <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                          </a>
          

          
                          <footer class="flex items-center justify-between leading-none">
                            <div class=" mx-0 text-gray-700 text-2xl font-semibold truncate p-2 md:p-4">
                              <a class="no-underline  text-gray-800 hover:text-purple-700" href="#">
                              Spream eco-bag
                            </a>
                            </div>
                          </footer>
          
                          <header class="flex items-center justify-between leading-tight p-3 md:p-5">
                            <h1 class="text-lg">
                                    48,000 won
                            </h1>
                            <p class="text-gray-800 text-sm">
                              <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                              <a href="#" ><img src="./resources/img/mypage/shopping-cart.svg" alt="shopping cart" class="h-4 w-4"></a>
                            </p>
                            <p class="text-gray-800 text-sm">
                              <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                              <a href="#" ><img src="./resources/img/mypage/minus-outline.svg" alt="shopping cart" class="h-4 w-4 "></a>
                            </p>
                            <p class="text-gray-800 text-sm">
                              <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                              <a href="#" ><img src="./resources/img/mypage/conversation.svg" alt="shopping cart" class="h-4 w-4 "></a>
                            </p>
                        </header>
                      </article>
                      <!-- END Article -->
          
                  </div>
                  <!-- END Column -->
                  <!-- Column -->
                  <div class="mx-0 my-1 px-1 w-1/2 md:w-1/3 sm:mb-8 lg:my-4 lg:px-1 xl:w-1/4 xl:flex-auto xl:mr-2">
            
                    <!-- Article -->
                    <article class="overflow-hidden rounded-lg shadow-md">
        
                        <a href="#">
                            <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                        </a>
        

        
                        <footer class="flex items-center justify-between leading-none">
                          <div class=" mx-0 text-gray-700 text-2xl font-semibold truncate p-2 md:p-4">
                            <a class="no-underline  text-gray-800 hover:text-purple-700" href="#">
                            Spream eco-bag
                          </a>
                          </div>
                        </footer>
        
                        <header class="flex items-center justify-between leading-tight p-3 md:p-5">
                          <h1 class="text-lg">
                                  48,000 won
                          </h1>
                          <p class="text-gray-800 text-sm">
                            <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                            <a href="#" ><img src="./resources/img/mypage/shopping-cart.svg" alt="shopping cart" class="h-4 w-4"></a>
                          </p>
                          <p class="text-gray-800 text-sm">
                            <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                            <a href="#" ><img src="./resources/img/mypage/minus-outline.svg" alt="shopping cart" class="h-4 w-4 "></a>
                          </p>
                          <p class="text-gray-800 text-sm">
                            <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                            <a href="#" ><img src="./resources/img/mypage/conversation.svg" alt="shopping cart" class="h-4 w-4 "></a>
                          </p>
                      </header>
                    </article>
                    <!-- END Article -->
        
                </div>
                <!-- END Column -->
                <!-- Column -->
                <div class="mx-0 my-1 px-1 w-1/2 md:w-1/3 sm:mb-8 lg:my-4 lg:px-1 xl:w-1/4 xl:flex-auto xl:mr-2">
            
                  <!-- Article -->
                  <article class="overflow-hidden rounded-lg shadow-md">
      
                      <a href="#">
                          <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                      </a>
      

      
                      <footer class="flex items-center justify-between leading-none">
                        <div class=" mx-0 text-gray-700 text-2xl font-semibold truncate p-2 md:p-4">
                          <a class="no-underline  text-gray-800 hover:text-purple-700" href="#">
                          Spream eco-bag
                        </a>
                        </div>
                      </footer>
      
                      <header class="flex items-center justify-between leading-tight p-3 md:p-5">
                        <h1 class="text-lg">
                                48,000 won
                        </h1>
                        <p class="text-gray-800 text-sm">
                          <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                          <a href="#" ><img src="./resources/img/mypage/shopping-cart.svg" alt="shopping cart" class="h-4 w-4"></a>
                        </p>
                        <p class="text-gray-800 text-sm">
                          <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                          <a href="#" ><img src="./resources/img/mypage/minus-outline.svg" alt="shopping cart" class="h-4 w-4 "></a>
                        </p>
                        <p class="text-gray-800 text-sm">
                          <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                          <a href="#" ><img src="./resources/img/mypage/conversation.svg" alt="shopping cart" class="h-4 w-4 "></a>
                        </p>
                    </header>
                  </article>
                  <!-- END Article -->
      
              </div>
              <!-- END Column -->
              <!-- Column -->
              <div class="mx-0 my-1 px-1 w-1/2 md:w-1/3 sm:mb-8 lg:my-4 lg:px-1 xl:w-1/4 xl:flex-auto xl:mr-2">
            
                <!-- Article -->
                <article class="overflow-hidden rounded-lg shadow-md">
    
                    <a href="#">
                        <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                    </a>
    

    
                    <footer class="flex items-center justify-between leading-none">
                      <div class=" mx-0 text-gray-700 text-2xl font-semibold truncate p-2 md:p-4">
                        <a class="no-underline  text-gray-800 hover:text-purple-700" href="#">
                        Spream eco-bag
                      </a>
                      </div>
                    </footer>
    
                    <header class="flex items-center justify-between leading-tight p-3 md:p-5">
                      <h1 class="text-lg">
                              48,000 won
                      </h1>
                      <p class="text-gray-800 text-sm">
                        <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                        <a href="#" ><img src="./resources/img/mypage/shopping-cart.svg" alt="shopping cart" class="h-4 w-4"></a>
                      </p>
                      <p class="text-gray-800 text-sm">
                        <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                        <a href="#" ><img src="./resources/img/mypage/minus-outline.svg" alt="shopping cart" class="h-4 w-4 "></a>
                      </p>
                      <p class="text-gray-800 text-sm">
                        <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                        <a href="#" ><img src="./resources/img/mypage/conversation.svg" alt="shopping cart" class="h-4 w-4 "></a>
                      </p>
                  </header>
                </article>
                <!-- END Article -->
    
            </div>
            <!-- END Column -->
            <!-- Column -->
            <div class="mx-0 my-1 px-1 w-1/2 md:w-1/3 sm:mb-8 lg:my-4 lg:px-1 xl:w-1/4 xl:flex-auto xl:mr-2">
            
              <!-- Article -->
              <article class="overflow-hidden rounded-lg shadow-md">
  
                  <a href="#">
                      <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                  </a>
  

  
                  <footer class="flex items-center justify-between leading-none">
                    <div class=" mx-0 text-gray-700 text-2xl font-semibold truncate p-2 md:p-4">
                      <a class="no-underline  text-gray-800 hover:text-purple-700" href="#">
                      Spream eco-bag
                    </a>
                    </div>
                  </footer>
  
                  <header class="flex items-center justify-between leading-tight p-3 md:p-5">
                    <h1 class="text-lg">
                            48,000 won
                    </h1>
                    <p class="text-gray-800 text-sm">
                      <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                      <a href="#" ><img src="./resources/img/mypage/shopping-cart.svg" alt="shopping cart" class="h-4 w-4"></a>
                    </p>
                    <p class="text-gray-800 text-sm">
                      <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                      <a href="#" ><img src="./resources/img/mypage/minus-outline.svg" alt="shopping cart" class="h-4 w-4 "></a>
                    </p>
                    <p class="text-gray-800 text-sm">
                      <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                      <a href="#" ><img src="./resources/img/mypage/conversation.svg" alt="shopping cart" class="h-4 w-4 "></a>
                    </p>
                </header>
              </article>
              <!-- END Article -->
  
          </div>
          <!-- END Column -->
          <!-- Column -->
          <div class="mx-0 my-1 px-1 w-1/2 md:w-1/3 sm:mb-8 lg:my-4 lg:px-1 xl:w-1/4 xl:flex-auto xl:mr-2">
            
            <!-- Article -->
            <article class="overflow-hidden rounded-lg shadow-md">

                <a href="#">
                    <img alt="Placeholder" class="block h-auto w-full" src="https://picsum.photos/600/400/?random">
                </a>



                <footer class="flex items-center justify-between leading-none">
                  <div class=" mx-0 text-gray-700 text-2xl font-semibold truncate p-2 md:p-4">
                    <a class="no-underline  text-gray-800 hover:text-purple-700" href="#">
                    Spream eco-bag
                  </a>
                  </div>
                </footer>

                <header class="flex items-center justify-between leading-tight p-3 md:p-5">
                  <h1 class="text-lg">
                          48,000 won
                  </h1>
                  <p class="text-gray-800 text-sm">
                    <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                    <a href="#" ><img src="./resources/img/mypage/shopping-cart.svg" alt="shopping cart" class="h-4 w-4"></a>
                  </p>
                  <p class="text-gray-800 text-sm">
                    <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                    <a href="#" ><img src="./resources/img/mypage/minus-outline.svg" alt="shopping cart" class="h-4 w-4 "></a>
                  </p>
                  <p class="text-gray-800 text-sm">
                    <!-- <span class="block bg-gray-600 rounded-full text-white-500 text-xs font-bold px-2 py-1 leading-none flex items-center">장바구니</span> -->
                    <a href="#" ><img src="./resources/img/mypage/conversation.svg" alt="shopping cart" class="h-4 w-4 "></a>
                  </p>
              </header>
            </article>
            <!-- END Article -->

        </div>
        <!-- END Column -->
                    
                </div>
            </div>
            <!-- END 위시리스트 -->
        </div>
    </div>
</body>
</html>