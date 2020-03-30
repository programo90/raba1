package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.mapper.MypageMapper;

@Service
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public String findUsername(String userid) {
		System.out.println("bbaa" + userid);
		String username = mapper.findUsername(userid);
		System.out.println("fff" + username);
		return username;
	}

	@Override
	public List<GoodsDTO> wishlist(String userid) {
		
		List<GoodsDTO> wishlist = mapper.wishlist(userid);
		
		return wishlist;
	}

	
}
