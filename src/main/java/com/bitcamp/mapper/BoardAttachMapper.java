package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.dto.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByPno(int pno);
	
	public void deleteAll(int pno);
	
}
