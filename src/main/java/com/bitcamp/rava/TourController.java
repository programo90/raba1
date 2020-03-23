package com.bitcamp.rava;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.bitcamp.dto.HostDTO;
import com.bitcamp.dto.TourApplyDTO;
import com.bitcamp.dto.TourDTO;
import com.bitcamp.dto.TourMarkerDTO;
import com.bitcamp.dto.TourPage;
import com.bitcamp.service.TourService;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
public class TourController {
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping(value = "/touradmin", method = RequestMethod.GET)
	public String touradmin(Locale locale, Model model) {
	
		return "admin/touradmin";
	}
	
	
	@RequestMapping("/tourlist")
	public String tourlist(@RequestParam(required=false, defaultValue="1") int currPage 
							,Model model) {
		
		int totalRow = tourService.totalCount();
		int pageSize = 9;
		int blockSize = 5;
		TourPage page = new TourPage(currPage, totalRow, pageSize, blockSize);
		
		List<TourDTO> list = tourService.tourList(page.getStartRow(),page.getPageSize());
		
		model.addAttribute("page", page);
		model.addAttribute("list",list);
		
		return "tour/tourlist";
	}
	
	@RequestMapping("/tourdetail/{tourno}")
	public String tourdetail(@PathVariable("tourno") int tourno, Model model) {
		
		TourDTO dto = tourService.tourDetail(tourno);
		List<TourMarkerDTO> markerlist = tourService.markerList(tourno);
		HostDTO hostdto = tourService.hostDetail(dto.getHostno());
		
		model.addAttribute("hostdto", hostdto);
		model.addAttribute("dto", dto);
		model.addAttribute("markerlist", markerlist);
		
		
		return "tour/tourdetail";
	}
	
	@RequestMapping("/tourinsert")
	public String tourinsert(Model model) {
		
		return "tour/tourinsert";
	}
	
	@RequestMapping("/tourinsertresult")
	public String tourinsertresult(TourDTO dto,Model model) {

		tourService.insertTour(dto);
	
		return "redirect:/tourlist";
	}
	
	@RequestMapping(value="/tourapply", method = RequestMethod.POST)
	public @ResponseBody int tourapply(@RequestBody TourApplyDTO adto) {
		//결과값을 구하는 기능 구현
		int result = tourService.applyTour(adto.getUserid(), adto.getTourno());

		return result;
	}
	
	@RequestMapping("/tourdelete/{tourno}")
	public String tourdelete(@PathVariable int tourno) {
		
		tourService.deleteTour(tourno);
		
		return "redirect:/tourlist";
	}
	
	@RequestMapping("/tourupdate/{tourno}")
	public String tourupdate(@PathVariable int tourno, Model model) {
		
		TourDTO dto = tourService.tourDetail(tourno);
		List<TourMarkerDTO> markerlist = tourService.markerList(tourno);
		HostDTO hostdto = tourService.hostDetail(dto.getHostno());
		
		model.addAttribute("hostdto", hostdto);
		model.addAttribute("dto", dto);
		model.addAttribute("markerlist", markerlist);
		
		return "tour/tourupdate";
	}
	
	@RequestMapping("/tourupdateresult")
	public String tourupdateresult(TourDTO dto,Model model) {

		tourService.updateTour(dto);
	
		return "redirect:/tourlist";
	}
	
}



