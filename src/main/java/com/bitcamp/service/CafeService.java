package com.bitcamp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitcamp.dto.CafeDTO;
import com.bitcamp.dto.CafeFileDTO;
import com.bitcamp.dto.CafeNutrtionDTO;

public interface CafeService {
	
	List<CafeNutrtionDTO> selectNutritionList(String search, String searchtxt, int startRow, int pageSize);

	int totalCount(String search, String searchtxt);

	int cafeInsert(CafeDTO cafedto);

	int cafefileInsert(CafeFileDTO cafefiledto);

	List<CafeDTO> selectAdminList(String search, String searchtxt, int startRow, int pageSize);

	CafeDTO modifyData(int cafemodifyno);

	int admincafeCount(String search, String searchtxt);

	int modifyResult(CafeDTO cafedto);

	int deleteData(int cafeno);

	int filedeleteData(int cafeno);

	CafeFileDTO getcafefile(int cafeno);

	List<CafeDTO> selectcafelist();

	CafeDTO cafedetailData(int cafeno);

	CafeNutrtionDTO detailnutriData(int cafeno);




}
