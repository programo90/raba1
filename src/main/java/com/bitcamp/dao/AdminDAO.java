package com.bitcamp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.AdminMemberDTO;


@Mapper
public interface AdminDAO {

	int adminmembergetCount(HashMap<String, Object> hm);

	List<AdminMemberDTO> adminmemberlist(HashMap<String, Object> hm);
	
}
