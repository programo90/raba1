<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/tour/tourdetail.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	    <div id="tourdetail_wrap">
        <div id="tourdetail_hostblock">
            <div id="tourdetail_hostimgblock">
                <div id="tourdetail_hostimgbox">
                    <img id="tourdetail_hostimg" src="${hostdto.userimg }" alt="hostimg">
                </div>
            </div>
            <div id="tourdetail_hostinfoblock">
                <div>
                    <h3>리더 이름 : <span>${hostdto.username }</span></h3>
                </div>
                <div id="tourdetail_hostinfobox">
                    <p>${hostdto.hostcomment }</p>
                </div>
                <div>
                    <p>Lead Count<span>${hostdto.leadcount }</span></p>
                </div>
            </div>
            <div id="tourdetail_applyblock">
                <div>
                    <p>모집인원</p>
                </div>
                <div>
                    <p>${dto.cancount }/${dto.totalcount }</p>
                </div>
                <div id="apply_btn_box">
                	<form id="applyfrm" name="applyfrm" method="POST" action="/tourapply">
                		<input type="hidden" id="tourno" value="${dto.tourno}">
                		<input type="hidden" id="userid" value="member"> <!-- 로그인상태시 userid를 넣도록 -->
                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                	</form>
                	<c:choose>
                		<c:when test="${dto.tourstate==0}">
                			<button class="apply_btn" onclick="applyTour(${dto.tourstate})">투어참여</button>
                		</c:when>
                		<c:when test="${dto.tourstate==1 }">
                			<button style="background-color: #111111;" class="apply_btn" onclick="applyTour(${dto.tourstate})">모집 마감</button>
                		</c:when>
                		<c:when test="${dto.tourstate==2 }">
                			<button style="background-color: #ffffff;" class="apply_btn" onclick="applyTour(${dto.tourstate})">종료</button>
                		</c:when>
                	</c:choose>
                </div>
            </div>
        </div>
        <div id="tourdetail_contentblock">
            <div id="tourdetail_mapblock">
                <div id="tourdetail_spotlistbox">
                	
                		<!-- 이하 for문으로 marker를 추가하고 marker list를 추가 -->
                		<c:forEach items="${markerlist}" var="selmarker" varStatus="state">
                			<div class="tourdetail_spotinfo1">
    	                    	<div class="tourdetail_spotno">
	                            	<div> P ${state.count } </div>
	                    	        <div class="markertitlelist" id="${spotListTitle+state.index}"> ${selmarker.spottitle } </div>
    	        	            </div>
        		                <div class="tourdetail_spotdetail">
    	    	                    <div>${selmarker.spotcontent }</div>
	            	            </div>
                    		</div>
                    		<form>
                    		<input type="hidden" class="markerlatlist" value="${selmarker.spotlat}">
                    		<input type="hidden" class="markerlnglist" value="${selmarker.spotlng}">
                    		</form>
                 		</c:forEach>
                 	
                 	
                 	<form>
                 		<c:forEach items="${dto.tourlatlist }" var="selLat">
                 			<input type="hidden" class="tourlatlist" value="${selLat}">
                		</c:forEach>
                		<c:forEach items="${dto.tourlnglist }" var="selLng">
                			<input type="hidden" class="tourlnglist" value="${selLng}">
                		</c:forEach>
                 	</form>
                            
                </div>
                <div id="map_wrap">
                    <div id="map"></div>               
                </div>
            </div>
            <div id="tourdetail_tourdetailblock">
                <div id="tourdetail_detailbox1">
                    <div class="tourdetail_detailtitle">출발시각</div>
                    <div class="tourdetail_detailcon">${dto.tourday}  ${dto.tourtime }</div>
                    <div class="tourdetail_detailtitle">출발위치</div>
                    <div class="tourdetail_detailcon">${dto.startspot }</div>
                    <div class="tourdetail_detailtitle">도착지점(반환점)</div>
                    <div class="tourdetail_detailcon">${dto.endspot }</div>
                    <div class="tourdetail_detailtitle">예상 소요시간</div>
                    <div class="tourdetail_detailcon">${dto.esttime }</div>
                    <div class="tourdetail_detailtitle">총 거리</div>
                    <div class="tourdetail_detailcon">${dto.distance }m</div>
                    <div class="tourdetail_detailtitle">투어컨셉</div>
                    <div class="tourdetail_detailcon">
                    	<c:choose>
                    		<c:when test="${dto.tourstyle == 'easy' }">샤방</c:when>
                    		<c:when test="${dto.tourstyle == 'hard' }">전투</c:when>
                    	</c:choose>
                    </div>
                    <div class="tourdetail_detailtitle">투어타입</div>
                    <div class="tourdetail_detailcon">
                    	<c:choose>
                    		<c:when test="${dto.tourtype == 'lightning' }">번개</c:when>
                    		<c:when test="${dto.tourtype == 'planed' }">번개</c:when>
                    	</c:choose>
                    </div>
                </div>
                <div id="tourdetail_detailbox2">
                    <div><h3>상세내용</h3></div>
                    <div>
                        ${dto.tourdetailcomm }
                    </div>
                </div>
            </div>
            
            
            <div id="tourdetail_replyblock">
                <div id="tourdetail_replelistbox">
                   <div>
                       <ul id="replylist">
							<!--  이하에 for문으로 리플 리스트 출력 -->
                          <li class="tourreple_list">
                              	글번호 작성자 내용
                          </li>
