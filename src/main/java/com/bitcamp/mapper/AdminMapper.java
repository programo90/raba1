package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.security.Login__MemberVO;


@Mapper
public interface AdminMapper {

	int adminmembergetCount(HashMap<String, Object> hm);

	List<AdminMemberDTO> adminmemberlist(HashMap<String, Object> hm);

	int adminordergetCount(HashMap<String, Object> hm);

	List<OrderDTO> adminorderlist(HashMap<String, Object> hm);

	int adminorderdel(int oderno);

	int adminorderup(OrderDTO dto);

	Login__MemberVO userinfo(String userid);

	GoodsDTO goods_info2(String pno);

	List<OrderDTO> detailorderlist(int orderno);

	OrderDTO order__detail(int orderno);
	
}
