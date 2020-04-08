package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.dto.order__listDTO;
import com.bitcamp.security.Login__MemberVO;


public interface AdminService {

	int totalCount(String search, String searchtxt);

	List<AdminMemberDTO> adminmemberlist(String search, String searchtxt, int startRow, int endRow);

	int ordertotalCount(String search, String searchtxt);

	List<OrderDTO> adminorderlist(String search, String searchtxt, int startRow, int endRow);

	int adminorderdelData(int oderno);

	int adminorder(OrderDTO dto);

	OrderDTO orderdetail(int orderno);

	List<order__listDTO> detail_orderlist(int orderno);

	Login__MemberVO userinfo(String userid);

	void changeauth(AdminMemberDTO dto);

}
