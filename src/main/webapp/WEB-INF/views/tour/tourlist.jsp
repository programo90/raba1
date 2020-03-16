<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/tour/tourlist.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- <script src="/resources/js/cafe/cafe.js"></script> -->
</head>
<body>
 <div class="banner">
        <!-- 각페이지 top banner -->
        <div class="banner_inner">
       	   <div id="tourlist_img_box">
	            <img id="tourlist_img" alt="toulistimg" src="/resources/img/tour/tourlist.jpg">
    		</div>
        </div>
    </div>
    <div class="contents">
        <h2 class="contents_title">TOUR</h2>
        <!-- 여기 작성!!!! class =contents 는 수정하지마시고 이 안에서부터 div새로 만들어서 작업 ㄱㄱ -->
        <section class="cafe">
        	<div id="tourlist_content_wrap">
           <!--for문으로 아래 tourlist_content_box 반복 입력-->
            <div class="tourlist_content_box">
                <div class="tourlist_content_conbox">
                   <a class="tourlist_content_box_link" href="#">
                        <div class="tourlist_content_imgbox">
                           <div class="tourlist_content_tag">
                               <p class="tourlist_content_tag_app">모집</p>
                           </div>
                            <img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">
                        </div>
                        <div class="tourlist_content_textbox">
                            <h4>
                            		    투어
                            </h4>
                            <p>
                             		   출발지 BA  - 목적지 BA
                            </p>
                            <p>
                                <span>모집인원</span>
                                <span>3/15</span>
                            </p>
                        </div>
                    </a>
                </div>   
            </div>
             <div class="tourlist_content_box">
                <div class="tourlist_content_conbox">
                   <a class="tourlist_content_box_link" href="#">
                        <div class="tourlist_content_imgbox">
                           <div class="tourlist_content_tag">
                               <p class="tourlist_content_tag_closed">마감</p>
                           </div>
                            <img class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">
                        </div>
                        <div class="tourlist_content_textbox">
                            <h4>
                                투어
                            </h4>
                            <p>
                                출발지 BA  - 목적지 BA
                            </p>
                            <p>
                                <span>모집인원</span>
                                <span>3/15</span>
                            </p>
                        </div>
                    </a>
                </div>   
            </div>
            <div class="tourlist_content_box">
                <div class="tourlist_content_conbox">
                   <a class="tourlist_content_box_link" href="#">
                        <div class="tourlist_content_imgbox">
                           <div class="tourlist_content_tag">
                               <p class="tourlist_content_tag_ended">종료</p>
                           </div>
                            <img class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">
                        </div>
                        <div class="tourlist_content_textbox">
                            <h4>
                                투어
                            </h4>
                            <p>
                                출발지 BA  - 목적지 BA
                            </p>
                            <p>
                                <span>모집인원</span>
                                <span>3/15</span>
                            </p>
                        </div>
                    </a>
                </div>   
            </div>
            <!--이상 tourlist_content_box 반복 끝-->
            <!--이상 tourlist_content_box 반복 끝-->
        </div>
        <div id="tourlist_paging_block">
            <div id="tourlist_paging_box">
               <div id="tourlist_paging_pre">
                   <a href="#">Prev</a>
                </div>
                <div id="tourlist_paging_num">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                </div>
                <div id="tourlist_paging_next">
                    <a href="#">Next</a>
                </div>
            </div>
        </div>
    </div>
            <!-- 카테고리 end -->
        </section>
    </div>
</body>
</html>