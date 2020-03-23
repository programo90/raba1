package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.YoutubeDTO;

public interface YoutubeService {

	List<YoutubeDTO> selectAdminList();
	
	List<YoutubeDTO> selectList();

	int youtubeInsert(YoutubeDTO dto);

	int youtubedelete(int youtubeno);

	int youtubemodify(YoutubeDTO dto);

	

}
