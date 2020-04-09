package com.bitcamp.rava;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartListDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.service.PayService;


@Controller
public class Pay_Controller {

	@Autowired
	private PayService payservice;
	
	@RequestMapping("/pay")
	public String pay(CartListDTO cartlistdto,Model model)
	{	
		
		
		/*List<GoodsDTO> goods=payservice.goods(cartlistdto);*/
		
		Integer[] cno = cartlistdto.getCnolist2();
		
		String userid = cartlistdto.getUsercode();
		
		String totalprice = cartlistdto.getTotalprice();
		
		List<GoodsDTO> goods = payservice.goodsdate(cno);
		
		List<BoardAttachVO> imglist = payservice.selectimg(cno);
		
		AdminMemberDTO user = payservice.user(userid);
		
		model.addAttribute("user",user);
		
		model.addAttribute("imglist", imglist);
		
		model.addAttribute("totalprice", totalprice);
		
		model.addAttribute("goods",goods);
		
		return "pay/pay";
	}
	
	@RequestMapping("/pay_resert")
	public String adminmember(OrderDTO orderdto)
	{	
		payservice.orderinsert(orderdto);
		
		System.out.println("fdfd"+orderdto.getPostno());
		return "redirect:/mypage/";
	}
	
	   @ResponseBody
	   @RequestMapping(value="/payinsert/complete",method=RequestMethod.POST)
	   public int payinsert(Model model, @RequestBody OrderDTO Data) {
	      
		 System.out.println(Data.getOrdercamount());
		   
		  int r=0;

	      
	      r = payservice.insertOrder(Data);
	      
	      return r;
	   }
}