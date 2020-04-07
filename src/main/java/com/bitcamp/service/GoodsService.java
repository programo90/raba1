package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.GoodsSizeDTO;

public interface GoodsService {

	void insertvalue(GoodsDTO dto, GoodsSizeDTO sizedto);

	List<GoodsDTO> goodslist(String search, String searchtxt, int startRow, int endRow);

	boolean deletegoods(int p_no);

	GoodsDTO detailgoods(int p_no);

	int modifygoods(GoodsDTO dto,GoodsSizeDTO sizedto);

	List<GoodsDTO> goodsnamelist();

	List<GoodsDTO> goodsnamedetail(String p_name);
	
	List<BoardAttachVO> getAttachList(int pno);

	BoardAttachVO getimg(int p_no);

	BoardAttachVO getImgpno(String p_name);

	int goodstotalCount(String search, String searchtxt);

	

}
