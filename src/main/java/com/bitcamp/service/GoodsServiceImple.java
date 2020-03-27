package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.GoodsSizeDTO;
import com.bitcamp.mapper.GoodsMapper;

@Service
public class GoodsServiceImple implements GoodsService {

	@Autowired
	private GoodsMapper mapper;
	
	@Override
	public int insertvalue(GoodsDTO dto, GoodsSizeDTO sizedto) {
		// TODO Auto-generated method stub
		
		if(sizedto.getFree() != null) {
			
			dto.setP_size(sizedto.getFree());
			dto.setP_amount(sizedto.getF_no());
			
			mapper.insert(dto);
			
		}
		
		if(sizedto.getSmall() != null){
			
			dto.setP_size(sizedto.getSmall());
			dto.setP_amount(sizedto.getS_no());
			
			mapper.insert(dto);
			
		}
		
		if(sizedto.getMedium() != null){
			
			dto.setP_size(sizedto.getMedium());
			dto.setP_amount(sizedto.getM_no());
			
			mapper.insert(dto);
			
		}
		
		if(sizedto.getLarge() != null){
			
			dto.setP_size(sizedto.getLarge());
			dto.setP_amount(sizedto.getL_no());
			
			mapper.insert(dto);
			
		}
		
		if(sizedto.getXlarge() != null){
			
			dto.setP_size(sizedto.getXlarge());
			dto.setP_amount(sizedto.getXl_no());
			
			mapper.insert(dto);
			
		}
		
		return 0;
	}

	/* goods list */
	@Override
	public List<GoodsDTO> goodslist() {
		// TODO Auto-generated method stub
		
		List<GoodsDTO> list = mapper.list();
		
		return list;
	}

	@Override
	public int deletegoods(int p_no) {
		// TODO Auto-generated method stub
		
		mapper.delete(p_no);
		
		return 0;
	}

	@Override
	public GoodsDTO detailgoods(int p_no) {
		// TODO Auto-generated method stub
		
		GoodsDTO dto = mapper.detail(p_no);
		
		return dto;
	}

	@Override
	public int modifygoods(GoodsDTO dto,GoodsSizeDTO sizedto) {
		// TODO Auto-generated method stub
		
		if(sizedto.getFree() != null) {
			
			dto.setP_size(sizedto.getFree());
			dto.setP_amount(sizedto.getF_no());
			
			mapper.modify(dto);
			
		}
		
		if(sizedto.getSmall() != null){
			
			dto.setP_size(sizedto.getSmall());
			dto.setP_amount(sizedto.getS_no());
			
			mapper.modify(dto);
			
		}
		
		if(sizedto.getMedium() != null){
			
			dto.setP_size(sizedto.getMedium());
			dto.setP_amount(sizedto.getM_no());
			
			mapper.modify(dto);
			
		}
		
		if(sizedto.getLarge() != null){
			
			dto.setP_size(sizedto.getLarge());
			dto.setP_amount(sizedto.getL_no());
			
			mapper.modify(dto);
			
		}
		
		if(sizedto.getXlarge() != null){
			
			dto.setP_size(sizedto.getXlarge());
			dto.setP_amount(sizedto.getXl_no());
			
			mapper.modify(dto);
			
		}
		
		return 0;
	}

	
	/* 사용자단  goods list */
	@Override
	public List<GoodsDTO> goodsnamelist() {
		// TODO Auto-generated method stub
			
		List<GoodsDTO> list = mapper.namelist();
		
		return list;
	}

	@Override
	public List<GoodsDTO> goodsnamedetail(String p_name) {
		// TODO Auto-generated method stub
		
		List<GoodsDTO> list = mapper.goodsnamedetail(p_name);
		
		return list;
	}

	
}
