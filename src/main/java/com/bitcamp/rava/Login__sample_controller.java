package com.bitcamp.rava;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/login/*")
public class Login__sample_controller {
	
	@GetMapping("/all")
	public String doAll() {
		System.out.println("?àÑÍµ¨ÎÇò ?ù¥?ö©?ù¥ Í∞??ä•?ï©?ãà?ã§.");
		
		return "/login/all";
	}
	@GetMapping("/member")
	public String doMember() {
		System.out.println("Î°úÍ∑∏?ù∏ ?ôÑÎ£?");
		return "/login/member";
	}

	@GetMapping("/host")
	public String doHost() {
		System.out.println("host ?éò?ù¥Ïß? Î°úÍ∑∏?ù∏ ?ôÑÎ£?");
		return "/login/host";
	}
	
	@GetMapping("/cart")
	public String doCart() {
		return "/login/cart";
	}
	
	@GetMapping("/admin")
	public String doAdmin() {
		System.out.println("Í¥?Î¶¨Ïûê ?†Ñ?ö©");
		return "/login/admin";
	}
	
	
	
	}
	
	

