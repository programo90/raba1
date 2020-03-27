package com.bitcamp.rava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/login/*")
public class Login__sample_controller {
	
	@GetMapping("/all")
	public String doAll() {
		return "/login/all";
	}
	@GetMapping("/member")
	public String doMember() {
		return "/login/member";
	}

	@GetMapping("/host")
	public String doHost() {
		return "/login/host";
	}
	
	@GetMapping("/cart")
	public String doCart() {
		return "/login/cart";
	}
	
	@GetMapping("/admin")
	public String doAdmin() {
		return "/login/admin";
	}
	
	
	
	}
	
	

