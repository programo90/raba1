package com.bitcamp.rava;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.dto.NoticeDTO;
import com.bitcamp.service.NoticeService;

import lombok.AllArgsConstructor;

@Controller

@RequestMapping("login/admin/*")
@AllArgsConstructor
public class InfoController {

	@Autowired
	private NoticeService noticeservice;
	
	//info 사용자 list
	@RequestMapping(value="/info")
	public String info(Model model){
		
		List<NoticeDTO> list = noticeservice.getlist();
		
		
		model.addAttribute("list", list);
		
		return "info/info";
	}
	
	/* 관리자 notice list */
	@RequestMapping(value="/notice_list") 
	public String n_list(Model model) {
		
		List<NoticeDTO> list = noticeservice.getlist();
		
		
		model.addAttribute("list", list);
		
		return "admin/notice_list";
	}
	
	@RequestMapping(value="/n_insert")
	public String n_insert() {
		
		return "admin/notice_insert";
	}
	
	@RequestMapping(value="/ins_ntc")
	public String ins_ntc(NoticeDTO dto){
		
		int result = noticeservice.ins_ntc(dto);
		
		return "redirect:/login/admin/notice_list";
	}
	
	@RequestMapping(value="/n_modify/{ntcno}")
	public String n_modify(@PathVariable int ntcno ,Model model) {
		
		NoticeDTO dto = noticeservice.detail(ntcno);
		
		
		model.addAttribute("dto",dto);
		
		return "admin/notice_modify";
	}
	
	@RequestMapping(value="/notice_modify")
	public String notice_modify(NoticeDTO dto) {
		
		int result = noticeservice.update_ntc(dto);
		
		return "redirect:/login/admin/notice_list";
	}
	
	@RequestMapping("/n_delete/{ntcno}")
	public String n_delete(@PathVariable int ntcno) {
		
		int result = noticeservice.delete_ntc(ntcno);
		
		return "redirect:/login/admin/notice_list";
	}
}
