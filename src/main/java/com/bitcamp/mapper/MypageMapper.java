package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.security.Login__MemberVO;

@Mapper
public interface MypageMapper {

	String findUsername(String userid);

	List<GoodsDTO> wishlist(String userid);

	Login__MemberVO userinfo(String userid);

	int updateInfo(Login__MemberVO vo);
	
	List<OrderDTO> order_list(String userid);
	
	List<GoodsDTO> goods_info(String pno);
	
	GoodsDTO goods_info2(String pno);

	List<OrderDTO> detailorderlist(int orderno);

	OrderDTO order__detail(int orderno);

	void updateCashReceipts(order__listDTO dto);

	void updateShipInfo(order__listDTO dto);

	List<OrderDTO> getordernolist(String userid);

	void updateHostMsg(HashMap<String, Object> map);
	
}
