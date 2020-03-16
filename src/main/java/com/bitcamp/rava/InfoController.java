package com.bitcamp.rava;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.NoticeDTO;
import com.bitcamp.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("login/admin/*")
@AllArgsConstructor
public class InfoController {

	@Autowired
	private NoticeService noticeservice;
	
	//info 창을 따로 만들어야 할듯
	@RequestMapping(value="/info")
	public String info(Model model){
		
		List<NoticeDTO> list = noticeservice.getlist();
		
		log.info(list);
		
		model.addAttribute("list", list);
		
		return "info/info";
	}
	
	@RequestMapping(value="/n_list") 
	public String n_list(Model model) {
		
		List<NoticeDTO> list = noticeservice.getlist();
		
		log.info(list);
		
		model.addAttribute("list", list);
		
		return "admin/n_list";
	}
	
	@RequestMapping(value="/n_insert")
	public String n_insert() {
		
		return "admin/n_insert";
	}
	
	@RequestMapping(value="/ins_ntc")
	public String ins_ntc(NoticeDTO dto){
		
		int result = noticeservice.ins_ntc(dto);
		
		return "redirect:/login/admin/n_list";
	}
	
	@RequestMapping(value="/n_modify/{ntcno}")
	public String n_modify(@PathVariable int ntcno ,Model model) {
		
		NoticeDTO dto = noticeservice.detail(ntcno);
		
		log.info(dto);
		
		model.addAttribute("dto",dto);
		
		return "admin/mdf_ntc";
	}
	
	@RequestMapping(value="/mdf_ntc")
	public String mdf_ntc(NoticeDTO dto) {
		
		int result = noticeservice.update_ntc(dto);
		
		return "redirect:/login/admin/n_list";
	}
	
	@RequestMapping("/n_delete/{ntcno}")
	public String delete(@PathVariable int ntcno) {
		
		int result = noticeservice.delete_ntc(ntcno);
		
		return "redirect:/login/admin/n_list";
	}
}
