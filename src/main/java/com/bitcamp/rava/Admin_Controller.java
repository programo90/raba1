package com.bitcamp.rava;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.AdminMakepageDTO;
import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.security.Login__MemberVO;
import com.bitcamp.service.AdminService;

@Controller
public class Admin_Controller {
	
	@Resource(name="adminservice")
	private AdminService Service;
	
	@RequestMapping("/adminmember")
	public String adminmember(@RequestParam(required=false,defaultValue="1") int currPage,@RequestParam(required=false,defaultValue="") String search,@RequestParam(required=false,defaultValue="") String searchtxt, Model model)
	{	
		Pattern d=Pattern.compile("(\\d{2}$)");
		if(search=="joindate" || "joindate".equals(search))
		{
			Matcher m=d.matcher(searchtxt);
			if(!m.find())
			{
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}
			else
			{
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		
		int totalCount = Service.totalCount(search,searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		AdminMakepageDTO page=new AdminMakepageDTO(currPage, totalCount, pageSize, blockSize);
		
		List<AdminMemberDTO> list=Service.adminmemberlist(search,searchtxt,page.getStartRow(),page.getEndRow());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "admin/memberadmin";
	}
	
	@RequestMapping("/adminorder")
	public String adminorder(@RequestParam(required=false,defaultValue="1") int currPage,@RequestParam(required=false,defaultValue="") String search,@RequestParam(required=false,defaultValue="") String searchtxt, Model model)
	{	
		Pattern d=Pattern.compile("(^[0-9]*$)");
		if(search=="oderno"||"oderno".equals(search)) {
			Matcher m=d.matcher(searchtxt);
			if(!m.find()) {
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		
		int totalCount = Service.ordertotalCount(search,searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		AdminMakepageDTO page=new AdminMakepageDTO(currPage, totalCount, pageSize, blockSize);
		
		List<OrderDTO> list=Service.adminorderlist(search,searchtxt,page.getStartRow(),page.getEndRow());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "admin/orderadmin";
	}
	
	@RequestMapping("/adminorder/{oderno}")
	public String del(@PathVariable int oderno)
	{
		Service.adminorderdelData(oderno);
		return "redirect:/adminorder";
	}
	
	@RequestMapping("/adminorderresult/{oderno}")
	public String boardUpdateResult(@PathVariable int oderno, OrderDTO dto)
	{
		dto.setOderno(oderno);
		Service.adminorder(dto);
		
		return "redirect:/adminorder";
	}
	
	@RequestMapping(value="/adminorderdetail/{orderno}")
	public String doOrderDetail(Model model, @PathVariable int orderno) {
		List<order__listDTO> list =Service.detail_orderlist(orderno);
		model.addAttribute("goodslist", list);
		OrderDTO dto = Service.orderdetail(orderno);
		model.addAttribute("orderinfo", dto);
		return "admin/adminorderdetail";
	}
	
}