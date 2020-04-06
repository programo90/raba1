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

	List<CafeDTO> adminlistData(HashMap<String, Object> hm);

	CafeDTO modifyData(int cafemodifyno);

	int admingetCount(HashMap<String, Object> hm);

	int modifyResultData(CafeDTO cafedto);

	int deleteData(int cafeno);

	int filedeleteData(int cafeno);

	CafeFileDTO fileselectDate(int cafeno);

	List<CafeDTO> selectcafeData();

	CafeDTO cafedetailData(int cafeno);

	CafeNutrtionDTO detailnutriData(int cafeno);



}
