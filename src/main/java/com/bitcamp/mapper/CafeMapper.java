package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitcamp.dto.CafeDTO;
import com.bitcamp.dto.CafeFileDTO;
import com.bitcamp.dto.CafeNutrtionDTO;

@Mapper
public interface CafeMapper {


	List<CafeNutrtionDTO> nutritionlistData(HashMap<String, Object> hm);

	int getCount(HashMap<String, Object> hm);


	int insertData(CafeDTO cafedto);

	int fileinsertData(CafeFileDTO cafefiledto);



}
