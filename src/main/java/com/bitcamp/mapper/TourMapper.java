package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.HostDTO;
import com.bitcamp.dto.TourApplyDTO;
import com.bitcamp.dto.TourDTO;
import com.bitcamp.dto.TourMarkerDTO;
import com.bitcamp.dto.TourReplyDTO;

@Mapper
public interface TourMapper {
	
	//tour 입력, 마커입력
	public int insertTour(TourDTO dto);
	public int insertMarker(TourMarkerDTO dto);
	
	
	//tour 리스트 불러오기
	public int getTotalRow();
	
	
	//tour 상세 불러오기
	public TourDTO tourDetail(int tourno);
	public List<TourDTO> tourList(HashMap<String, Object> map);
	public List<TourMarkerDTO> markerList(int tourno);
	public HostDTO hostDetail(int hostno);
	public TourApplyDTO tourApplySelect(HashMap<String, Object> map);
	public int insertApplyTour(HashMap<String, Object> map);
	public int increApplyCount(int tourno);
	public int updateTour(TourDTO dto);
	public int deleteMarker(int tourno);
	public int deleteTour(int tourno);
	public List<TourReplyDTO> replyList(int tourno);
	public int replyInsert(TourReplyDTO redto);
	public int rereplyInsert(TourReplyDTO redto);
	public int updateState(HashMap<String, Object> map);
	public int increUserDistance(HashMap<String, Object> map);
	public HostDTO hostDetailById(String userid);
	public List<TourDTO> tourUserList(String userid);
	public int decreaCancount(int tourno);
	public int cancelApplyTour(HashMap<String, Object> map);
	public List<TourDTO> tourHostList(Integer hostno);
	public int increaLeadCount(Integer hostno);
	public int decreaLeadCount(Integer hostno);
	public List<TourApplyDTO> tourApplyList(int tourno);
	public int insertFavTour(TourDTO dto);
	public TourDTO tourFavDetail(int tourno);
	public int deleteTourRe(int tourreno);
	public int updateTourRe(HashMap<String, Object> map);
	public int updateFavTour(TourDTO dto);
	public List<TourDTO> tourHostListSelected(int hostno, int tourstate);
	public List<TourDTO> tourHostListSelected(HashMap<String, Object> map);
	public List<TourDTO> tourUserSearchList(HashMap<String, Object> map);
	
	
	
}
