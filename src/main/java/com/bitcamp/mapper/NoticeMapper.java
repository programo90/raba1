package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {

	List<NoticeDTO> getlist();

	int ins_ntc(NoticeDTO dto);

	NoticeDTO detail(Integer ntcno);

	int update_ntc(NoticeDTO dto);

	int delete_ntc(int ntcno);

}
