package com.bitcamp.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.dto.AdminMemberDTO;
import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.CartListDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.OrderDTO;
import com.bitcamp.mapper.BoardAttachMapper;
import com.bitcamp.mapper.CartMapper;
import com.bitcamp.mapper.GoodsMapper;
import com.bitcamp.mapper.PayMapper;

import lombok.extern.log4j.Log4j;
import sun.java2d.windows.GDIWindowSurfaceData;

@Service("payservice")
public class PayServiceImple implements PayService{

	@Inject
	private PayMapper paymapper;
	
	@Autowired
	private CartMapper cartmapper;
	
	@Autowired
	private GoodsMapper goodsmapper;
	
	@Autowired
	private BoardAttachMapper attachmapper;


	@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
	@Override
	public int orderinsert(OrderDTO orderdto) {

		String[] orderpnolist = orderdto.getOrdercpnolist();
		String[] ordercpricelist = orderdto.getOrdercpricelist();
		String[] ordercamountlist = orderdto.getOrdercamountlist();
		
		StringBuilder orderpno = new StringBuilder("");
		StringBuilder ordercprice = new StringBuilder("");
		StringBuilder ordercamount = new StringBuilder("");
		
		for(int i=0; i<orderpnolist.length; i++) {
			orderpno.append(orderpnolist[i]);
			ordercprice.append(ordercpricelist[i]);
			ordercamount.append(ordercamountlist[i]);
			if(i!=(orderpnolist.length-1)) {
				orderpno.append(",");
				ordercprice.append(",");
				ordercamount.append(",");
			}
		}
		orderdto.setOrdercpno(orderpno.toString());
		orderdto.setOrdercprice(ordercprice.toString());
		orderdto.setOrdercamount(ordercamount.toString());
		for(int i=0; i<orderpnolist.length; i++) {
			GoodsDTO dto = new GoodsDTO();
			dto.setP_amount(Integer.parseInt(ordercamountlist[i]));
			dto.setP_no(Integer.parseInt(orderpnolist[i]));
			paymapper.decreaamount(dto);
		}
		
		return paymapper.orderinsert(orderdto);
	}


	@Override
	public AdminMemberDTO user(String userid) {
		// TODO Auto-generated method stub
		return paymapper.userdate(userid);
	}
	
	@Override
	public List<GoodsDTO> goodsdate(Integer[] cno) {
		List<GoodsDTO> goods = new ArrayList<>();
		for(int i = 0; i < cno.length; i++)
		{
			
			int su = cno[i];
			
			GoodsDTO dto = paymapper.pno(su);

			goods.add(dto);
		}
		return goods;
	}

	@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
	@Override
	public int insertOrder(OrderDTO Data) {		
/*		for(int i=0; i<Data.getOrdercpnolist().length; i++) {
			GoodsDTO dto = new GoodsDTO();
			dto.setP_amount(Integer.parseInt(Data.getOrdercamountlist()[i]));
			dto.setP_no(Integer.parseInt(Data.getOrdercpnolist()[i]));
			paymapper.decreaamount(dto);
		}*/
/*		GoodsDTO dto = new GoodsDTO();
		for(int i=0; i<Data.getOrdercpnolist().length; i++) {
		dto.setP_amount(Integer.parseInt(Data.getOrdercamountlist()[i]));
		dto.setP_no(Integer.parseInt(Data.getOrdercpnolist()[i]));
		paymapper.decreaamount(dto);
	}*/
		
		return paymapper.orderinsert2(Data);
	}


	@Override
	public List<BoardAttachVO> selectimg(Integer[] cno) {
		
		List<BoardAttachVO> vo= new ArrayList<>();
		
		for(int i=0; i<cno.length;i++)
		{
			
			int  su= cartmapper.getpno(cno[i]);
			
			String pname =  goodsmapper.find_pname(su);
			
			List<GoodsDTO> dto = goodsmapper.select_pno(pname);
			
			int pno = dto.get(0).getP_no();
			
			vo.add(attachmapper.pno_image(pno));
			
		}
		
		return vo;
	}

}