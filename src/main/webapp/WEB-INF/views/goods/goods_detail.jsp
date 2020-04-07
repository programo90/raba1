<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<sec:csrfMetaTags />
<link rel="stylesheet" href="/resources/css/goods/goodsdetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		(function(){
			
			var pno = '<c:out value="${list[0].p_no}"/>';
			
			$.getJSON("/getAttachList", {pno : pno*1}, function(arr){
				
				console.log(arr);
				
				var str ="";
				
				var attach = $(arr).get(0);
					
					var fileCallPath = encodeURIComponent(attach.uploadPath +"/"+attach.uuid+"_"+attach.fileName);
					
					str += "<div data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
					str += "<img src='/display?fileName="+fileCallPath+"' alt='"+attach.fileName+"'>";
					str += "</div>";
					
				$('.detail_img').html(str);
				
			});// end getjson
			
		})(); //end function
	
		
		 /* 숫자 ,  */
		 
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
<script type="text/javascript" src="/resources/js/goods/goodsdetail.js"></script>
</head>
<body>
<div class="contents">
	<sec:authorize access="isAuthenticated()">
      <sec:authentication property='principal.username' var="userid"/>
      <input type="hidden" id="userid" value="${userid}">
   </sec:authorize>
	<%-- <sec:authorize access="isAnonymous()">
		<c:set var="userid" value="aaa"/>
	</sec:authorize> --%>
	 <div class="detail_wrap">
            <div class="detail_img">
	            
	        </div>
	            
            <div class="detail_info">
                   <form action="/cart_insert" method="post" id="addcartform">
                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                       <ul>
                            <li><c:out value="${list[0].p_name }"></c:out></li>
                            <li><span class="format-money">${list[0].p_price }</span>원</li>
                            <li>
                            <label for="p_size" id="sizename">Size</label>
                            <select name="p_size" id="p_size" >
                            	<option selected disabled>사이즈 (잔여수량) </option>
                            </select>
                            </li>
                            <li>
                                <label for="">Amount</label>
                                <input type="number" value="1" name="p_amount" id="p_amount" min="1" >
                                <input type="hidden" id="pno" name="p_no" >
                                <input type="hidden" id="target" name="usercode" value=${userid } >
                                <input type="hidden" id="pname" value="${list[0].p_name }">
                            </li>
                            <li><input type="submit" value="BUY NOW" class="buynow"></li>
                            <li><input type="button" value="ADD CART" class="addcart" onClick="addCart()"></li>
                            <!-- ajax로 값만 넘긴다.  -->
                       </ul>
                   </form>
            </div>
        </div>

		<c:forEach var="goods" items="${list}">
			<input type="hidden" value="<c:out value="${goods.p_no }"/>" class="nooption">
			<input type="hidden" value="<c:out value="${goods.p_size }"/>" class="sizeoption">
			<input type="hidden" value="<c:out value="${goods.p_amount}"/>" class="amountoption">
		</c:forEach>		
</div>
</body>
</html>