package com.bitcamp.rava;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RepairController {
	
	@RequestMapping(value = "/cafe", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		return "cafe/cafe";
	}
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String cafeadmin(Locale locale, Model model) {
	
		return "admin/cafeadmin";
	}
}
