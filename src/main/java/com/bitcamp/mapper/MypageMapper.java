package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.security.Login__MemberVO;

public interface MypageMapper {

	String findUsername(String userid);

	List<GoodsDTO> wishlist(String userid);

	Login__MemberVO userinfo(String userid);

	int updateInfo(Login__MemberVO vo);
	
	List<OrderDTO> order_list(String userid);
	
	List<GoodsDTO> goods_info(String pno);
	
}
