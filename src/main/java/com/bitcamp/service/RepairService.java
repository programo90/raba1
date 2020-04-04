package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.CalendarDTO;
import com.bitcamp.dto.RepairDTO;

public interface RepairService {

	int calinsert(CalendarDTO dto);

	List<CalendarDTO> calselectList();

	int calmodify(CalendarDTO dto);

	int caldelete(int calno);
	
	List<RepairDTO> replyselectList();

	List<RepairDTO> reservationinsert(RepairDTO redto);

	


}
