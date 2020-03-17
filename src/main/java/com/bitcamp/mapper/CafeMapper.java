package com.bitcamp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CafeDTO;

@Mapper
public interface CafeMapper {

	void insertData(CafeDTO dto);


}
