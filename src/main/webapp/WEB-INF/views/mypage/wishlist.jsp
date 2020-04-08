<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/0e36648cc8.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/mypage/style.css">
	    
	   	<!-- ajax script -->
	    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	    <!-- END ajax script -->
	    
	    <!-- mypage script -->
	    <!-- <script src="/resources/js/mypage/mypage.js"></script> -->
     	<!-- END mypage script -->
     	
     	
<title>Insert title here</title>
</head>
<body class="block">
   
    
	    <!-- security session에서 userid를 불러옵니다. -->
	    <sec:authorize access="isAuthenticated()">
	      	<sec:authentication property='principal.username' var="userid"/>
	      	<input type="hidden" id="userid" value="${userid}">      
	   	</sec:authorize>
	   	<!-- security session에서 userid를 불러옵니다. -->
   	
   		
        <div class="mt-2">
            <div class="bg-gray-50">
                <div class="max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center lg:justify-between">
                  <h2 class="text-4xl leading-9 font-extrabold text-gray-900 sm:text-5xl sm:leading-none">
                		${userinfo.username}님 안녕하세요! 
                    <br />
                    <span class="text-teal-600">BREAK AWAY</span>
                  </h2>
                  <div class="mt-8 flex lg:mr-0 inline-flex lg:flex-shrink-0 lg:mt-0">
                    <div class="inline-flex rounded-md shadow">
                      <a href="/tourmypage" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-teal-600 hover:bg-teal-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
                        주행거리 확인
                      </a>
                    </div>
                    <div class="ml-3 inline-flex rounded-md shadow">
                      <a href="/tourlist" class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-teal-600 bg-white hover:text-teal-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
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
                        <a href="/mypage" class="block p-4 text-gray-800 font-nomal hover:text-gray-600 hover:font-bold ">주문 내역</a>
                    </li>
                    <li class="inline-block mr-10  ">
                        <a href="/wishlist" class="block p-4 text-gray-800 font-bold hover:text-gray-600 hover:font-bold">위시 리스트</a>
                    </li>
                    <li class="inline-block mr-10 ">
                        <a href="/tourmypage" class="block p-4 text-gray-800 font-normal hover:text-gray-600 hover:font-bold">투어 일정 확인</a>
                    </li>
                    
                    <li class="inline-block mr-10 ">
                        <a href="#" onclick="openModal()" class="block p-4 text-gray-800 font-normal hover:text-gray-600 hover:font-bold">정보 수정</a>
                    </li>
                    <sec:authorize access="hasRole('ROLE_HOST')"> 
	                   <a href="/tourhostpage"> 
          						<button type="button"  class="mt-6 ml-1 bg-teal-600 text-white p-2 rounded  leading-none flex items-center">
          							투어 관리
		          					<span class="bg-white p-1 rounded text-teal-600 text-xs ml-2">
        	  							host
         							</span>
      							</button>          						
          					</a>	
					</sec:authorize>
                    
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
			                <!-- 상품의 이미지를 넣어줍니다.  -->
			                          		<input type="hidden" class="img_uuid" value="${wishlist.imgvo.uuid }">
			                          		<input type="hidden" class="img_uploadPath" value="${wishlist.imgvo.uploadPath }">
			                          		<input type="hidden" class="img_fileName" value="${wishlist.imgvo.fileName }">
			                          		<input type="hidden" class="img_fileType" value="${wishlist.imgvo.fileType }">
			                          		<div class="goods_img " > </div> <!-- 이미지가 들어갑니다.  -->
			              </a>
			
			
			
			              <div class="leading-tight px-1 md:py-2 flex justify-between ">
			
			
			                <div class=" mx-0 text-gray-700 text-md font-nomal truncate  w-2/3 inline-block">
			                  <a class="self-center no-underline  text-gray-800 hover:text-gray-700  font-semibold" href="#">
			                    <c:out value="${wishlist.p_name}"/>
			                  </a>
			                  <h1 class="text-sm text-gray-300">
			                   <span class="format-money"> ${wishlist.p_price }</span> 원 /1ea
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
    
    
        <!-- (모달 html 시작)모달모달모달모달 @일진 -->
	<div class="main-modal fixed w-full h-full inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster" style="background: rgba(0,0,0,.7);">
		<div class="modal-container flex w-full mx-auto justify-center px-4 sm:px-0 z-50 sm:w-3/4 xl:w-1/2 ">
            <div class="modal-content flex rounded-lg shadow-lg w-full  bg-white sm:mx-0" style="height: 500px">
                <div class="flex flex-col w-full md:w-1/2 p-4">
                    <div class="flex flex-col flex-1 justify-center  m-0 mb-8">
                        <div class="w-full mt-4">
                            <form  class="form-horizontal w-3/4 mx-auto" id="frm" method="POST" >
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<p class="text-gray-800 font-4xl font-extrabold">Customer information</p>
								<div class="">
								  <label class="block text-sm text-gray-600" for="username">Name</label>
								  <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="username" name="username" type="text" required="" placeholder="Your Name"  value="${userinfo.username }">
								</div>
								<div class="mt-2">
								  <label class="block text-sm text-gray-600 " for="useremail">Email</label>
								  <input class="w-full px-5  py-4 text-gray-700 bg-gray-200 rounded text-xs" id="useremail" name="useremail" type="text" required="" placeholder="Your Email"  value="${userinfo.useremail }">
								</div>
								<div class="mt-2">
									<label class="block text-sm text-gray-600" for="phone">Phone number</label>
									<input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="phone" name="phone" type="text"  placeholder="Your phone number"  value="${userinfo.phone }">
								  </div>
								<div class="mt-2">
								  <label class=" block text-sm text-gray-600" for="addr2">Address</label>
								  <input onclick="execPostCode();" class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="addr2" name="addr2" type="text"  placeholder="도로명 주소"  value="${userinfo.address2 }">
								</div>
								<div class="mt-2">
								  <label class="hidden text-sm block text-gray-600" for="addr3">상세 주소</label>
								  <input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="addr3" name="addr3" type="text" placeholder="상세주소"  value="${userinfo.address3 }">
								</div>
								<div class="inline-block mt-2 w-1/2 pr-1">
								  <label class="hidden block text-sm text-gray-600" for="addr1">우편번호</label>
								  <input class="w-full px-5 py-2 text-gray-700 bg-gray-200 rounded text-xs" id="addr1" name="addr1" type="text"  placeholder="우편번호"  value="${userinfo.address }">
								</div>
								<div class="text-center mt-2">
									<div class="no-underline hover:underline text-blue-dark text-xs text-gray-600">
										프로필 사진은 카카오에서 변경이 가능합니다.
									</div>
								</div>
								<div class="mt-3 flex">
								  <button class="px-2 py-1 mx-auto text-white font-normal tracking-wider bg-gray-700 hover:bg-gray-800 rounded text-sm" onclick="updateData()">수정 완료</button> 
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
	
	<script>
	/* <!-- (모달 script 시작)모달모달모달모달 @일진 --> */
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
	/* <!-- / (모달 script 끝)모달모달모달모달 @일진 --> */
	
		/* <!-- ajax script --> */
