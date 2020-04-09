<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="./resources/css/mypage/style.css">
<link rel="stylesheet" href="./resources/css/tour/tourhostpage.css">
<link rel="stylesheet" href="/resources/css/tour/mediaqueries.css">
<!-- 도로명 script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- END 도로명 script -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/tour/tourhost.js"></script>
</head>
<body class="block">
	<div class="mt-2">
		<div class="bg-gray-50">
			<div
				class="max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center lg:justify-between">
				<h2
					class="text-4xl leading-9 font-extrabold text-gray-900 sm:text-5xl sm:leading-none">
					${userinfo.username}님 안녕하세요!  <br /> <span class="text-teal-600">BREAK AWAY</span>
				</h2>
				<div class="mt-8 flex lg:mr-0 inline-flex lg:flex-shrink-0 lg:mt-0">
					<div class="inline-flex rounded-md shadow">
						<a href="/tourinsert"
							class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-teal-600 hover:bg-teal-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
						 투어 일정 만들기 </a>
					</div>
					<!-- <div class="ml-3 inline-flex rounded-md shadow">
						<a href="/tourinsert"
							class="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-teal-600 bg-white hover:text-teal-500 focus:outline-none focus:shadow-outline transition duration-150 ease-in-out">
							모임 만들기 </a>
					</div> -->
				</div>
			</div>
		</div>
	</div>
	<div class="w-full max-w-screen-xl mx-auto px-6">
		<div class="lg:flex  -mx-6">
			<div class="hidden bg-white ml-5  lg:w-2/12 lg:grid ">
				<ul class="list-reset">
					<li class="inline-block mr-10 "><a href="/mypage"
						class="block p-4 text-gray-800 font-nomal hover:text-teal-600 hover:font-bold ">주문
							내역</a></li>
					
					<li class="inline-block mr-10 "><a href="/tourmypage"
						class="block p-4 text-gray-800 font-normal hover:text-teal-600 hover:font-bold">투어 참여 내역
							</a></li>
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

			<div class="w-full lg:w-10/12 min-h-screen antialiased bg-white">
				<div>
					<h2 class="text-gray-800 text-2xl font-semibold leading-tight">
						투어 모집 내역<span style="display: inline-block; float: right;">모집 횟수 : ${hostdto.leadcount}회</span>
					</h2>
					<div>
						<form>
							<select class="tourhostpage_selstate" onchange="selectState(this)">
								<option value="-1">전체보기</option>
								<option value="0">모집중</option>
								<option value="1">마감</option>
								<option value="2">종료</option>
							</select>
						</form>
					</div>
				</div>

				<div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
					<div
						class="inline-block min-w-full shadow rounded-lg overflow-hidden">
						<table class="table-fixed min-w-full leading-normal">
							<thead>
								<tr>
									<th
										class="w-5/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
										Tour info</th>
									<th
										class="hidden md:table-cell w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
										Tour date</th>
									<th
										class="hidden md:table-cell w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
										Application State
									<th
										class="w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
										Status</th>
									<th
										class="w-2/12 px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
										</th>
								</tr>
							</thead>
							<tbody id="tbodylist">
							 	<c:forEach items="${list}" var="dto">
							 		<tr class=" border-b border-gray-200 ">
									<td class=" flex items-center px-5 py-5 bg-white text-sm">
										<div class="tourhostpage_imgbox" data-pop="${dto.populartour}">
										</div>
										<a href="/tourdetail/${dto.tourno }">
										<div class="px-3 py-2 w-full flex items-center justify-between leading-none">
											<div class="truncate">
													<div style="text-align: center;">
														<h2 style="margin-bottom:10px; font-size:20px;">${dto.tourtitle}</h2> <p>From ${dto.startspot}<br>To ${dto.endspot}</p>
													</div>
											</div>
										</div>
										</a>
									</td>
									<td
										class="hidden md:table-cell  px-5 py-5 border-b border-gray-200 bg-white text-sm">
										<p class="text-gray-900 whitespace-no-wrap">${dto.tourday } ${dto.tourtime }</p>
									</td>
									<td
										class="hidden md:table-cell px-5 py-5 border-b border-gray-200 bg-white text-sm text-center"
										onclick="detailinfo(this)" data-tourno="${dto.tourno }" data-openwin="0">
										<span class="text-gray-900 text-sm">${dto.cancount } / ${dto.totalcount }</span><br>
										<input class="tourhostpage_list_btn" type="button" value="명단/문의 보기">
									</td>
									<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
										<div class="text-gray-500">
											<select class="tourstatesel" id="tourstatesel${dto.tourno}">
	    	            						<option value="0">모집중</option>
		                						<option value="1">마감</option>
		                						<option value="2">종료</option>
	                						</select>
	                						<input type="hidden" value="${dto.tourstate}">
											<input type="button" class="tourhostpage_state_btn" value="상태변경" onclick="changeState(${dto.tourno})">											
										</div>
									</td>
									<td>
										<form action="tourcancel">
										<c:choose>
												<c:when test="${(dto.tourstate==0) || (dto.tourstate == 1)}">
													<a href="/tourupdate/${dto.tourno }" class="tourhostpage_update_btn">편집</a>
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												</c:when>
												<c:when test="${dto.tourstate == 2 }">
													<input type="button" value="종료">
												</c:when>
										</c:choose>
										</form>
									</td>
								</tr>
							 	</c:forEach>
							</tbody>
						</table>
						<input type="hidden" id="hostno" value="${hostdto.hostno}">
						<!-- <div
							class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between          ">
							<span class="text-xs xs:text-sm text-gray-900"> Showing 1
								to 4 of 50 Entries </span>
							<div class="inline-flex mt-2 xs:mt-0">
								<button
									class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-l">
									Prev</button>
								<button
									class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-r">
									Next</button>
							</div>
						</div> -->
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
                            <form  class="form-horizontal w-3/4 mx-auto" id="frm" method="POST" >
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<p class="text-gray-800 font-4xl font-extrabold">Customer information</p>
								<div class="">
								  <label class="block text-sm text-gray-600" for="username">Name</label>
								  <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="username" name="username" type="text" required="" placeholder="Your Name"  value="${userinfo.username }">
								</div>
								<div class="mt-2">
								  <label class="block text-sm text-gray-600 " for="useremail">Email</label>
								  <input class="w-full px-5  py-1 text-gray-700 bg-gray-200 rounded text-xs" id="useremail" name="useremail" type="text" required="" placeholder="Your Email"  value="${userinfo.useremail }">
								</div>
								<div class="mt-2">
									<label class="block text-sm text-gray-600" for="phone">Phone number</label>
									<input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="phone" name="phone" type="text"  placeholder="Your phone number"  value="${userinfo.phone }">
								  </div>
								<div class="mt-2">
								  <label class=" block text-sm text-gray-600" for="addr2">Address</label>
								  <input onclick="execPostCode();" class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="addr2" name="addr2" type="text"  placeholder="도로명 주소"  value="${userinfo.address2 }">
								</div>
								<div class="mt-2">
								  <label class="hidden text-sm block text-gray-600" for="addr3">상세 주소</label>
								  <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="addr3" name="addr3" type="text" placeholder="상세주소"  value="${userinfo.address3 }">
								</div>
								<div class="inline-block mt-2 w-1/2 pr-1">
								  <label class="hidden block text-sm text-gray-600" for="addr1">우편번호</label>
								  <input class="w-full px-5 py-1 text-gray-700 bg-gray-200 rounded text-xs" id="addr1" name="addr1" type="text"  placeholder="우편번호"  value="${userinfo.address }">
								</div>
								<sec:authorize access="hasRole('ROLE_HOST')"> 
									<div class="mt-2">
									  <label class="text-sm block text-gray-600" for="hostmsg">host 상태메세지 </label>
									  <input class="w-full px-5 py-4 text-gray-700 bg-gray-200 rounded text-xs" id="hostmsg" name="hostmsg" type="text" placeholder="host message(필수)"  value="${userinfo.hostcomment }">
									</div>
								</sec:authorize>
								
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
	
	/* <!-- 도로명 script --> */
		function execPostCode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

		           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		               extraRoadAddr += data.bname;
		           }
		           // 건물명이 있고, 공동주택일 경우 추가한다.
		           if(data.buildingName !== '' && data.apartment === 'Y'){
		              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		           }
		           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		           if(extraRoadAddr !== ''){
		               extraRoadAddr = ' (' + extraRoadAddr + ')';
		           }
		           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		           if(fullRoadAddr !== ''){
		               fullRoadAddr += extraRoadAddr;
		           }

		           // 우편번호와 주소 정보를 해당 필드에 넣는다.
		           console.log(data.zonecode);
		           console.log(fullRoadAddr);
		           
		           
		           $("[name=addr1]").val(data.zonecode);
		           $("[name=addr2]").val(fullRoadAddr);
		           
		           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
		           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
		           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
		       }
		    }).open();
		}
		/* <!-- END 도로명 script --> */
		/* <!-- ajax script --> */
function updateData(){
  	var userid = document.getElementById('userid').value;
  	var username = document.getElementById('username').value;
	var useremail = document.getElementById('useremail').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('addr1').value;
	var address2 = document.getElementById('addr2').value;
	var address3 = document.getElementById('addr3').value;
	var hostmsg = document.getElementById('hostmsg').value;
	var tempdata = {"userid":userid, "username":username , "useremail":useremail , "phone":phone, "address":address , "address2":address2 , "address3":address3, "hostmsg":hostmsg }; 
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
		
			
	</script>
        
	
</body>

</html>