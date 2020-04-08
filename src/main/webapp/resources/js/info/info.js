$(document).ready(function(){
	document.getElementsByClassName('adminnav')[8].style.backgroundColor="#e8e8e8";
	
	
	
			//게시판 script
            $("div.n_content").hide();
            
              $(".brd_list").on('click',function(){
                  
                $(this).next().slideToggle(300);
                //$(this).next().slideDown(300);
                $('.brd_list').not(this).next().slideUp(300);
                  
                return false;
                  
              });
              
});

//map script
// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script
// src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">




function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    mapTypeControl: false, //위성, 지도 모드 
    center: {lat:37.556500, lng: 126.871806}, //BA 위도 경도
    zoom: 13
  });
  
  var image = '/resources/img/info/ba_marker.png';
  var beachMarker = new google.maps.Marker({
    position: {lat: 37.556427, lng: 126.871794 },  /* {lat: 37.556500, lng: 126.871806},*/
    map: map,
    icon: image,
    zIndex :99 
  });
  
  
  new AutocompleteDirectionsHandler(map); // 맵의 요소들을 생성자를 통해 값을 넘김
}
/* 위) map을 뿌려주는 코드  */


/**
 * @constructor
 */
function AutocompleteDirectionsHandler(map) {
  this.map = map;
  this.originPlaceId = null;
  this.destinationPlaceId = null;
  this.travelMode = 'TRANSIT'; // default 
  this.directionsService = new google.maps.DirectionsService; //SERVICE클래스 선언
  this.directionsRenderer = new google.maps.DirectionsRenderer; //RENDERER클래스 선언
  this.directionsRenderer.setMap(map); //RENDERER에 MAP 세팅

  var originInput = document.getElementById('origin-input'); //출발지 값
  /* var destinationInput = document.getElementById('destination-input'); //도착지 값 */
  var modeSelector = document.getElementById('mode-selector'); //여행 모드 입력값


	// 입력받은 값(출발,도착지)를 자동 완성 시켜주는 클래스들
  var originAutocomplete = new google.maps.places.Autocomplete(originInput);
  // Specify just the place data fields that you need.
  originAutocomplete.setFields(['place_id']);

  /* var destinationAutocomplete =
      new google.maps.places.Autocomplete(destinationInput);
  // Specify just the place data fields that you need.
  destinationAutocomplete.setFields(['place_id']); */
  
	//??? ID - MODE 값을 넘기기 위한 SET설정
  //this.setupClickListener('changemode-walking', 'WALKING');
  this.setupClickListener('changemode-transit', 'TRANSIT');
 //this.setupClickListener('changemode-driving', 'DRIVING');

  this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
 /*  this.setupPlaceChangedListener(destinationAutocomplete, 'DEST'); */

  
  //출발, 도착지 입력란 및 여행모드 선택창의 위치 
  //this.map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(originInput);
  /* this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput); */
  //this.map.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(modeSelector);
}

// Sets a listener on a radio button to change the filter type on Places
// Autocomplete.
//setupclicklistener) 여행 모드의 값을 받아옴 id=='changemode' mode=='transit'
AutocompleteDirectionsHandler.prototype.setupClickListener = function( id, mode) {
  var radioButton = document.getElementById(id); //id 값을 radiobutton으로 치환
  var me = this;
  /* 어째서인지 radiobutton값을 지우면 입력창이 사라진다 원리를 정확히 알아내지는 못했다.   */
	
  //radiobutton을 클릭하면 mode가 변경이 됨 변경된 mode가 경로에 반영이 됨
   /* radioButton.addEventListener('click', function() {
    me.travelMode = mode;
    me.route();
     }); */
    /* rount를 transit으로 고정을 해서 위 코드를 지웠다.  */
};



//setupplacechangedlistener) 출발,도착지의 값을 받아옴
AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(
    autocomplete, mode) {
  var me = this;
  //map의 기초 값을 통해서 bounds를 가짐
  autocomplete.bindTo('bounds', this.map);

  autocomplete.addListener('place_changed', function() {
    var place = autocomplete.getPlace();

		//입력된 값이 저장되어 있는 값인지 확인
    if (!place.place_id) {
      window.alert('Please select an option from the dropdown list.');
      return;
    }
    if (mode === 'ORIG') { //mode에 따라 장소의id를 각각 출발,도착 id로 값을 넘김
      me.originPlaceId = place.place_id;
    } /* else {
      me.destinationPlaceId = place.place_id;
    } */
    me.route(); 
  });
};

//변경된 출발,도착지와 여행모드를 취합하여 route값을 출력하는 클래스
AutocompleteDirectionsHandler.prototype.route = function() {
  if (!this.originPlaceId ) { /*  || !this.destinationPlaceId */
    return;
  }//출발,도착지의 id의 값 확인
  var me = this;

	console.log('destplaceid'+ this.destinationPlaceId);
 	console.log('travelMode'+ this.travelMode);

  this.directionsService.route(
      {
        origin: {'placeId': this.originPlaceId},
        destination: {'placeId': 'ChIJ5QjSoKuefDUR1xsMc5-xQqo'}, /* this.destinationPlaceId : B.A. PLACEID*/
        travelMode: 'TRANSIT' /* this.mode */
      },
      
      function(response, status) {
        if (status === 'OK') {
          me.directionsRenderer.setDirections(response);
        } else {
          window.alert('Directions request failed due to ' + status);
        }
      });
};