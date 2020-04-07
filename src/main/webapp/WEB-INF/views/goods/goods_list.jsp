<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/goods/goods_list.css">
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
			
			var fileCallPath = encodeURIComponent(uploadPath+"/"+uuid+"_"+fileName);
			
			str += "<div data-path='"+uploadPath+"' data-uuid='"+uuid+"' data-filename='"+fileName+"' data-type='"+fileType+"' >";
			str += "<img src='/display?fileName="+fileCallPath+"' alt='"+fileName+"'>";
			str += "</div>";
			
			goods_img[i].innerHTML=str;
			
		}
		
		
		
		/* 숫자 , */
		
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
	
	}); 
</script>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
      <sec:authentication property='principal.username' var="userid"/>
      <input type="hidden" id="userid" value="${userid}">      
   </sec:authorize>
   
	<div class="contents">
	
		<div class="page_title">Goods</div>
		
        <div class="goods_list">
        
        	<c:forEach var="Goodslist" items="${list_state }">
	            <a href="/goods_detail/${Goodslist.p_name}">
	                <div class="goods_img_wrap">
	                    <div class="goods_img">
	                    	
	                    </div>
	                    <div class="goods_title"><c:out value="${Goodslist.p_name }"/></div>
	                    <div class="goods_price"><span class="format-money">${Goodslist.p_price }"</span>원</div>
	                </div>
	            </a>
            </c:forEach>
            
           
            
            
            <c:forEach var="Imagelist" items="${img_list }">
				<input type="hidden" class="img_uuid" value="${Imagelist.uuid }">
				<input type="hidden" class="img_uploadPath" value="${Imagelist.uploadPath }">
				<input type="hidden" class="img_fileName" value="${Imagelist.fileName }">
				<input type="hidden" class="img_fileType" value="${Imagelist.fileType }">
			</c:forEach>
			
        </div>
        
	</div>
</body>
</html>