<%--                           <c:forEach items="" var="">
                          	<li class="tourreple_list">
                               <div>1 작성자 내용1</div>
                            </li>
                          	 <c:if test="">
                          	 	<li class="tourreple_relist">
                               		<div>1 작성자 답변1</div>
                           		</li>
                          	 </c:if>
                          </c:forEach> --%>

                       </ul>
                   </div>
                   
                    <div id="tourdetail_paging_num">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                    </div>
                </div>
                <div id="tourdetail_repleinsertbox">
                   <div>
                    <form action="">
                       <input type="hidden" name="userno" id="">
                       <input type="hidden" id="tour_reple_title" name="tour_reple_title" readonly value="userno">
                       <!-- login 상태면 리플 입력창 출력, 로그인 상태가 아니라면 로그인 후 입력이 가능하다 출력 --> 
                       <%-- <c:if test="">
                       
                       </c:if> --%>
                       <textarea name="" id="" cols="100" rows="5" placeholder="내용을 입력하세요."></textarea>
                       <input type="submit" value="저장" id="rep_subbtn">
                    </form>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c228a6aa0b58c3275c3454e6b1a73c09"></script>
<script>
var centerlat = document.getElementsByClassName('tourlatlist')[0].value;
var centerlng = document.getElementsByClassName('tourlnglist')[0].value;

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(centerlat, centerlng), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
    
var markerMode = false;
var markers = [];
var infowinlist = [];
var spotlist = [];
var spotNum = 0;
var bycicleSpeed = 334;

selectFavoritTour();

function selectFavoritTour(){

        drawingFlag = true;
        deleteClickLine();
        deleteDistnce();
        deleteCircleDot();
    
    //DB에서 꺼내올 경로의 값, List로 받음
    var latList = document.getElementsByClassName('tourlatlist');
	var lngList = document.getElementsByClassName('tourlnglist');
	
    //경로 첫 지점 설장
     var spotPosition = new kakao.maps.LatLng(latList[0].value, lngList[0].value);
    console.log(latList[0].value);
    console.log(lngList[0].value);
    /*var spotPosition = new kakao.maps.LatLng(37.556431, 126.871739);*/
    clickLine = new kakao.maps.Polyline({
            map: map, 
            path: [spotPosition],
            strokeWeight: 3, 
            strokeColor: '#111111',
            strokeOpacity: 1, 
            strokeStyle: 'solid' 
        });
    displayCircleDot(spotPosition, 0);
    
    
    //List를 for문으로 반복해서 경로를 그림
    for(var i =1; i < latList.length; i++ ){
        var path = clickLine.getPath();
        var spotPosition = new kakao.maps.LatLng(latList[i].value, lngList[i].value);
        path.push(spotPosition);
        clickLine.setPath(path);
        
        //마지막 지점은 점과 거리를 표시하지 않고, 총 거리와 예상 소요 시간을 표시
        if(i==(latList.length-1)) {
            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
            
            // 그려진 선의 거리정보를 지도에 표시합니다
            displayCircleDot(spotPosition, distance);            
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
            }
            showDistance(content, path[path.length-1]);                 
        } else {
            var distance = Math.round(clickLine.getLength());
            displayCircleDot(spotPosition, distance);
        }
    }
        
        drawingFlag = false;
    
    
}    

