package com.bitcamp.rava;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.dto.CartDTO;
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
		
		int usercode = dto.getUsercode();
		
		/*log.info("usercode 1 : " + usercode );*/
		
		return "redirect:/cart_list/"+ usercode;
	}
	
	@RequestMapping(value="/cart_list/{usercode}")
	public String cart_list(@PathVariable int usercode, Model model) {
		
		/*log.info("usercode 2 : " + usercode );*/
		
		/* cno list를 받아온 상태 */
		List<CartDTO> list = service.list(usercode);
		
		model.addAttribute("list", list);
		
		return "cart/cart_list";
	}
}
