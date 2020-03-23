package com.bitcamp.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitcamp.dto.CafeDTO;
import com.bitcamp.dto.CafeFileDTO;
import com.bitcamp.dto.CafeNutrtionDTO;
import com.bitcamp.mapper.CafeMapper;

@Service(value="CafeService")
public class CafeServiceImple implements CafeService{

	@Autowired
	private CafeMapper cafemapper;

/*	@Override
	public List<CafeNutrtionDTO> selectNutritionList() {
		return cafemapper.nutritionlistData();
	}*/

	@Override
	public List<CafeNutrtionDTO> selectNutritionList(String search, String searchtxt, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", (startRow-1));
		hm.put("pageSize", pageSize);
		
		return cafemapper.nutritionlistData(hm);
	}

	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm=new HashMap<>();	
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		return cafemapper.getCount(hm);
	}


	@Override
	public int cafeInsert(CafeDTO cafedto) {
		return cafemapper.insertData(cafedto);
	}

	@Override
	public int cafefileInsert(CafeFileDTO cafefiledto) {
		return cafemapper.fileinsertData(cafefiledto);
	}





}
	

