/**
 * 
 */
package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.CartDTO;

/**
 * @author fkavm
 *
 */
public interface CartService {

	int insert(CartDTO dto);

	List<CartDTO> list(int usercode);

}
