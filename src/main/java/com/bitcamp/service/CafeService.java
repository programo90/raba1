package com.bitcamp.service;

import javax.servlet.http.HttpServletRequest;

import com.bitcamp.dto.CafeDTO;

public interface CafeService {

	void cafeinsert(HttpServletRequest request, CafeDTO dto);

}
