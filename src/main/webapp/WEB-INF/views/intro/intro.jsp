<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/mypage/style.css">
</head>
<body>
<h1>intro 페이지 입니다. </h1>

<sec:authorize access="isAnonymous()">
	<a href="#" onclick="openModal()">로그인</a>	
</sec:authorize>

<span class="admin_logout"><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></span>
<form id="logout-form" action=/customLogout method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

	<!-- (모달 html 시작)모달모달모달모달 @일진 -->
	<div class="main-modal fixed w-full h-full inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster"
		style="background: rgba(0,0,0,.7);">
		
        
        <div class="modal-container flex mx-auto justify-center px-4 w-full sm:px-0 z-50 sm:w-3/4 lg:w-1/2 ">

            
            <div class="modal-content flex rounded-lg shadow-lg w-full  bg-white sm:mx-0" style="height: 500px">
                <div class="flex flex-col w-full md:w-1/2 p-4">
                    <div class="flex flex-col flex-1 justify-center m-0 mb-8">
                        <h1 class="text-4xl text-center font-thin">Welcome Back</h1>
                        <div class="w-full mt-4">
                            <div class="w-3/4 mx-auto">
                                <div class="flex flex-col mt-4">
									<a href="https://kauth.kakao.com/oauth/authorize?client_id=bffed4bc4d4a39e24324342a77147ade&redirect_uri=http://localhost:8080/login&response_type=code">
            							<img src="resources/img/kakao_login_btn.png">
        							</a>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <a class="no-underline hover:underline text-blue-dark text-xs" href="#">
                                    Would you like to apply for a host?
                                </a>
                            </div>
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
	<!-- (모달 script 시작)모달모달모달모달 @일진 -->
</body>
</html>