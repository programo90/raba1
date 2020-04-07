 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/admin/admingoods.css">
 <style>
 	
 
 </style>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
		document.addEventListener("DOMContentLoaded", function(){
			// Handler when the DOM is fully loaded
			
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
					
					str += "<div data-path='"+uploadPath+"' data-uuid='"+uuid+"' data-filename='"+fileName+"' data-type='"+fileType+"' >";
					str += "<img src='/display?fileName="+fileCallPath+"' alt='"+fileName+"'>";
					str += "</div>";
					
					goods_img[i].innerHTML=str;
					
				}
			
			}); 
</script>
 <script src="/resources/js/goods/list_goods.js"></script>
 </head>
 <body>
         <div class="admincontents">
             <div class="admin_userbox">
                 관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
             </div>
             <section class="admin_sectionbox">
                 <!-- 여기서 div만들고 시작하세요 controller에 file등록하고 사용하세요! ~~  -->
                <div class="admingoods">
	                       <div class="admingoodssearch">
	                           <a href="" class="admingoodssearchbtn">검색</a>
	                            <input type="text" size="1000" class="admgoodssearchtext">
	                             <select class="admgoodssearch">
	                                <option>제품번호</option>
	                                <option>상품명</option>
	                                <option>판매상태</option>
	                            </select>
	                       </div>
	                    <div class="admingoodscolumn">
	                        <div class="admingoodsnum"><span>No</span></div>
	                        <div class="admingoodsimg"><span>이미지</span></div>
	                        <div class="admingoodsname"><span>상품명</span></div>
	                        <div class="admingoodssize"><span>Size</span></div>
	                        <div class="admingoodsstock"><span>재고수량</span></div>
	                        <div class="admingoodsprice"><span>판매가</span></div>
	                        <div class="admingoodssituation"><span>판매상태</span></div>
	                    </div>
	                    
	                    <c:forEach var="Goodslist" items="${list}">
	                    <div class="admingoodscolumn2">
	                        <div class="admingoodsnum2"><span><c:out value="${Goodslist.p_no }"/></span></div>
	                        <div class="admingoodsimg2"><div class="goods_img"></div></div>
	                        <div class="admingoodsname2"><input type="text" value="<c:out value="${Goodslist.p_name }"/>" size="45"></div>
	                        <div class="admingoodssize2"><input type="text" value="<c:out value="${Goodslist.p_size }"/>" size="3"></div>
	                        <div class="admingoodsstock2"><input type="text" value="<c:out value="${Goodslist.p_amount }"/>" size="3"></div>
	                        <div class="admingoodsprice2"><input type="text" value="<c:out value="${Goodslist.p_price }"/>" size="7"></div>
	                        
	                            <div class="admingoodssituation2">
	                            <input type="hidden" value="${Goodslist.p_state}">
		                             <select class="optioncheck">
		                                <option value = "0">판매중</option>
		                                <option value = "1">일시 중지</option>
		                                <option value = "2">품절</option>
		                            </select>
	                            </div>
	                            
	                        <div class="admingoodsbtn1"><a href="/modifygoods/${Goodslist.p_no}">수정</a></div>
	                        <div class="admingoodsbtn1"><a href="/deletegoods/${Goodslist.p_no}">삭제</a></div>
	                    </div>
	                  </c:forEach>
	                  <!-- 이미지 출력을 위한 hidden value  -->
	                  <c:forEach var="Imagelist" items="${img_list }">
						<input type="hidden" class="img_uuid" value="${Imagelist.uuid }">
						<input type="hidden" class="img_uploadPath" value="${Imagelist.uploadPath }">
						<input type="hidden" class="img_fileName" value="${Imagelist.fileName }">
						<input type="hidden" class="img_fileType" value="${Imagelist.fileType }">
					</c:forEach>
                </div>
                <div class="admingoodsbtnline">
                <a href="/goods_insert" class="admingoodsbtn3">등록</a>
                </div>
            </section>
        </div>
 </body>
 </html>