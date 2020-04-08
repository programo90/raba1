package com.bitcamp.rava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@RequestMapping("/error/no-page")
	public String nopage() {
		
		return "error/404";
	}
	
	@RequestMapping("/error/bad-request")
	public String badrequest() {
		return "error/400";
	}
	
	@RequestMapping("/error/server-error")
	public String servererror() {
		return "error/500";
	}
	
	@RequestMapping("/error/other")
	public String other() {
		return "error/other";
	}
}
