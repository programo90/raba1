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
	
	
	/* 사용자  GOODS list PAGE*/
	@RequestMapping(value="/goods_list")
	public String goodslist(Model model) {
		
		List<GoodsDTO> list = goodsservice.goodsnamelist();
		
		model.addAttribute("list", list);
		
		return "goods/goods_list";
	}
	
	/* 사용자 Goods detail page */
	@RequestMapping(value="/goods_detail/{p_name}")
	public String goodsdetail(@PathVariable String p_name, Model model) {
		
		List<GoodsDTO> list = goodsservice.goodsnamedetail(p_name);
		
		model.addAttribute("list", list);
		
		return "goods/goods_detail";
	}
	
	
	@RequestMapping(value="/goods_insert")
	public String insertgoods() {
		
		return "admin/goods_insert";
	}
	
	@RequestMapping(value="/ins_goods_result")
	public String insertgoods_result(GoodsDTO dto,GoodsSizeDTO sizedto) {
		
		/*log.info(dto);
		
		log.info(sizedto);*/
		
		int result = goodsservice.insertvalue(dto, sizedto);
		
		return "redirect:/admin_goods_list";
	}

	/* goods delete goods */
	@RequestMapping(value="/deletegoods/{p_no}")
	public String goods_delete(@PathVariable int p_no) {
		
		int result = goodsservice.deletegoods(p_no);
		
		return "redirect:/admin_goods_list";
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
		
		return "redirect:/admin_goods_list";
	}
	
	/* made by taekwan */
	@RequestMapping(value="/admin_goods_list")
	public String goodsadmin(Model model) {
	
		List<GoodsDTO> list = goodsservice.goodslist(); 
		
		model.addAttribute("list", list);
		
		return "admin/goodsadmin";
	}
	
}
