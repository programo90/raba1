package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.NoticeDTO;
import com.bitcamp.mapper.NoticeMapper;

@Service
public class NoticeServiceImple implements NoticeService {

	@Autowired
	private NoticeMapper noticemapper;
	
	@Override
	public List<NoticeDTO> getlist() {
		// TODO Auto-generated method stub
		List<NoticeDTO> list =  noticemapper.getlist();
		return list;
	}

	@Override
	public int ins_ntc(NoticeDTO dto) {
		// TODO Auto-generated method stub
		
		int result = noticemapper.ins_ntc(dto);
		
		return result;
	}

	@Override
	public NoticeDTO detail(Integer ntcno) {
		// TODO Auto-generated method stub
		NoticeDTO dto = noticemapper.detail(ntcno);
		
		return dto;
	}

	@Override
	public int update_ntc(NoticeDTO dto) {
		// TODO Auto-generated method stub
		
		int result = noticemapper.update_ntc(dto);
		
		return result;
	}

	@Override
	public int delete_ntc(int ntcno) {
		// TODO Auto-generated method stub
		
		int result = noticemapper.delete_ntc(ntcno);
		
		return result;
	}

}
