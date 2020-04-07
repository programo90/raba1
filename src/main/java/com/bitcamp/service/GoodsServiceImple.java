package com.bitcamp.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.ChangeDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.GoodsSizeDTO;
import com.bitcamp.mapper.BoardAttachMapper;
import com.bitcamp.mapper.GoodsMapper;

import lombok.extern.log4j.Log4j;

/*@Log4j*/
@Service
public class GoodsServiceImple implements GoodsService {

	@Autowired
	private BoardAttachMapper attach_mapper;
	
	@Autowired
	private GoodsMapper mapper;
	
	@Transactional
	@Override
	public void insertvalue(GoodsDTO dto, GoodsSizeDTO sizedto) {
		// TODO Auto-generated method stub
		
		/*log.info("register : "+ dto);*/
		
		
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
		
		
		/* 사진 등록 */
		if(dto.getAttachList() == null || dto.getAttachList().size() <= 0) {
			
			return;
			
		}
		
		 List<GoodsDTO> pno_dto = mapper.select_pno(dto.getP_name());
		
		 for(int i=0 ; i < dto.getAttachList().size(); i++) {
			 
			 dto.getAttachList().get(i).setPno(pno_dto.get(0).getP_no());
			 
			 attach_mapper.insert(dto.getAttachList().get(i));
			 
		 }
		
		/*dto.getAttachList().forEach(attach -> {
		
			attach.setPno(dto.getP_no());
			attach_mapper.insert(attach);
			
		});
		*/
	}

	/* goods list */
	@Override
	public List<GoodsDTO> goodslist() {
		// TODO Auto-generated method stub
		
		List<GoodsDTO> list = mapper.list();
		
		return list;
	}

	@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
	@Override
	public boolean deletegoods(int p_no) {
		// TODO Auto-generated method stub
		
		/*log.info("remove.....");*/
		
		String pname = mapper.find_pname(p_no);
		
		/* 등록된 제품의 사이즈에 따른 가짓수를 확인한다. */
		/* 2개 이상의 상품이 있다. */
		if(mapper.count_pno(pname) == 1) {
			
			/*log.info("물건 하나남았다!!!!");*/
			
			attach_mapper.deleteAll(p_no);
			
			mapper.delete(p_no);
			
			return true;
			
		
		}else{
		
			/*log.info("물건 여러개가 남았다!!!");*/
			
			/* 삭제하려는 pno가 사진 테이블의 pno와 같은지 여부  */
			if(attach_mapper.findByPno(p_no) != null) {
				
				List<GoodsDTO> pno_dto = mapper.select_pno(pname);
				
				int last_pno = pno_dto.get(0).getP_no();
				int new_pno = pno_dto.get(1).getP_no();
				
				ChangeDTO changedto = new ChangeDTO();
				
				changedto.setLast_pno(last_pno);
				changedto.setNew_pno(new_pno);
				
				/* 삭제하려는 pno가 goodsimagetable에 저장된 pno라면 남아있는 다른 pno로 업데이트 한다. */
				attach_mapper.updatePno(changedto);
				
			} // 삭제하려는 pno가 goodsimagetable에 등록되어 있는 pno이기 때문에 pno업데이트가 필요하다.
			
			mapper.delete(p_no);
			
			return false;
		}
	
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

	
	
	@Override
	public List<BoardAttachVO> getAttachList(int pno) {
		// TODO Auto-generated method stub
		
		/*log.info("get Attach list by pno " +pno);*/
		
		return attach_mapper.findByPno(pno);
	}

	@Override
	public BoardAttachVO getimg(int p_no) {
		// TODO Auto-generated method stub
		
		return attach_mapper.pno_image(p_no);
	}

	@Override
	public BoardAttachVO getImgpno(String p_name) {
		// TODO Auto-generated method stub
		
		List<GoodsDTO> list =  mapper.select_pno(p_name);
		
		int p_no = list.get(0).getP_no();
		
		return attach_mapper.pno_image(p_no);
	}

	
}
