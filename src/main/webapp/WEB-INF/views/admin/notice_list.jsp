<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/info/n_list.css">
</head>
<body>
	<div class="adminwrap">
        <!-- header 부분은 나중에 따로 떼어야하는 부분임!!!-->
        <!--header end-->
        <div class="admincontents">
            <div class="admin_userbox">
                관리자님 환영합니다! <span class="admin_logout"><a href="#">로그아웃</a></span>
            </div>
            <section class="admin_sectionbox">
                <!-- 여기서 div만들고 시작하세요 -->
                <div class="n_board">
		            <div class="brd_head">
		                <div class="no">No.</div>
		                <div class="title">Title</div>
		                <div class="date">Date</div>
		                <div class="list_btn">수정/삭제</div>
		            </div>
		            <c:forEach var="Notice" items="${list }">
			            <div class="brd_body">
			                <div class="brd_list">
			                    <div class="no"><c:out value="${Notice.ntcno }"/></div>
			                    <div class="title"><c:out value="${Notice.ntctitle }"/></div>
			                    <%-- <div class="content"><c:out value="${Notice.ncontent }"/></div> --%>
			                    <div class="date"><c:out value="${Notice.ntcdate }"/></div>
			                    <div class="list_btn">
			                        <a href="n_modify/${Notice.ntcno }" ><div class="mdf_list">수정</div></a>
			                        <a href="n_delete/${Notice.ntcno }"><div class="del_list">삭제</div></a>
			                    </div>
			                </div>
			            </div><!-- brd_body  -->
		         	</c:forEach>
       		 </div>
       <div class="ins_brd"> <a href="n_insert" class="n_ins_btn">공지 등록</a></div>
    			
            	</section>
            </div>
       </div>
</body>
</html>