package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.GoodsDTO;

@Mapper
public interface GoodsMapper {

	void insert(GoodsDTO dto);

	List<GoodsDTO> list(HashMap<String, Object> hm);

	boolean delete(int p_no);

	GoodsDTO detail(int p_no);

	int modify(GoodsDTO dto);

	List<GoodsDTO> namelist();

	List<GoodsDTO> goodsnamedetail(String p_name);

	List<GoodsDTO> select_pno(String p_name);

	String find_pname(int p_no);
	
	int count_pno(String pname);

	int goodscount(HashMap<String, Object> hm);

	String checkAmount(String string);


}
