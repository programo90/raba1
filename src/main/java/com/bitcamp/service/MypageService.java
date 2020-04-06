package com.bitcamp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.security.Login__MemberVO;

@Mapper
public interface MypageService {
	List<GoodsDTO> wishlist(String userid);
	Login__MemberVO userinfo(String userid);
	int updateInfo(Login__MemberVO vo);
	List<order__listDTO> orderlist(String userid);
//	List<GoodsDTO> goods_info(int pno); mapper는 그대로 사용하고 orderlist 메소드에서 둘다 사용합니다.
	List<order__listDTO> detail_orderlist(int orderno);
	OrderDTO orderdetail(int orderno);
	void updateCashReceipts(order__listDTO dto);
}
