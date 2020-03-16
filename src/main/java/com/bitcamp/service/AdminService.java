package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.AdminMemberDTO;


public interface AdminService {

	int totalCount(String search, String searchtxt);

	List<AdminMemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow);

}
