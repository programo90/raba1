package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.mapper.AdminMapper;
import com.bitcamp.mapper.AuthoritiesMapper;
import com.bitcamp.mapper.BoardAttachMapper;
import com.bitcamp.mapper.GoodsMapper;
import com.bitcamp.security.Login__MemberVO;

@Service("adminservice")
public class AdminServiceImple implements AdminService{

	@Inject
	private AdminMapper mapper;
	
	@Autowired
	private AuthoritiesMapper authmapper;
	
	@Autowired
	private GoodsMapper goodsmapper;

	@Autowired
	private BoardAttachMapper attachmapper;
	
	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm= new HashMap<>();
		
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		return mapper.adminmembergetCount(hm);
	}

	@Override
	public List<AdminMemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> hm =new HashMap<>();
		
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", (startRow-1));
		hm.put("endRow", endRow);
		
		System.out.println(search);
		System.out.println(searchtxt);
		System.out.println(endRow);
		System.out.println(startRow);
		List<AdminMemberDTO> user=  mapper.adminmemberlist(hm);
		
		for(int i=0; i<user.size(); i++)
		{
			String userid = user.get(i).getUserid();
			String[] userauth =authmapper.getauth(userid);
			
			user.get(i).setAuth(userauth[userauth.length-1]);
			
		}
		
		return user;
	}

	@Override
	public int ordertotalCount(String search, String searchtxt) {
		HashMap<String, Object> hm= new HashMap<>();
		
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		return mapper.adminordergetCount(hm);
	}

	@Override
	public List<OrderDTO> adminorderlist(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> hm =new HashMap<>();
		
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", (startRow-1));
		hm.put("endRow", endRow);
		
		System.out.println(search);
		System.out.println(searchtxt);
		System.out.println(endRow);
		System.out.println(startRow);
		return mapper.adminorderlist(hm);
	}

	@Override
	public int adminorderdelData(int oderno) {
		// TODO Auto-generated method stub
		return mapper.adminorderdel(oderno);
	}

	@Override
	public int adminorder(OrderDTO dto) {
		// TODO Auto-generated method stub
		return mapper.adminorderup(dto);
	}

	@Override
	public OrderDTO orderdetail(int orderno) {
		OrderDTO dto = mapper.order__detail(orderno);
		
		return dto;
	}

	@Override
	public List<order__listDTO> detail_orderlist(int orderno) {
		List<order__listDTO> list0 = new ArrayList<order__listDTO>();
		
		List<OrderDTO> list1 = mapper.detailorderlist(orderno);
		
		for(int i =0; i<list1.size(); i++) {
			String orderstatus = list1.get(i).getOrderstatus();
			System.out.println("dsadsa : "+list1);
			
			String ordercprice = list1.get(i).getOrdercprice();
			StringTokenizer stPrice = new StringTokenizer(ordercprice,",");
			String[] priceList = new String[stPrice.countTokens()];
			
			String cpno = list1.get(i).getOrdercpno();
			System.out.println("dsadas cpno:"+cpno);
			StringTokenizer stLng = new StringTokenizer(cpno, ",");
			String[] lngList = new String[stLng.countTokens()];
			for(int j = 0; j<lngList.length; j++) {
				String pno = stLng.nextToken();
				String p_price = stPrice.nextToken();
				GoodsDTO dto = mapper.goods_info2(pno);
				String p_name = dto.getP_name();
				
				System.out.println("dsada:"+dto.getP_name());
				
				order__listDTO dto0 = new order__listDTO();
				dto0.setP_price(p_price);
				dto0.setOrderstatus(orderstatus);
				dto0.setP_name(p_name);
				dto0.setP_num(pno); //pno를 넣어주고서 링크로 연결이 필요하다. (jsp에서 구현시 )
				
				List<GoodsDTO> goods= goodsmapper.select_pno(p_name);
				
				int imgpno = goods.get(0).getP_no();
				
				dto0.setImgvo(attachmapper.findByPno(imgpno).get(0));
				System.out.println("imgpno : " + attachmapper.findByPno(imgpno).get(0));
				list0.add(dto0);
			}
		}
		
		return list0;
	}

	@Override
	public Login__MemberVO userinfo(String userid) {
		Login__MemberVO vo = mapper.userinfo(userid);
		return vo;
	}

	@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
	@Override
	public void changeauth(AdminMemberDTO dto) {
		
		authmapper.delete(dto);
		authmapper.delete2(dto);
		
		if(dto.getAuth().equals("ROLE_MEMBER"))
		{
			authmapper.insert1(dto);
		}
		else if(dto.getAuth().equals("ROLE_HOST"))
		{
			authmapper.insert1(dto);
			authmapper.insert2(dto);
			authmapper.hostinsert1(dto);
		}
		else if(dto.getAuth().equals("ROLE_ADMIN"))
		{
			authmapper.insert1(dto);
			authmapper.insert2(dto);
			authmapper.insert3(dto);
			authmapper.hostinsert1(dto);
		}
		
	}
}
