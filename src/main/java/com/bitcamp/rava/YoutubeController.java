package com.bitcamp.rava;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.YoutubeDTO;
import com.bitcamp.service.YoutubeService;

@Controller
public class YoutubeController {
	
	@Resource(name="YoutubeService")
	private YoutubeService youtubeservice;
	
	/*@RequestMapping(value = "/youtube", method = RequestMethod.GET)
	public String youtube(Locale locale, Model model) {
	
		return "youtube/youtube";
	}*/
	/*@RequestMapping(value = "/youtubeadmin", method = RequestMethod.GET)
	public String youtubeadmin(Locale locale, Model model) {
	
		return "admin/youtubeadmin";
	}*/
	
	@RequestMapping("/youtubeadmin")
	public String youtubeadminlist(Model model) {
		List<YoutubeDTO> adminlist = youtubeservice.selectAdminList();
		model.addAttribute("adminlist", adminlist);
		
		System.out.println("select");
		System.out.println(adminlist.get(0).getYoutubedate());
		return "admin/youtubeadmin";
	}
	@RequestMapping("/youtube")
	public String youtubelist(Model model) {
		List<YoutubeDTO> list = youtubeservice.selectList();
		model.addAttribute("list", list);
		return "youtube/youtube";
	}
	@RequestMapping("/youtubeinsert")
	public String youtubeinsert(YoutubeDTO dto) {
		youtubeservice.youtubeInsert(dto);
		
		return "redirect:/youtubeadmin";
	}
	@RequestMapping("/youtubedelete/{youtubeno}")
	public String youtubedelete(@PathVariable int youtubeno) {
		youtubeservice.youtubedelete(youtubeno);
		return "redirect:/youtubeadmin";
	}
//	@RequestParam(required = false) YoutubeDTO dto
	@RequestMapping(value="/youtubemodify")
	@ResponseBody
		public YoutubeDTO youtubemodify(@RequestParam String youtubetitle, @RequestParam String youtubeurl, @RequestParam int youtubeno) {
		YoutubeDTO dto = new YoutubeDTO(youtubetitle, youtubeurl, youtubeno); 
		System.out.println("test");
		int result = youtubeservice.youtubemodify(dto);
		System.out.println("result: "+result);
		return dto;
	}
}
