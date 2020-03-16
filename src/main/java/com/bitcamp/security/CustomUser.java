package com.bitcamp.security;

import com.bitcamp.security.Login__MemberVO;

import lombok.Getter;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

@Getter
public class CustomUser extends User {
	private static final long serialVersionUID = 1L;
	
	private Login__MemberVO member;

	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
		
		
	}
	

	public CustomUser(Login__MemberVO vo) {
		
		super(vo.getUserid(), vo.getPassword(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.member = vo;
	}
	
	
	
}
