package com.bitcamp.rava;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.CartListDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.service.CartService;

import lombok.extern.log4j.Log4j;

@Controller
/*@Log4j*/
public class CartController {

	@Autowired
	private CartService service;
	
	/* 바로구매 버튼을 클릭시 */
	@RequestMapping(value="/cart_insert")
	public String cart_insert(CartDTO dto,Model model) {
		
		/*log.info(dto);*/
		
		int result = service.insert(dto);
		
		String usercode = dto.getUsercode();
		
		/*log.info("usercode 1 : " + usercode );*/
		
		return "redirect:/cart_list/"+ usercode;
	}
	
	@RequestMapping(value="/cart_list/{usercode}")
	public String cart_list(@PathVariable String usercode, Model model) {
		
		/*log.info("usercode 2 : " + usercode );*/
		
		/* cno list를 받아온 상태 */
		List<GoodsDTO> list = service.list(usercode);
		
		List<CartDTO> cnolist = service.cnolist(usercode);
		
		List<BoardAttachVO> img_list = service.getImage(usercode);
		
		model.addAttribute("list", list);
		
		model.addAttribute("cnolist", cnolist);
		
		model.addAttribute("img_list", img_list);
		
		return "cart/cart_list";
	}
	

	@RequestMapping(value="/addcart")
	@ResponseBody
	public CartDTO addcart(@RequestParam String userid, @RequestParam int pno, @RequestParam int pamount, @RequestParam String pname) {
		
		CartDTO dto = new CartDTO();
		
		dto.setUsercode(userid);
		dto.setP_no(pno);
		dto.setP_amount(pamount);
		
		service.insert(dto);

		return dto;

	}
	
	
	@RequestMapping(value="/deleteCno")
	@ResponseBody
	public String deleteCno(@RequestParam String[] arr, @RequestParam String userid) {
		
		
		service.deleteCno(arr);
		
		
		return userid;
		
	}
	
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public String deleteAll(@RequestParam String userid) {
		
		/*log.info(userid);*/
		
		service.deleteAll(userid);
		
		return userid;
		
	}
	
	
	@RequestMapping(value="/checkAmount")
	@ResponseBody
	public String[] checkamount(@RequestParam String[] arr) {
		
		String[] result = service.checkAmount(arr);
		
		return result;
	}
	
}
