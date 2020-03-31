package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CartDTO;
import com.bitcamp.mapper.CartMapper;

@Service
public class CartServiceImple implements CartService {

	@Autowired
	private CartMapper mapper;

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
}
