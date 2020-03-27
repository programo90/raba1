package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.HostDTO;
import com.bitcamp.dto.TourDTO;
import com.bitcamp.dto.TourMarkerDTO;
import com.bitcamp.dto.TourReplyDTO;

public interface TourService {

	
	public void insertTour(TourDTO dto);
	//public List<TourDTO> listTour();

	public List<TourDTO> tourList(int startRow, int pageSize);

	public int totalCount();

	public TourDTO tourDetail(int tourno);

	public List<TourMarkerDTO> markerList(int tourno);

	public HostDTO hostDetail(Integer hostno);

	public int applyTour(String userid, int tourno);

	public int deleteTour(int tourno);

	public int updateTour(TourDTO dto);

	public List<TourReplyDTO> replyList(int tourno);

	public List<TourReplyDTO> replyInsert(TourReplyDTO redto);

	public int updateState(int tourno, int tourstate);
}
