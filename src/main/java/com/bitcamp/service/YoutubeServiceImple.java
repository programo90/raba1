package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.YoutubeDTO;
import com.bitcamp.mapper.YoutubeMapper;

@Service(value="YoutubeService")
public class YoutubeServiceImple implements YoutubeService{

	@Autowired
	private YoutubeMapper yotubemapper;
	
	@Override
	public List<YoutubeDTO> selectAdminList() {
		return yotubemapper.adminlistData();
	}
	@Override
	public List<YoutubeDTO> selectList() {
		return yotubemapper.listData();
	}
	@Override
	public int youtubeInsert(YoutubeDTO dto) {
		return yotubemapper.insertData(dto);
	}
	@Override
	public int youtubedelete(int youtubeno) {
		return yotubemapper.deleteData(youtubeno);
	}
	@Override
	public int youtubemodify(YoutubeDTO dto) {
		return yotubemapper.modifyData(dto);
	}

	

	
}
