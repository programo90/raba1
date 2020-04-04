window.onload = function() {
	var temptagbox = document.getElementsByClassName('tourlist_content_tag');
	
	for(var i=0; i<temptagbox.length; i++) {
		var tempstate = temptagbox[i].children[0].value;
		if(tempstate == 0) {
			temptagbox[i].children[1].classList.add('tourlist_content_tag_app');
			temptagbox[i].children[1].innerHTML = '모' +'<br>' + '집';
		} else if(tempstate == 1) {
			temptagbox[i].children[1].classList.add('tourlist_content_tag_closed');
			temptagbox[i].children[1].innerHTML = '마' +'<br>' + '감';
		} else if(tempstate == 2) {
			temptagbox[i].children[1].classList.add('tourlist_content_tag_ended');
			temptagbox[i].children[1].innerHTML = '종' +'<br>' + '료';
		}
		
		var temppop = temptagbox[i].nextElementSibling;
		if(temppop.value==0) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/custom-1.png">';
		} else if(temppop.value == 1) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/course-1-1.png">';
		} else if(temppop.value == 2) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/course-2-1.png">';
		} else if(temppop.value == 3) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/course-3-1.png">';
		} else if(temppop.value == 4) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/course-4-1.png">';
		} 
	}
	
	
}