function updateData(){
  	var userid = document.getElementById('userid').value;
  	var username = document.getElementById('username').value;
	var useremail = document.getElementById('useremail').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('addr1').value;
	var address2 = document.getElementById('addr2').value;
	var address3 = document.getElementById('addr3').value;
	var tempdata = {"userid":userid, "username":username , "useremail":useremail , "phone":phone, "address":address , "address2":address2 , "address3":address3 }; 
	$.ajax({
			url : '/updateInfo'
			, data : tempdata
			, dataType: 'json'
			, contentType: 'application/json;charset=utf-8'
			, success : function(data){
				alert("정보수정을 완료했습니다"); 
			}
			, error : function(data){
				alert("에러 : 관리자에게 문의하세요");
			}
	
		});
	};
			/* <!-- END ajax script --> */
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
    		/* END 콤마를찍어줍니다  */
			
    		/* 이미지를 넣어줍니다  */
    		var img_uuid = document.getElementsByClassName("img_uuid");
         var img_fileName = document.getElementsByClassName("img_fileName");
         var img_uploadPath = document.getElementsByClassName("img_uploadPath");
         var img_fileType = document.getElementsByClassName("img_fileType");
         
         var goods_img = document.getElementsByClassName("goods_img");
         
         
         
         for(var i =0 ; i < goods_img.length; i++){
            
            var str = "";
            
            var uuid = img_uuid[i].value;
            var fileName = img_fileName[i].value;
            var uploadPath = img_uploadPath[i].value;
            var fileType = img_fileType[i].value;
            
            var fileCallPath = encodeURIComponent(uploadPath+"/s_"+uuid+"_"+fileName);
            
            console.log("fileCallPath" +fileCallPath);
            
            str += "<div data-path='"+uploadPath+"' data-uuid='"+uuid+"' data-filename='"+fileName+"' data-type='"+fileType+"' >";
            str += "<img src='/display?fileName="+fileCallPath+"' alt='"+fileName+"' class='block h-auto w-full'>";
            str += "</div>";
            
            goods_img[i].innerHTML=str;
            
         }
         /* END 이미지를 넣어줍니다  */
    		
	</script>
</body>
</html>