//마커 목록
var markerLatList = document.getElementsByClassName('markerlatlist');
var markerLngList = document.getElementsByClassName('markerlnglist');
var markerTitleList = document.getElementsByClassName('markertitlelist');

for(var i=0; i<markerLatList.length; i++) {
	var spotPosition = new kakao.maps.LatLng(markerLatList[i].value, markerLngList[i].value);
	addMarker(spotPosition,i);
}

    
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
/* kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // 마우스로 클릭한 위치입니다 
    var clickPosition = mouseEvent.latLng;

    if(markerMode){
        if(spotNum>=4){
            alert("중간 지점은 최대 4개까지 입력 가능합니다.");
        } else {
            addMarker(clickPosition);
            addSpotList(clickPosition);
        }
        
    } else {
        // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
        if (!drawingFlag) {

        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
        drawingFlag = true;
        
        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
        deleteClickLine();
        
        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
        deleteDistnce();

        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
        deleteCircleDot();
    
        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
        clickLine = new kakao.maps.Polyline({
            map: map, // 선을 표시할 지도입니다 
            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#111111', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        
        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
        moveLine = new kakao.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다 
            strokeColor: '#111111', // 선의 색깔입니다
            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다    
        });
    
        // 클릭한 지점에 대한 정보를 지도에 표시합니다
            displayCircleDot(clickPosition, 0);

            
        } else { // 선이 그려지고 있는 상태이면

        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
        var path = clickLine.getPath();

        // 좌표 배열에 클릭한 위치를 추가합니다
        path.push(clickPosition);
        
        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
        clickLine.setPath(path);

        var distance = Math.round(clickLine.getLength());
        displayCircleDot(clickPosition, distance);
        }    
    }
    
}); */

function addMarker(position,index){
	
    var marker = new kakao.maps.Marker({
        map:map,
        position:position,
        zIndex: 1,
        clickable: true
    });
    
    marker.setMap(map);
    
    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div id="markerwin'+ (index+1) +'" style="padding:5px;">P' + (index+1) + ' ' + markerTitleList[index].innerText+ '</div>';
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
    content : iwContent,
    removable : iwRemoveable
    });
    
    kakao.maps.event.addListener(marker, 'click', function(){
        infowindow.open(map,marker);
    });
    
    infowinlist.push(infowindow);
    markers.push(marker);
}

function addSpotList(position){
/*    var spotboxlist = document.getElementsByClassName('tourinsert_spotbox');
    
    var spotCon = '<div class="tourdetail_spotno"> P';
        spotCon += (spotNum +1);
        spotCon += '</div>';
        spotCon += '<div class="tourdetail_spotdetail">';
        spotCon = ' <input type="hidden" value="' + spotNum + '">';
        spotCon += '<input type="text" size="15" placeholder="지점 이름">';
        spotCon += '<input type="text" size="15" placeholder="설명">';
        spotCon += '<input type="hidden" value="'
        spotCon += position;
        spotCon += '">';        
        spotCon += '</div>';
    
    spotboxlist[spotNum].insertAdjacentHTML('afterbegin',spotCon);*/
                        
    var spotNumList = document.getElementsByClassName('tourdetail_spotno');
    var spotCon1 = '<div>P';
        spotCon1 += (spotNum +1) +'</div>';
        spotCon1 += '<div><input type="hidden" name="spotListNo" value="' + spotNum + '">';
        spotCon1 += '<input type="text" name="spotListTitle" id="spotListTitle' + spotNum + '" size="15" placeholder="지점 이름" onchange="updateInfoWin(' + spotNum + ')">';
        spotCon1 += '<button class="spotdelete_btn" onclick="spotDeleteBtn(' + spotNum + ')" type="button">x</button></div>';

    spotNumList[spotNum].innerHTML = spotCon1;
    
    var spotDetailList = document.getElementsByClassName('tourdetail_spotdetail');
        /*spotCon2 += '<input type="text" size="15" placeholder="내용 입력">';*/
    var spotCon2 = '<textarea name="spotListCon"  id="spotListCon' + spotNum + '" cols="23" rows="9" placeholder="내용 입력"></textarea>';
        spotCon2 += '<input type="hidden" name="spotListLat" id="spotListLat' + spotNum + '" value="'
        spotCon2 += position.getLat();
        spotCon2 += '">';
        spotCon2 += '<input type="hidden" name="spotListLng" id="spotListLng' + spotNum + '" value="'
        spotCon2 += position.getLng();
        spotCon2 += '">';
        
        console.log(position.getLat());
        console.log(position.getLng());      
        
    spotDetailList[spotNum].innerHTML = spotCon2;
    
    spotNum = spotNum+1;
}

