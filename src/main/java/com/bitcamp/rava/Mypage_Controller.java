package com.bitcamp.rava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Mypage_Controller {
	
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String doGallery() {
	
		return "gallery/gallery";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String doMypage() {
	
		return "mypage/mypage";
	}
	
//	---------------------------------------------------------------------
	
	@RequestMapping(value = "/orderdetail", method = RequestMethod.GET)
	public String doOrderdetail() {
	
		return "mypage/orderdetail";
	}
	
	@RequestMapping(value = "/request_cancel", method = RequestMethod.GET)
	public String doCancel() {
	
		return "mypage/request_cancel";
	}
	
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String doWishlist() {
	
		return "mypage/wishlist";
	}
	
	
}
