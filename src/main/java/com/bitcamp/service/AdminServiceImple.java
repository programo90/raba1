package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitcamp.dao.AdminDAO;
import com.bitcamp.dto.AdminMemberDTO;

@Service("adminservice")
public class AdminServiceImple implements AdminService{

	@Inject
	private AdminDAO mapper;

	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> hm= new HashMap<>();
		
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		
		return mapper.adminmembergetCount(hm);
	}

	@Override
	public List<AdminMemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> hm =new HashMap<>();
		
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		System.out.println(search);
		System.out.println(searchtxt);
		System.out.println(endRow);
		System.out.println(startRow);
		return mapper.adminmemberlist(hm);
	}
}
