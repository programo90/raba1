package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CalendarDTO;
import com.bitcamp.dto.RepairDTO;

@Mapper
public interface RepairMapper {

	int calinsertData(CalendarDTO dto);

	List<CalendarDTO> calselectData();

	int calmodifyData(CalendarDTO dto);

	int caldelete(int calno);

	int reinsertData(RepairDTO redto);

	List<RepairDTO> replyselectData();
	
	int rereinsertData(RepairDTO redto);




}
