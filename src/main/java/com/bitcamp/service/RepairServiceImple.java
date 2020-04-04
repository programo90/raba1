package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CalendarDTO;
import com.bitcamp.dto.RepairDTO;
import com.bitcamp.mapper.RepairMapper;

@Service(value="RepairService")
public class RepairServiceImple implements RepairService{

	@Autowired
	private RepairMapper reapirmapper;

	@Override
	public int calinsert(CalendarDTO dto) {
		return reapirmapper.calinsertData(dto);
	}

	@Override
	public List<CalendarDTO> calselectList() {
		return reapirmapper.calselectData();
	}

	@Override
	public int calmodify(CalendarDTO dto) {
		return reapirmapper.calmodifyData(dto);
	}

	@Override
	public int caldelete(int calno) {
		return reapirmapper.caldelete(calno);
	}
	@Override
	public List<RepairDTO> replyselectList() {
		return reapirmapper.replyselectData();
	}
	//예약 댓글  / 대댓글
	@Override
	public List<RepairDTO> reservationinsert(RepairDTO redto) {
		if(redto.getReservorder()<0) {
			reapirmapper.reinsertData(redto);
		}else {
			reapirmapper.rereinsertData(redto);
		}
		return reapirmapper.replyselectData();
	}


	
}
