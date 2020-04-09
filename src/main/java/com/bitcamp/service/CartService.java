/**
 * 
 */
package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.GoodsDTO;

/**
 * @author fkavm
 *
 */
public interface CartService {

	int insert(CartDTO dto);

	List<GoodsDTO> list(String usercode);

	List<CartDTO> cnolist(String usercode);

	String getName(int p_no);

	void deleteAll(String userid);

	void deleteCno(String[] arr);

	List<BoardAttachVO> getImage(String usercode);

	Integer[] checkAmount(String[] arr);

}
