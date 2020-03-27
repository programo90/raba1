package com.bitcamp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.MemberMapper;

@Service(value = "memberServiceImple")
public class MemberServiceImple implements MemberService {
	
	@Autowired
	MemberMapper membermapper;
	
//	@Resource(name="passwordEncoder")
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Override
	public int signup(Login__MemberVO vo) {
		String changepwd= encoder.encode((String)vo.getPassword());
	    vo.setPassword(changepwd);
	    membermapper.insertData(vo);		
	    return membermapper.insertAuth(vo);
	}
	
	public int idCheck(Login__MemberVO vo) {
		return membermapper.idCheck(vo);		
	}
}
