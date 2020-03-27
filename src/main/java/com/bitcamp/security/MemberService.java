package com.bitcamp.security;

public interface MemberService {

	int signup(Login__MemberVO vo);
	int idCheck(Login__MemberVO vo);
}
