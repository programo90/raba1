package com.bitcamp.rava;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.security.Login__MemberVO;
import com.bitcamp.service.MypageService;

@Controller
public class Mypage_Controller {
	
	@Autowired
	private MypageService service;
	
	
	@RequestMapping(value="/mypage/{userid}")
	public String doMypage(Model model, @PathVariable String userid) {
		
		Login__MemberVO vo = service.userinfo(userid);
		model.addAttribute("userinfo", vo);
		
		List<order__listDTO> list = service.orderlist(userid);
		model.addAttribute("orderinfo", list);
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/orderdetail/{userid}/{orderno}")
	public String doOrderDetail(Model model, @PathVariable String userid, @PathVariable int orderno) {
		
		//orderno를 통해서 userid를 받아오는게 맞는건가? 아니면 
		Login__MemberVO vo = service.userinfo(userid);
		model.addAttribute("userinfo", vo);
		
		return "mypage/orderdetail";
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
	
	@RequestMapping(value= "/updateInfo")
	@ResponseBody
	public int updateInfo(@RequestParam("userid") String userid 
			, @RequestParam("username") String username
			, @RequestParam("useremail") String useremail
			, @RequestParam("phone") String phone
			, @RequestParam("address") String address
			, @RequestParam("address2") String address2
			, @RequestParam("address3") String address3
			) {
		Login__MemberVO vo = new Login__MemberVO();
		vo.setUserid(userid);
		vo.setUsername(username);
		vo.setUseremail(useremail);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setAddress2(address2);
		vo.setAddress3(address3);
		service.updateInfo(vo); //vo를 찾아서 넣어주세요
		return 1;
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
