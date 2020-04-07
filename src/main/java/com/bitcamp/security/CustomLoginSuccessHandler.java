package com.bitcamp.security;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private RequestCache requestcache = new HttpSessionRequestCache();
	private RedirectStrategy redirecrStratgy = new DefaultRedirectStrategy();
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("Login Success!");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		System.out.println("ROLE NAMES:" + roleNames);

		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin");
			return;
		}
		
//		if(roleNames.contains("ROLE_HOST")) {
//			response.sendRedirect("/login/host");
//			return;
//		}
//		
//		if(roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/login/member");
//			return;
//		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/");
			return;
		}
//		resultRedirectStrategy(request, response, authentication);
		response.sendRedirect("/");
	}
//	아래 코드는 현재페이지 로그인 성공 시, 현재페이지(로그인 이전 페이지)로 이동을 구현하기위해서 작성중입니다.
//	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//		SavedRequest savedRequest = requestcache.getRequest(request, response);
//		
//		if(savedRequest != null) {
//			String targetUrl = savedRequest.getRedirectUrl();
//			redirecrStratgy.sendRedirect(request, response, targetUrl);
//		}else {
//			resultRedirectStrategy(request, response, authentication);
//		}
//	}

}
