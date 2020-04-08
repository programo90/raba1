<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage/style.css">
<script src="https://kit.fontawesome.com/0e36648cc8.js" crossorigin="anonymous"></script>
<!-- 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<script src="/resources/js/cafe/cafe.js"></script> -->
<title>Insert title here</title>
</head>
<body class="block">
<sec:authorize access="isAuthenticated()">
      <sec:authentication property='principal.username' var="userid"/>
      <input type="hidden" id="userid" value="${userid}">      
   	</sec:authorize>
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
                    <a href="/wishlist" class="block p-4 text-gray-800 font-bold hover:text-purple-600 hover:font-bold">위시 리스트</a>
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
                    <div class="absolute text-white text-sm top-0 left-0 mt-3 ml-48 px-3 py-1 bg-gray-500 rounded-full"><c:out value="${count}"/></div>
                </div>
                
                <div class="flex flex-wrap -mx-1 lg:-mx-4 lg:-mt-4">
                    
                    
                    
                  <c:forEach var="wishlist" items="${list }">
                    
			          <!-- Column -->
			          <div class="mx-0 px-2 my-1 w-1/2 md:w-1/4 sm:mb-8 lg:my-4 lg:px-2 ">
			
			            <!-- Article -->
			            <article class="overflow-hidden rounded-sm ">
			
			              <a href="#">
			                <img alt="Placeholder" class=" block h-auto w-full" src="https://picsum.photos/600/400/?random">
			              </a>
			
			
			
			              <div class="leading-tight px-1 md:py-2 flex justify-between ">
			
			
			                <div class=" mx-0 text-gray-700 text-md font-nomal truncate  w-2/3 inline-block">
			                  <a class="self-center no-underline  text-gray-800 hover:text-gray-700  font-semibold" href="#">
			                    <c:out value="${wishlist.p_name}"/>
			                  </a>
			                  <h1 class="text-sm text-gray-300">
			                    ${wishlist.p_price }원 /1ea
			                  </h1>
			                </div>
			
			                <div class="flex justify-between w-1/3 mt-2 mr-1">
			                  <p></p>
			                  <p class="text-md  md:text-xl w-1/6  content-center pr-2">
			                    <a href="#"><i class="fas fa-cart-arrow-down text-gray-400 hover:text-gray-500 "></i></a>
			                  </p>
			                  <p class="w-1/6  content-center ">
			                    <a href="#"><i class="fas fa-minus text-lg md:text-2xl text-gray-400 pr-8 hover:text-gray-500 "></i></a>
			                  </p>
			
			                </div>
			
			
			              </div>
			            </article>
			            <!-- END Article -->
			
			          </div>
			          <!-- END Column -->
                  
					</c:forEach>
                  
                    
                </div>
            </div>
            <!-- END 위시리스트 -->
        </div>
    </div>
</body>
</html>