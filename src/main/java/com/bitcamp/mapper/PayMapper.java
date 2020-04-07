package com.bitcamp.mapper;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;

public interface PayMapper {

	int orderinsert(OrderDTO orderdto);

	GoodsDTO pno(int su);

	AdminMemberDTO userdate(String userid);

	int orderinsert2(OrderDTO Data);

	void decreaamount(String str);

	void decreaamount(GoodsDTO dto);

	
}
