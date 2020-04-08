package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.CartListDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;


public interface PayService {

	AdminMemberDTO user(String userid);

	int orderinsert(OrderDTO orderdto);

	List<GoodsDTO> goodsdate(Integer[] cno);

	int insertOrder(OrderDTO Data);

	List<BoardAttachVO> selectimg(Integer[] cno);	
}