function deleteMarkers(){
    for( var j=0; j<markers.length; j++) {
        markers[j].setMap(null);
    }
    markers = [];
}
function deleteSpotList() {
    var spotNumList = document.getElementsByClassName('tourdetail_spotno');
    var spotDetailList = document.getElementsByClassName('tourdetail_spotdetail');
    for(var j=0; j<spotNum; j++) {
        spotNumList[j].innerHTML = '';
        spotDetailList[j].innerHTML = '';
    }
    spotNum = 0;
}


// 지도에 마우스무브 이벤트를 등록합니다
// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
/* kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
    if (drawingFlag){
        
        // 마우스 커서의 현재 위치를 얻어옵니다 
        var mousePosition = mouseEvent.latLng; 

        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
        var path = clickLine.getPath();
        
        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
        var movepath = [path[path.length-1], mousePosition];
        moveLine.setPath(movepath);    
        moveLine.setMap(map);
        
        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
        
        // 거리정보를 지도에 표시합니다
        showDistance(content, mousePosition);   
    }             
}); */                 

// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
/* kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

    if(markerMode) {
        deleteMarkers();
        deleteSpotList();
    } else {
     // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
    if (drawingFlag) {
        
        // 마우스무브로 그려진 선은 지도에서 제거합니다
        moveLine.setMap(null);
        moveLine = null;  
        
        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
        var path = clickLine.getPath();
    
        // 선을 구성하는 좌표의 개수가 2개 이상이면
        if (path.length > 1) {

            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
            }

            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
                
            // 그려진 선의 거리정보를 지도에 표시합니다
            showDistance(content, path[path.length-1]);
             
        } else {

            // 선을 구성하는 좌표의 개수가 1개 이하이면 
            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
            deleteClickLine();
            deleteCircleDot(); 
            deleteDistnce();
            document.getElementById('distance').value = '';
            document.getElementById('esttime').value = '';

        }
        
        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
        drawingFlag = false;          
    }    
    } 
});     */

// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
}

// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
function showDistance(content, position) {
    
    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
        
        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
        distanceOverlay.setPosition(position);
        distanceOverlay.setContent(content);
        
    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
        
        // 커스텀 오버레이를 생성하고 지도에 표시합니다
        distanceOverlay = new kakao.maps.CustomOverlay({
            map: map, // 커스텀오버레이를 표시할 지도입니다
            content: content,  // 커스텀오버레이에 표시할 내용입니다
            position: position, // 커스텀오버레이를 표시할 위치입니다.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3
        });      
    }
}

