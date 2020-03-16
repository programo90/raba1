package com.bitcamp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bitcamp.mapper.MemberMapper;

import lombok.Setter;


public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		System.out.println("Load User By UserName :" + username );
		
		Login__MemberVO vo = memberMapper.read(username);
		
		System.out.println("queried by member mapper : " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
