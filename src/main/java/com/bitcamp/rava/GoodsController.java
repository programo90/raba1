package com.bitcamp.rava;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.GoodsSizeDTO;
import com.bitcamp.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
/*@Log4j*/
public class GoodsController {

	@Autowired
	private GoodsService goodsservice;
	
	@RequestMapping(value="/goods_insert")
	public String insertgoods() {
		
		return "admin/goods_insert";
	}
	
	@RequestMapping(value="/ins_goods_result")
	public String insertgoods_result(GoodsDTO dto,GoodsSizeDTO sizedto) {
		
		/*log.info(dto);
		
		log.info(sizedto);*/
		
		int result = goodsservice.insertvalue(dto, sizedto);
		
		return "redirect:/goods_list";
	}

	/* goods list page */
	@RequestMapping(value="/goods_list")
	public String goods_list(Model model) {
		
		List<GoodsDTO> list = goodsservice.goodslist();
		
		model.addAttribute("list", list);
		
		return "admin/goods_list";
	}
	
	/* goods delete goods */
	@RequestMapping(value="/deletegoods/{p_no}")
	public String goods_delete(@PathVariable int p_no) {
		
		int result = goodsservice.deletegoods(p_no);
		
		return "redirect:/goods_list";
	}
	
	@RequestMapping(value="/modifygoods/{p_no}")
	public String goods_modify(@PathVariable int p_no, Model model) {
	
		GoodsDTO dto = goodsservice.detailgoods(p_no);
		
		model.addAttribute("dto",dto);
		
		return "admin/goods_modify";
	}

	@RequestMapping(value="/modify_goods_result")
	public String modify_result(GoodsDTO dto,GoodsSizeDTO sizedto) {
		
		/*log.info(dto);
		
		log.info(sizedto);*/
		
		int result = goodsservice.modifygoods(dto,sizedto);
		
		return "redirect:/goods_list";
	}
	
	
}
