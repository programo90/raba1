package com.bitcamp.rava;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Login__common_controller {
	
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		System.out.println("access Denied :" + auth);
		
		model.addAttribute("msg", "Access Denied");
		return "/login/accessError";
	}
	
	@GetMapping("/customLogin")
	public String loginInput(String error, String logout, Model model) {
		System.out.println("error:" + error);
		System.out.println("logout:" + logout);
		
		if(error!=null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout!=null) {
			model.addAttribute("logout", "Logout!!");
		}
		return "/login/customLogin";
	}
	@GetMapping("/customLogout")
	public String logoutGET() {
		System.out.println("custom logout");
		return "/login/customLogout";
	}
	@GetMapping("/intro")
	public String goIntro() {
		System.out.println("go logout");
		return "/intro/intro";
	}
	
	
}
