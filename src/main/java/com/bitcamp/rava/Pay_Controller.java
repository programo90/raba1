package com.bitcamp.rava;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Pay_Controller {

	@RequestMapping("/pay")
	public String adminmember()
	{	

		return "pay/pay";
	}

}