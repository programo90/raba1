package com.bitcamp.rava;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.dto.TourDTO;

@Controller
public class TourController {
	
	@RequestMapping(value = "/touradmin", method = RequestMethod.GET)
	public String touradmin(Locale locale, Model model) {
	
		return "admin/touradmin";
	}
	@RequestMapping("/tourlist")
	public String tourlist(Model model) {
		return "tour/tourlist";
	}
	
	@RequestMapping("/tour/{tourno}")
	public String tourdetail(@PathVariable("tourno") int tourno, Model model) {
		model.addAttribute("tourno", tourno);
		return "tour/tourdetail";
	}
	
	@RequestMapping("/tourinsert")
	public String tourinsert(Model model) {
		
		return "tour/tourinsert";
	}
	
	@RequestMapping("/tourinsertresult")
	public String tourinsertresult(TourDTO dto,Model model) {
		
		
		System.out.println("aaa");
		
		String[] list = dto.getSpotListTitle();
		list = dto.getSpotListCon();
		list = dto.getSpotListLat();
		list = dto.getSpotListLng();
		
		Integer[] list2 = dto.getSpotListNo();
		
		for(int i=0; i<list.length; i++) {
			System.out.println(list[i]);
		}
		
		
		return "redirect:tourlist";
	}
}


