package com.bitcamp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.security.Login__MemberVO;

@Mapper
public interface MemberMapper {

	public Login__MemberVO read(String userid);
	public int insertData(Login__MemberVO vo);
	public int idCheck(Login__MemberVO vo);
	public int insertAuth(Login__MemberVO vo);
}
