package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CartDTO;

@Mapper
public interface CartMapper {

	int insert(CartDTO dto);

	List<CartDTO> list(String usercode);

	List<CartDTO> cnolist(String usercode);

	
}
