package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.HostDTO;
import com.bitcamp.dto.TourApplyDTO;
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

	public List<TourDTO> tourUserList(String userid);

	public int cancelApplyTour(String userid, int tourno);

	public HostDTO hostDetailById(String userid);

	public List<TourDTO> tourHostList(Integer hostno);

	public List<TourApplyDTO> tourApplyList(int tourno);

	public TourDTO tourFavDetail(int tourno);

	public List<TourReplyDTO> deleteTourRe(int tourno, int tourreno);

	public List<TourReplyDTO> updateTourRe(int tourno, int tourreno, String recontent);

	public List<TourReplyDTO> listTourRe(int tourno);

	public List<TourDTO> tourHostListSelected(int hostno, int tourstate);

	public List<TourDTO> tourUserSearchList(String userid, String searchtxt, int tourstate);
}
