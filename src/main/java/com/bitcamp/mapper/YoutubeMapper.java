package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.YoutubeDTO;

@Mapper
public interface YoutubeMapper {

	List<YoutubeDTO> adminlistData();
	
	List<YoutubeDTO> listData();
	
	int insertData(YoutubeDTO dto);

	int deleteData(int youtubeno);

	int modifyData(YoutubeDTO dto);


}
