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

	@Override
	public List<CafeDTO> selectAdminList(String search, String searchtxt, int startRow, int pageSize) {
		HashMap<String, Object> hm=new HashMap<>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", (startRow-1));
		hm.put("pageSize", pageSize);
		List<CafeDTO> list = cafemapper.adminlistData(hm);
		for(CafeDTO dto : list) {
			System.out.println(dto.getFilesystemname());
			dto.setFilesystemname("C:\\cafeimg"+dto.getFilesystemname());
		}
		return list;
	}

	@Override
	public CafeDTO modifyData(int cafemodifyno) {
		return cafemapper.modifyData(cafemodifyno);
	}

	@Override
	public int admincafeCount(String search, String searchtxt) {
		HashMap<String, Object> hm=new HashMap<>();	
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		return cafemapper.admingetCount(hm);
	}

	@Override
	public int modifyResult(CafeDTO cafedto) {
		return cafemapper.modifyResultData(cafedto);
	}

	@Override
	public int deleteData(int cafeno) {
		return cafemapper.deleteData(cafeno);
	}

	@Override
	public int filedeleteData(int cafeno) {
		return cafemapper.filedeleteData(cafeno);
	}

	@Override
	public CafeFileDTO getcafefile(int cafeno) {
		return cafemapper.fileselectDate(cafeno);
	}

	@Override
	public List<CafeDTO> selectcafelist() {
		return cafemapper.selectcafeData();
	}

	@Override
	public CafeDTO cafedetailData(int cafeno) {
		return cafemapper.cafedetailData(cafeno);
	}

	@Override
	public CafeNutrtionDTO detailnutriData(int cafeno) {
		return cafemapper.detailnutriData(cafeno);
	}





}
	

