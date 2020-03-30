package com.bitcamp.rava;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.service.MypageService;

@Controller
public class Mypage_Controller {
	
	@Autowired
	private MypageService service;
	
	
	@RequestMapping(value="/mypage/{userid}")
	public String doMypage(Model model, @PathVariable String userid) {
		
		String username = service.findUsername(userid);
		model.addAttribute("username", username);
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/wishlist/{userid}")
	public String doWishlist(Model model, @PathVariable String userid) {
		System.out.println("aaabbb" + userid);
		List<GoodsDTO> wishlist = service.wishlist(userid);
		int count = wishlist.size();
		model.addAttribute("list", wishlist);
		model.addAttribute("count", count);
		System.out.println(count);
		return "mypage/wishlist";
	}
	
//	---------------------------------------------------------------------
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String doGallery() {
		
		return "gallery/gallery";
	}
	
	@RequestMapping(value = "/orderdetail", method = RequestMethod.GET)
	public String doOrderdetail() {
	
		return "mypage/orderdetail";
	}
	
	@RequestMapping(value = "/request_cancel", method = RequestMethod.GET)
	public String doCancel() {
	
		return "mypage/request_cancel";
	}
	
	
	
}
