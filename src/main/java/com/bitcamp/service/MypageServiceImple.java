package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.mapper.BoardAttachMapper;
import com.bitcamp.mapper.GoodsMapper;
import com.bitcamp.mapper.MypageMapper;
import com.bitcamp.security.Login__MemberVO;

@Service
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Autowired
	private GoodsMapper goodsmapper;
	
	@Autowired
	private BoardAttachMapper attachmapper;
	

	@Override
	public List<order__listDTO> wishlist(String userid) {
		List<order__listDTO> list0 = new ArrayList<order__listDTO>();
		List<GoodsDTO> wishlist = mapper.wishlist(userid);
		
		for(int i =0; i<wishlist.size(); i++) {
			String p_name = wishlist.get(i).getP_name();
			String p_price = ""+wishlist.get(i).getP_price();
			List<GoodsDTO> goodsdto = goodsmapper.select_pno(p_name); // pname을 넣어주고 goodsdto를 받아옵니다. 그리고 사전에 orderdto에 list를 넣어줬습니다. List<BoardAttachVO> list;
			int pno0 = goodsdto.get(0).getP_no(); //첫 번째pno를 받아왔습니다. 
				
				
			order__listDTO dto = new order__listDTO();
			dto.setImgvo(attachmapper.findByPno(pno0).get(0));  //list에 넣어줬습니다.
			dto.setP_name(p_name);
			dto.setP_price(p_price);
			
			list0.add(dto);
			
			 
		}
		
		return list0;
	}

	
	
	@Override
	public Login__MemberVO userinfo(String userid) {
		Login__MemberVO vo = mapper.userinfo(userid);
		return vo;
	}

	@Override
	public int updateInfo(Login__MemberVO vo) {
		mapper.updateInfo(vo);
		return 2;
	}

	@Override
	public List<order__listDTO> orderlist(String userid) {
		List<order__listDTO> list0 = new ArrayList<>();
		List<OrderDTO> list = mapper.order_list(userid);
		
		for(int i = 0; i<list.size(); i++) {
			int orderno = list.get(i).getOderno();
			String salesdate = list.get(i).getSalesdate();
			String orderstatus = list.get(i).getOrderstatus();
			String cpno = list.get(i).getOrdercpno();
			String ordercprice = list.get(i).getOrdercprice();
			
			StringTokenizer stPrice = new StringTokenizer(ordercprice, ",");
			StringTokenizer stLng = new StringTokenizer(cpno, ",");
			String[] lngList = new String[stLng.countTokens()];
			
			for(int j =0; j<lngList.length; j++) {
				String pno = stLng.nextToken();
				String price = stPrice.nextToken();
				List<GoodsDTO> list2 = mapper.goods_info(pno);
				
				
				for(int t =0; t<list2.size(); t++) {
					int p_no = list2.get(t).getP_no();
					String p_img = list2.get(t).getP_img();  //path정보를담아오는지 확인이 필요합니다. 
					String p_name = list2.get(t).getP_name();
					List<GoodsDTO> goodsdto = goodsmapper.select_pno(p_name); // pname을 넣어주고 goodsdto를 받아옵니다. 그리고 사전에 orderdto에 list를 넣어줬습니다. List<BoardAttachVO> list;
					int pno0 = goodsdto.get(0).getP_no(); //첫 번째pno를 받아왔습니다. 
					
					
					order__listDTO dto = new order__listDTO();
					dto.setImgvo(attachmapper.findByPno(pno0).get(0));  //list에 넣어줬습니다. 
					dto.setP_no(p_no);
					dto.setP_img(p_img);
					dto.setP_name(p_name);
					dto.setP_price(price);
					dto.setSalesdate(salesdate);
					dto.setOrderstatus(orderstatus);
					dto.setOderno(orderno);
					
					list0.add(dto);
				}
			}
		}
		System.out.println("test 1 : " + list0.size());
		return list0;
	}



	@Override
	public List<order__listDTO> detail_orderlist(int orderno) {
		List<order__listDTO> list0 = new ArrayList<order__listDTO>();
		
		List<OrderDTO> list1 = mapper.detailorderlist(orderno);
		
		for(int i =0; i<list1.size(); i++) {
			String orderstatus = list1.get(i).getOrderstatus();
			String salesdate = list1.get(i).getSalesdate();
			int oderno = list1.get(i).getOderno();
			
			String ordercprice = list1.get(i).getOrdercprice();
			StringTokenizer stPrice = new StringTokenizer(ordercprice,",");
			String[] priceList = new String[stPrice.countTokens()];
			
			String cpno = list1.get(i).getOrdercpno();
			StringTokenizer stLng = new StringTokenizer(cpno, ",");
			String[] lngList = new String[stLng.countTokens()];
			System.out.println("나오세요2 :"+ lngList);

			for(int j = 0; j<lngList.length; j++) {
				String pno = stLng.nextToken();
				String p_price = stPrice.nextToken();
				System.out.println("나오세요3 :"+ pno);
				System.out.println("나오세요4 :"+ p_price);
				GoodsDTO dto = mapper.goods_info2(pno);
				String p_name = dto.getP_name();
				List<GoodsDTO> goodsdto = goodsmapper.select_pno(p_name); // pname을 넣어주고 goodsdto를 받아옵니다. 그리고 사전에 orderdto에 list를 넣어줬습니다. List<BoardAttachVO> list;
				int pno0 = goodsdto.get(0).getP_no(); //첫 번째pno를 받아왔습니다.
				
				order__listDTO dto0 = new order__listDTO();
				dto0.setImgvo(attachmapper.findByPno(pno0).get(0));  //list에 넣어줬습니다.
				dto0.setP_price(p_price);
				dto0.setP_name(p_name);
				dto0.setOrderstatus(orderstatus);
				dto0.setOderno(oderno);
				dto0.setSalesdate(salesdate);
				dto0.setP_num(pno); //pno를 넣어주고서 링크로 연결이 필요하다. (jsp에서 구현시 )
				
				list0.add(dto0);
			}
		}
		
		return list0;
	}



	@Override
	public OrderDTO orderdetail(int orderno) {
		OrderDTO dto = mapper.order__detail(orderno);
		
		return dto;
	}



	@Override
	public void updateCashReceipts(order__listDTO dto) {
		mapper.updateCashReceipts(dto);
	}



	@Override
	public void updateShipInfo(order__listDTO dto) {
		mapper.updateShipInfo(dto);
	}



	@Override
	public List<OrderDTO> getordernolist(String userid) {
		List<OrderDTO> ordernolist =mapper.getordernolist(userid);
		return ordernolist;
	}



	 @Override
	   public void updateHostMsg(String userid, String hostmsg) {
	      HashMap<String, Object> map = new HashMap<>();
	      map.put("userid", userid);
	      map.put("hostcomment", hostmsg);
	      mapper.updateHostMsg(map);
	   }



	
}
