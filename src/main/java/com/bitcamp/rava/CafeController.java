package com.bitcamp.rava;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.dto.CafeDTO;
import com.bitcamp.service.CafeService;

@Controller
public class CafeController {
	
	private String path="temp";
	
	@Resource(name="CafeService")
	private CafeService cafeservice;

	@RequestMapping(value = "/cafe", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		return "cafe/cafe";
	}
	@RequestMapping(value = "/cafeadmin", method = RequestMethod.GET)
	public String cafeadmin(Locale locale, Model model) {
	
		return "admin/cafeadmin";
	}
	@RequestMapping("/cafeinsert")
	public String youtubeinsert(HttpServletRequest request, @ModelAttribute CafeDTO dto ) {
		
		//객체를 통해서 업로드 처리
		cafeservice.cafeinsert(request, dto);
		return "redirect:/cafeadmin";
	}
/*	@RequestMapping("/cafeinsert")
	public String youtubeinsert(HttpServletRequest request,HttpServletResponse response, CafeDTO dto, Model model) {
		
		MultipartFile multi = dto.getCafeimgone();
		
		List<MultipartFile> multi = new ArrayList<MultipartFile>();
		multi.add(dto.getCafeimgone());
		multi.add(dto.getCafeimgtwo());
		multi.add(dto.getCafeimgthree());
		multi.add(dto.getCafeimgfour());
		
		for(int i=0; i<multi.size(); i++) {
			
			MultipartFile multifile = multi.get(i);
		}
		
		try {
			String uploadpath = request.getServletContext().getRealPath("upload");
			
			if(!multifile.isEmpty())
			{
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);
				
				cafeservice.cafeInsert(dto);
				
				return "fileinsert";
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
		return "redirect:/cafeadmin";
	}*/
}
