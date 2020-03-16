package com.bitcamp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.security.Login__MemberVO;

@Mapper
public interface MemberMapper {
	public Login__MemberVO read(String userid);
}
