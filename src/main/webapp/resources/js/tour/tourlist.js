window.onload = function() {
	var temptagbox = document.getElementsByClassName('tourlist_content_tag');
	
	for(var i=0; i<temptagbox.length; i++) {
		var tempstate = temptagbox[i].children[0].value;
		if(tempstate == 0) {
			temptagbox[i].children[1].classList.add('tourlist_content_tag_app');
			temptagbox[i].children[1].innerText = '모집중';
		} else if(tempstate == 1) {
			temptagbox[i].children[1].classList.add('tourlist_content_tag_closed');
			temptagbox[i].children[1].innerText = '마감';
		} else if(tempstate == 2) {
			temptagbox[i].children[1].classList.add('tourlist_content_tag_ended');
			temptagbox[i].children[1].innerText = '종료';
		}
		
		var temppop = temptagbox[i].nextElementSibling;
		if(temppop.value==0) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">';
		} else if(temppop.value == 1) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">';
		} else if(temppop.value == 2) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">';
		} else if(temppop.value == 3) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">';
		} else if(temppop.value == 4) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">';
		} else if(temppop.value == 5) {
			temppop.nextElementSibling.innerHTML = '<img style="width:100%" class="tourlist_content_img" alt="img" src="/resources/img/tour/tourlist.jpg">';
		}
		
	}
	
	
}