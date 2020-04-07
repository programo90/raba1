package com.bitcamp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.mapper.BoardAttachMapper;
import com.bitcamp.mapper.CartMapper;
import com.bitcamp.mapper.GoodsMapper;

@Service
public class CartServiceImple implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Autowired
	private GoodsMapper goods_mapper;
	
	@Autowired
	private BoardAttachMapper img_mapper;
	

	@Override
	public int insert(CartDTO dto) {
		// TODO Auto-generated method stub
		
		int result = mapper.insert(dto);
		
		return 0;
	}

	@Override
	public List<GoodsDTO> list(String usercode) {
		// TODO Auto-generated method stub
		
		List<GoodsDTO> list = mapper.list(usercode);
		
		return list;
	}

	@Override
	public List<CartDTO> cnolist(String usercode) {
		// TODO Auto-generated method stub
		
		List<CartDTO> cnolist = mapper.cnolist(usercode);
		
		return cnolist;
	}

	@Override
	public String getName(int p_no) {
		// TODO Auto-generated method stub
		
		return goods_mapper.find_pname(p_no);
	}

	@Override
	public void deleteAll(String userid) {
		// TODO Auto-generated method stub
		
		mapper.deleteAll(userid);
		
	}

	@Override
	public void deleteCno(String[] arr) {
		// TODO Auto-generated method stub
		
		for(int i =0; i < arr.length; i++) {
			
			String cno = arr[i];
			
			mapper.deleteCno(cno);
		}
		
	}

	@Override
	public List<BoardAttachVO> getImage(String usercode) {
		// TODO Auto-generated method stub
		
		List<GoodsDTO> list =  mapper.list(usercode);
		
		System.out.println("cnolist!!!!!!!!!!!!!!!!!!!!!!!" +list);
		
		System.out.println(list.size());
		
		List<BoardAttachVO> imglist = new ArrayList<BoardAttachVO>();
		
		for(int i = 0; i < list.size(); i++) {
			
			int getpno = list.get(i).getP_no();
			
			System.out.println("getpno" + getpno);
			
			String pname = goods_mapper.find_pname(getpno);
			
			System.out.println("pname" +pname);
			
			List<GoodsDTO> goodsdto = goods_mapper.select_pno(pname);
			
			int p_no = goodsdto.get(0).getP_no();
			
			System.out.println("PNO"+p_no);
			
			// 단일 이미지 출력 
			BoardAttachVO img = img_mapper.pno_image(p_no);
			
			System.out.println(img.getFileName());
			
			imglist.add(img);
			
		}
		
		return imglist;
	}
}
