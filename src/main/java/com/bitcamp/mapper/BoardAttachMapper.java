package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.ChangeDTO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByPno(int pno);
	
	public void deleteAll(int p_no);

	public void updatePno(ChangeDTO changedto);

	public BoardAttachVO pno_image(int p_no);
	
}