// 그려지고 있는 선의 총거리 정보와 
// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
function deleteDistnce () {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
function displayCircleDot(position, distance) {

    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
    var circleOverlay = new kakao.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // 지도에 표시합니다
    circleOverlay.setMap(map);

    if(distance == 0){
        var distanceOverlay = new kakao.maps.CustomOverlay({
            content: '<div class="dotOverlay" style="font-size:18px;">출발점</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

        // 지도에 표시합니다
        distanceOverlay.setMap(map);
    } else {
        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
        var distanceOverlay = new kakao.maps.CustomOverlay({
            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

        // 지도에 표시합니다
        distanceOverlay.setMap(map);
    }

    // 배열에 추가합니다
    dots.push({circle:circleOverlay, distance: distanceOverlay});
}

// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
function deleteCircleDot() {
    var i;

    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].circle) { 
            dots[i].circle.setMap(null);
        }

        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}

// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
// HTML Content를 만들어 리턴하는 함수입니다
function getTimeHTML(distance) {

    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';

    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
    }
    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

    // 자전거의 평균 시속은 20km/h 이고 이것을 기준으로 자전거의 분속은 334m/min입니다
    // 자전거 빠른 평균 시속은 25km/h 이고 이것을 기준으로 자전거의 분속은 417m/min 입니다
    var bycicleTime = distance / bycicleSpeed | 0;
    var bycicleHour = '', bycicleMin = '';

    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
    if (bycicleTime > 60) {
        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
    }
    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '<li style="font-size:18px;"> 도착점 </li>';
    content += '    <li>';
    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
    content += '    </li>';
    content += '</ul>'
 
    return content;
}
    
    function setMapType(maptype) { 
    var tourControl = document.getElementById('btnTour');
    var markerControl = document.getElementById('btnMarker'); 
    if (maptype === 'tourmap') {
        markerMode = false;
        tourControl.className = 'selected_btn';
        markerControl.className = 'mapmode_btn';
    } else {
        markerMode = true;
        markerControl.className = 'selected_btn';
        tourControl.className = 'mapmode_btn';
    }
}
    
</script>
<script>
    //그린 경로의 좌표값을 lat, lng 으로 저장해서 배열로 만들고, 그 외에 입력한 값들과 함께 submit.
function insertTour(){
    var selectedPath = clickLine.getPath();
    var input_latlng = document.getElementById('tour_latlng');
    var content ='';
    
    for(var j=0; j<selectedPath.length; j++){
        var pathLat = selectedPath[j].getLat();
        var pathLng = selectedPath[j].getLng();
        console.log(pathLat+','+pathLng);
        
        content += '<input type="hidden" name="tourlatlist" value="' + pathLat + '">';
        content += '<input type="hidden" name="tourlnglist" value="' + pathLng + '">';
    }
    
    input_latlng.innerHTML = content;
    
/*     var markercontent = '';
    for(var j=0; j<markers.length; j++) {
        var tempMarkerPosition = markers[j].getPosition();
        var markerLat = tempMarkerPosition.getLat();
        var markerLng = tempMarkerPosition.getLng();
        
        markercontent += '<input type="hidden" name="markerlat" value="' + markerLat + '">';
        markercontent += '<input type="hidden" name="markerlng" value="' + markerLng + '">';
    }
    
    var input_markers_latlng = document.getElementById('tour_markerdata');
    input_markers_latlng.innerHTML = markercontent; */
    
    document.getElementById('tourinsertform').submit();
}
</script>
<script>
    //투어 스타일에 따라 자전거 평균 속도를 변경, 예상 소요시간을 다시 계산한다.
    //다시 계산한 값을 맵에도 새롭게 표시해주고, 입력창 예산 소요시간도 갱신해준다.
    function selectTourStyle(){
       if(document.getElementById('tourstyle_hard').checked){
           bycicleSpeed = 417;
       } else {
           bycicleSpeed = 334;
       }
        
        if (!drawingFlag && (dots.length >=1)) {
        
        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
        var path = clickLine.getPath();
    
        // 선을 구성하는 좌표의 개수가 2개 이상이면
        if (path.length > 1) {

            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
            }

            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
                
            // 그려진 선의 거리정보를 지도에 표시합니다
            showDistance(content, path[path.length-1]);
             
        }
    }
    }
</script>
<script>
    //spotList, marker 삭제 버튼
    //spotList에서 제거시 마커가 자동으로 제거되고, list와 marker, marker infowindow 모두 갱신됩니다.
    function spotDeleteBtn(sno){
        markers[sno].setMap(null);
        var markers2 = [];
        var infowinlist2 = [];
        for(var j = 0; j<markers.length; j++) {
            if(j!=sno) {
                if(j>sno) {
                    var tempData1 = 'spotListTitle' + j;
                    var tempSpotTitle = document.getElementById(tempData1).value;
                    var iwContent = '<div id="markerwin'+ j +'" style="padding:5px;">P' + j + ' ' + tempSpotTitle + '</div>';
                    infowinlist[j].setContent(iwContent);  
                }
                
                infowinlist2.push(infowinlist[j]);
                markers2.push(markers[j]);
            }
        }
        infowinlist = infowinlist2;
        markers = markers2;
        
        var spotListEx = document.getElementsByName('spotListNo');
        var spotNumList = document.getElementsByClassName('tourdetail_spotno');
        var spotDetailList = document.getElementsByClassName('tourdetail_spotdetail');
        
        for(var j=sno; j<spotListEx.length; j++) {
            
            if(j==spotListEx.length-1) {
               spotNumList[j].innerHTML = '';
               spotDetailList[j].innerHTML = '';
            } else {
                //spotNumList[j+1] 자식 첫번째 div를 찾아서 innerHTML로 값을 빼내고, 'P' + sno를 붙를 붙여서 spotNumList[j] 에 innerHTML로 넣어준다.
                var tempData1 = 'spotListTitle';
                    tempData1 += (j+1);
                var tempSpotTitle = document.getElementById(tempData1).value;
                
                var tempSpotCon1 = '<div>P';
                    tempSpotCon1 += (j+1) +'</div>';
                    tempSpotCon1 += '<div><input type="hidden" name="spotListNo" value="' + j + '">';
                    tempSpotCon1 += '<input type="text" name="spotListTitle" id="spotListTitle' + j + '" size="15" value="' + tempSpotTitle + '" placeholder="지점 이름" onchange="updateInfoWin(' + j + ')">';
                    tempSpotCon1 += '<button class="spotdelete_btn" onclick="spotDeleteBtn(' + j + ')" type="button">x</button></div>';
    
                spotNumList[j].innerHTML = tempSpotCon1;
                
                var tempData2 = 'spotListCon';
                    tempData2 += (j+1);
                /*console.log(tempData2);*/
                var tempSoptContent = document.getElementById(tempData2).value;
                /*console.log(tempSoptContent);*/
                var tempSpotLat = document.getElementById('spotListLat'+(j+1)).value;
                var tempSpotLng = document.getElementById('spotListLng'+(j+1)).value;
                var tempSoptCon2 = '<textarea name="spotListCon" id="spotListCon' + j + '" cols="23" rows="9" placeholder="내용 입력">' + tempSoptContent + '</textarea>';
                    tempSoptCon2 += '<input type="hidden" name="spotListLat" id="spotListLat' + j + '" value="' + tempSpotLat + '">';
                    tempSoptCon2 += '<input type="hidden" name="spotListLng" id="spotListLng' + j + '" value="' + tempSpotLng + '">';
                    
                spotDetailList[j].innerHTML = tempSoptCon2;
            }
        }

        spotNum = spotNum-1;    
    }
</script>

<script>
    //spot 정보창에 제목이 변경되면, marker에 info window의 이름도 자동으로 변경시켜준다.
function updateInfoWin(sno) {
    var tempData1 = 'spotListTitle'+sno;
    var tempSpotTitle = document.getElementById(tempData1).value;
    var iwContent = '<div id="markerwin'+ (sno+1) +'" style="padding:5px;">P' + (sno+1) + ' ' + tempSpotTitle + '</div>';
    infowinlist[sno].setContent(iwContent);  
}    
</script>

<script>
    //참여인원 최대, 최소수 체크
function checkmaxmin(inputtotalcount) {
    var inputcount = inputtotalcount.value;
    if(inputcount>20) {
        alert('최대 참여 인원은 20명까지 설정할 수 있습니다.');
        document.getElementById('totalcount').value = 20;
    } else if(inputcount<1) {
        alert('최소 참여 인원은 1명까지 설정 할 수 있습니다.');
        document.getElementById('totalcount').value = 1;
    }
}

$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

 function applyTour(applystate) {
	 var tempcon = $('#applyfrm').serializeObject();
	 
	 if(applystate==0){
		//1. 로그인 상태 확인후 로그인이 안되어 있으면 로그인창 띄우기
		 
		 
		 //2. 로그인 상태로 지원시 ajax 로 신청자 userid와 신청한 tourno 를 넘기고 해당 유저가 신청했는지, 안했다면 현재인원/최대인원 체크후 신청 성공 or 인원초과 or 중복지원 여부 리턴
		 $.ajax({
			url: '/tourapply'
			,data : JSON.stringify(tempcon)
			,dataType : 'json'
			,method : 'post'
			,contentType: 'application/json'
			,success : function(data) {
				if(data.result==0) {
					alert("지원 완료.");
					//page 리로드
				} else if(data.result==1) {
					alert("이미 지원한 투어입니다.");
				} else if(data.result==2) {
					alert("최대 지원자 수를 초고하였습니다.");
				} else if(data.result==3) {
					alert("종료된 투어입니다.");
				}
			}
		 	,error : function(data) {
		 		alert("에러 : 관리자에게 문의하세요");
		 	}
		 });	 
	 } else if(applystate==1) {
		 alert("모집이 마감된 일정입니다.");
	 } else {
		 alert("종료된 일정입니다."); 
	 }
 }
</script>
</body>
</html>