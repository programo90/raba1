package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CartDTO;
import com.bitcamp.mapper.CartMapper;
import com.bitcamp.mapper.GoodsMapper;

@Service
public class CartServiceImple implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Autowired
	private GoodsMapper goods_mapper;

	@Override
	public int insert(CartDTO dto) {
		// TODO Auto-generated method stub
		
		int result = mapper.insert(dto);
		
		return 0;
	}

	@Override
	public List<CartDTO> list(String usercode) {
		// TODO Auto-generated method stub
		
		List<CartDTO> list = mapper.list(usercode);
		
		return list;
	}

	@Override
	public List<CartDTO> cnolist(String usercode) {
		// TODO Auto-generated method stub
		
		List<CartDTO> cnolist = mapper.cnolist(usercode);		
		
		return cnolist;
	}

	@Override
	public String getName(int p_no) {
		// TODO Auto-generated method stub
		
		return goods_mapper.find_pname(p_no);
	}

	@Override
	public void deleteAll(String userid) {
		// TODO Auto-generated method stub
		
		mapper.deleteAll(userid);
		
	}

	@Override
	public void deleteCno(String[] arr) {
		// TODO Auto-generated method stub
		
		for(int i =0; i < arr.length; i++) {
			
			String cno = arr[i];
			
			mapper.deleteCno(cno);
		}
		
	}
}
