/**
 * 
 */
package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.NoticeDTO;

/**
 * @author fkavm
 *
 */
public interface NoticeService {

	List<NoticeDTO> getlist();

	int ins_ntc(NoticeDTO dto);

	NoticeDTO detail(Integer ntcno);

	int update_ntc(NoticeDTO dto);

	int delete_ntc(int ntcno);

}
