package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.GoodsDTO;

@Mapper
public interface GoodsMapper {

	void insert(GoodsDTO dto);

	List<GoodsDTO> list();

	void delete(int p_no);

	GoodsDTO detail(int p_no);

	int modify(GoodsDTO dto);

	List<GoodsDTO> namelist();

	List<GoodsDTO> goodsnamedetail(String p_name);

}
