package com.bitcamp.rava;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.CalendarDTO;
import com.bitcamp.dto.RepairDTO;
import com.bitcamp.service.RepairService;
import com.google.gson.JsonArray;

@Controller
public class RepairController {
	
	@Resource(name="RepairService")
	private RepairService repairservice;
	
	@RequestMapping(value = "/repair", method = RequestMethod.GET)
	public String repair(Locale locale, Model model) {
		List<RepairDTO> relist = repairservice.replyselectList();
		model.addAttribute("relist", relist);
		return "repair/repair";
	}
	
	@RequestMapping("/repairadmin")
	public String repairadmin(Model model) {
		List<CalendarDTO> callist =repairservice.calselectList();
		model.addAttribute("callist", callist);
		
		List<RepairDTO> relist = repairservice.replyselectList();
		model.addAttribute("relist", relist);
		return "admin/repairadmin";
	}
	
	@RequestMapping(value="/asdf" ,method = RequestMethod.GET)
	@ResponseBody
	public List<CalendarDTO> asdf() {
		List<CalendarDTO> callist =repairservice.calselectList();
		//callist 에서 dto 꺼내서 jsonobject로 변형
		//json array에 json object 넣어서 리턴
		
		JsonArray arr = new JsonArray();
		JSONArray arry = new JSONArray();
		for(int i=0; i<callist.size(); i++) {
			CalendarDTO dto = callist.get(i);
			System.out.println(dto.getTitle());
			System.out.println(dto.getStart());
			
			JSONObject obj = new JSONObject(dto);
			arry.put(obj);
			
			/*JsonObject obj = new JsonObject();
			obj.add("startday", );
			obj.add("end", value);*/
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("temcal", callist);
		return callist;
	}
	
	@RequestMapping("/calinsert")
	public String calinsert(CalendarDTO dto) {
		repairservice.calinsert(dto);
		return "redirect:/repairadmin";
	}
	@RequestMapping("/calmodify")	//calno 를 보내줘야하는것인가...
	public String calmodify(CalendarDTO dto) {
		repairservice.calmodify(dto);
		return "redirect:/repairadmin";
	}
	@RequestMapping("/caldelete")	//calno 를 보내줘야하는것인가
	public String caldelete(int calno) {
		repairservice.caldelete(calno);
		return "redirect:/repairadmin";
	}
	
	//예약문의글 작성
	@RequestMapping("/reservationinsert")
	@ResponseBody
	public List<RepairDTO> reservationinsert(RepairDTO redto) {
		return repairservice.reservationinsert(redto);
	}
}
