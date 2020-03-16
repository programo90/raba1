<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/tour/tourinsert.css">
</head>
<body>
    <div id="tourinsert_wrap">
        <div id="tourinsert_contentblock">
           <form action="tourinsertresult" id="tourinsertform" method="post">
            <div id="tourinsert_mapblock">
                <div id="tourinsert_spotlistbox">
                   <div class="tourdetail_spotinfo1">
                       <div class="tourdetail_spotno"></div>
                       <div class="tourdetail_spotdetail"></div>
                    </div>
                    <div class="tourdetail_spotinfo1">
                       <div class="tourdetail_spotno"></div>
                       <div class="tourdetail_spotdetail"></div>
                    </div>
                    <div class="tourdetail_spotinfo1">
                       <div class="tourdetail_spotno"></div>
                       <div class="tourdetail_spotdetail"></div>
                    </div>
                    <div class="tourdetail_spotinfo1">
                       <div class="tourdetail_spotno"></div>
                       <div class="tourdetail_spotdetail"></div>
                    </div>
                </div>
                <div id="map_wrap">
                    <div id="map"></div>
                    <div class="custom_typecontrol radius_border" style="position: absolute;">
                        <span id="btnTour" class="selected_btn" onclick="setMapType('tourmap')">경로</span>
                        <span id="btnMarker" class="mapmode_btn" onclick="setMapType('markermap')">마커</span>
                    </div>                    
                </div>
            </div>
            <!--이하 입력창-->
            <input type="hidden" name="hostno" id="hostno" value="1">
            <div id="tourinsert_detailblock">
                    <div id="tourinsert_detaillbox1">
                    			<div class="tourinsert_inserttitle">
                                   <label for="tourdate">투어 제목</label>
                               </div>
                               <div class="tourinsert_insertcontent">
                                    <input type="text" name="tourtitle" id="tourtitle" size="50">
                               </div>
                               <div class="tourinsert_inserttitle">
                                     <label for="favorit_tour">대표경로 선택</label>
                                </div>
                                <div class="tourinsert_insertcontent">
                                  <select name="populartour" id="favorit_tour" onchange="selectFavoritTour()">
                                     <option value="0" selected>선택안함</option>
                                      <option value="1">첫번째 경로</option>
                                      <option value="2">두번째 경로</option>
                                      <option value="3">세번째 경로</option>
                                      <option value="4">네번째 경로</option>
                                      <option value="5">다섯번째 경로</option>
                                  </select>
                               </div>
                               <div class="tourinsert_inserttitle">
                                   <label for="tourdate">출발시각</label>
                               </div>
                               <div class="tourinsert_insertcontent">
                                    <input type="datetime-local" name="tourdate" id="tourdate">
                               </div>
                                <div class="tourinsert_inserttitle">
                                    <label for="startspot">출발위치</label>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <input type="text" name="startspot" id="startspot" size="50">
                                </div>
                                <div class="tourinsert_inserttitle">
                                   <label for="endspot">도착지점(반환지점)</label>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <input type="text" name="endspot" id="endspot" size="50">
                                </div>
                               <div class="tourinsert_inserttitle">
                                    <label for="esttime">예상 소요시간</label>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <input type="text" name="esttime" id="esttime" readonly placeholder="자동입력" size="50">
                                </div>
                               <div class="tourinsert_inserttitle">
                                    <label for="distance">총 거리</label>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <input type="text" name="distance" id="distance" readonly placeholder="자동입력" size="50">
                                </div>
                               <div class="tourinsert_inserttitle">
                                    <label for="">투어컨셉</label><br>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <label for="">샤방</label>
                                    <input type="radio" name="tourstyle" id="tourstyle_easy" value="easy" onclick="selectTourStyle()">
                                    <label for="">전투</label>
                                    <input type="radio" name="tourstyle" id="tourstyle_hard" value="hard" onclick="selectTourStyle()">
                                </div>
                               <div class="tourinsert_inserttitle">
                                    <label for="">투어타입</label><br>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <label for="tour_lightning">번개</label>
                                    <input type="radio" value="lightning" name="tourtype" id="tour_lightning">
                                    <label for="tour_planed">투어</label>
                                    <input type="radio" value="planed" name="tourtype" id="tour_planed">
                                </div>
                                <div class="tourinsert_inserttitle">
                                    <label for="totalcount">최대참여인원</label><br>
                                </div>
                                <div class="tourinsert_insertcontent">
                                    <input type="number" max="20" min="1" name="totalcount" id="totalcount" onchange="checkmaxmin(this)">
                                </div>
                            <div id="tourinsert_detailbox2">
                              <div>
                                  <label for="">상세내용</label><br>
                                  <textarea name="tourdetailcomm" id="tourdetailcomm" cols="120" rows="15"></textarea>
                              </div>
                               <div>
                                   <input type="button" value="저장" onclick="insertTour()">
                               </div>
                            </div>
                    </div>
                    <div>
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </div>
                    <div id="tour_latlng">
                    </div>
                    <div id="tour_markerdata">
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c228a6aa0b58c3275c3454e6b1a73c09"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.556431, 126.871739), // 지도의 중심좌표
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
    
    
    
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

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
    
});

function addMarker(position){
    var marker = new kakao.maps.Marker({
        map:map,
        position:position,
        zIndex: 1,
        clickable: true
    });
    
    marker.setMap(map);
    
    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div id="markerwin'+(spotNum+1)+'" style="padding:5px;">P' + (spotNum+1) + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

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
});                 

// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

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
});    

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

    document.getElementById("distance").value = distance + 'm';
    document.getElementById("esttime").value = Math.floor(bycicleTime / 60) + '시간' + bycicleTime % 60 + '분';
    
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
//즐겨찾는 일정 선택, 선택시 자동으로 해당 경로를 ajax로 불러와서 화면에 보여주고, 스크립트상 저장한다.
function selectFavoritTour(){
    var selectedFavoritTour = document.getElementById('favorit_tour');
    var selectedFavoritTourValue = selectedFavoritTour.options[selectedFavoritTour.selectedIndex].value;
    
    //선택한 경로의 값을 ajax로 받아온다.
    
    //받아온 값을 spotData에 넣는다.
    var spotData = [];
    
    //값을 가지고 if문 이하를 실행해 맵에 표시해준다.
    if(selectedFavoritTourValue==1){
        drawingFlag = true;
        deleteClickLine();
        deleteDistnce();
        deleteCircleDot();
    
    //DB에서 꺼내올 경로의 값, List로 받음
    spotData =[
        {lat:37.556431, lng:126.871739}
        ,{lat:37.554778, lng:126.873910}
        ,{lat:37.550142, lng:126.877418}
    ];
    //경로 첫 지점 설장
     var spotPosition = new kakao.maps.LatLng(spotData[0].lat, spotData[0].lng);
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
    var i;
    for( i =1; i < spotData.length; i++ ){
        var path = clickLine.getPath();
        var spotPosition = new kakao.maps.LatLng(spotData[i].lat, spotData[i].lng);
        path.push(spotPosition);
        clickLine.setPath(path);
        
        //마지막 지점은 점과 거리를 표시하지 않고, 총 거리와 예상 소요 시간을 표시
        if(i==(spotData.length-1)) {
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
        
        content += '<input type="hidden" name="tourlat" value="' + pathLat + '">';
        content += '<input type="hidden" name="tourlng" value="' + pathLng + '">';
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
</script>
</body>
</html>