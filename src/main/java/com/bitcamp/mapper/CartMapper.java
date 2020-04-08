package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.GoodsDTO;

@Mapper
public interface CartMapper {

	int insert(CartDTO dto);

	List<GoodsDTO> list(String usercode);

	List<CartDTO> cnolist(String usercode);

	void deleteAll(String userid);

	void deleteCno(String cno);

	int getpno(int cno);

	
}
