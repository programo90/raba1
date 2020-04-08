package com.bitcamp.rava;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	
	@RequestMapping(value="/mypage")
	public String doMypage(Principal principal, Model model, HttpServletRequest request) {
		String userid = principal.getName();
		Login__MemberVO vo = service.userinfo(userid);
		model.addAttribute("userinfo", vo);
		
		List<order__listDTO> list = service.orderlist(userid);
		model.addAttribute("orderinfo", list);
		
		String realuploadpath = request.getSession().getServletContext().getRealPath("path");
		System.out.println(realuploadpath);
		
		return "mypage/mypage";
	}
	
	
	
	@RequestMapping(value="/orderdetail/{userid}/{orderno}")
	public String doOrderDetail(Model model, @PathVariable String userid, @PathVariable int orderno) {
		Login__MemberVO vo = service.userinfo(userid);
		model.addAttribute("userinfo", vo);
		List<order__listDTO> list =service.detail_orderlist(orderno);
		model.addAttribute("goodslist", list);
		OrderDTO dto = service.orderdetail(orderno);
		model.addAttribute("orderinfo", dto);
		return "mypage/orderdetail";
	}
	
	
	
	@RequestMapping(value = "/wishlist")
	public String doWishlist(Principal principal, Model model) {
		String userid = principal.getName();
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
	
	@RequestMapping(value= "/updateShipInfo")
	@ResponseBody
	public int updateShipInfo(@RequestParam("orderuname") String orderuname
			, @RequestParam("orderuphone") String orderuphone
			, @RequestParam("orderuaddr1") int orderuaddr1
			, @RequestParam("orderuaddr2") String orderuaddr2
			, @RequestParam("orderuaddr3") String orderuaddr3
			, @RequestParam("ordermg") String ordermg
			, @RequestParam("oderno") int oderno
			) {
		order__listDTO dto = new order__listDTO();
		dto.setOrderuname(orderuname);
		dto.setOrderuphone(orderuphone);
		dto.setOrderuaddr1(orderuaddr1);
		dto.setOrderuaddr2(orderuaddr2);
		dto.setOrderuaddr3(orderuaddr3);
		dto.setOrdermg(ordermg);
		dto.setOderno(oderno);
		
		service.updateShipInfo(dto);
		return 1;
	}
	
	
	
	@RequestMapping(value= "/updateCashReceipts")
	@ResponseBody
	public int updateCashReceipts(@RequestParam("cashreceipts") String cashreceipts, @RequestParam("oderno") int oderno) {
		System.out.println("나오나요 " + cashreceipts);
		order__listDTO dto = new order__listDTO();
		dto.setCashreceipts(cashreceipts);
		dto.setOderno(oderno);
		service.updateCashReceipts(dto);
		
		
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
