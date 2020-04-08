package com.bitcamp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.AdminMemberDTO;

@Mapper
public interface AuthoritiesMapper {

	void delete(AdminMemberDTO dto);

	void insert1(AdminMemberDTO dto);

	void insert2(AdminMemberDTO dto);

	void insert3(AdminMemberDTO dto);

	String[] getauth(String userid);

	
}
