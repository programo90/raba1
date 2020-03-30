package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.dto.GoodsDTO;

public interface MypageMapper {

	String findUsername(String userid);

	List<GoodsDTO> wishlist(String userid);
	
}
