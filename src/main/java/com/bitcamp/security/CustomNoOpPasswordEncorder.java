//package com.bitcamp.security;
//
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//public class CustomNoOpPasswordEncorder implements PasswordEncoder {
//
//	@Override
//	public String encode(CharSequence rawPassword) {
//		System.out.println("before encode : " + rawPassword);
//		return rawPassword.toString();
//	}
//
//	@Override
//	public boolean matches(CharSequence rawPassword, String encodedPassword) {
//		System.out.println("matches : "+ rawPassword + "endcodePassword");
//		return rawPassword.toString().equals(encodedPassword);
//	}
//
//}
