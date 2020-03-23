package com.bitcamp.rava;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.AdminMakepage;
import com.bitcamp.dto.AdminMemberDTO;
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
		
		AdminMakepage page=new AdminMakepage(currPage, totalCount, pageSize, blockSize);
		
		List<AdminMemberDTO> list=Service.adminmemberlist(search,searchtxt,page.getStartRow(),page.getEndRow());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "admin/memberadmin";
	}
	
	@RequestMapping("/admingoods")
	public String admingoods(/*@RequestParam(required=false,defaultValue="1") int currPage,@RequestParam(required=false,defaultValue="") String search,@RequestParam(required=false,defaultValue="") String searchtxt, Model model*/)
	{	
/*		Pattern d=Pattern.compile("(\\d{2}$)");
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
		
		AdminMakepage page=new AdminMakepage(currPage, totalCount, pageSize, blockSize);
		
		List<AdminMemberDTO> list=Service.admingoodslist(search,searchtxt,page.getStartRow(),page.getEndRow());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);*/
		
		return "admin/goodsadmin";
	}
}