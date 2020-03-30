package com.bitcamp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.GoodsDTO;

@Mapper
public interface MypageService {
	String findUsername(String userid);
	List<GoodsDTO> wishlist(String userid);
}
