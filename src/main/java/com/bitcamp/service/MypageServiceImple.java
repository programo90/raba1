package com.bitcamp.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.mapper.MypageMapper;
import com.bitcamp.security.Login__MemberVO;

@Service
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mapper;
	

	@Override
	public List<GoodsDTO> wishlist(String userid) {
		
		List<GoodsDTO> wishlist = mapper.wishlist(userid);
		
		return wishlist;
	}

	
	
	@Override
	public Login__MemberVO userinfo(String userid) {
		Login__MemberVO vo = mapper.userinfo(userid);
		return vo;
	}

	@Override
	public int updateInfo(Login__MemberVO vo) {
		System.out.println(vo+"11");
		mapper.updateInfo(vo);
		return 2;
	}

	@Override
	public List<order__listDTO> orderlist(String userid) {
		List<order__listDTO> list0 = new ArrayList<>();
		List<OrderDTO> list = mapper.order_list(userid);
		
		for(int i = 0; i<list.size(); i++) {
			int waybillno = list.get(i).getWaybillno();
			String salesdate = list.get(i).getSalesdate();
			String orderstatus = list.get(i).getOrderstatus();
			String cpno = list.get(i).getOrdercpno();
			StringTokenizer stLng = new StringTokenizer(cpno,",");
			String[] lngList = new String[stLng.countTokens()];
			
			for(int j =0; j<lngList.length; j++) {
				String pno = stLng.nextToken();;
				List<GoodsDTO> list2 = mapper.goods_info(pno);
				
				for(int t =0; t<list2.size(); t++) {
					int p_no = list2.get(t).getP_no();
					String p_img = list2.get(t).getP_img();  //path정보를담아오는지 확인이 필요합니다. 
					String p_name = list2.get(t).getP_name();
					int p_price = list2.get(t).getP_price();
					
					order__listDTO dto = new order__listDTO();
					dto.setP_no(p_no);
					dto.setP_img(p_img);
					dto.setP_name(p_name);
					dto.setP_price(p_price);
					dto.setWaybillno(waybillno);
					dto.setSalesdate(salesdate);
					dto.setOrderstatus(orderstatus);
					
					list0.add(dto);
				}
			}
		}
		return list0;
	}


	
}
