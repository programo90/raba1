package com.bitcamp.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.dto.HostDTO;
import com.bitcamp.dto.TourApplyDTO;
import com.bitcamp.dto.TourDTO;
import com.bitcamp.dto.TourMarkerDTO;
import com.bitcamp.dto.TourReplyDTO;
import com.bitcamp.mapper.TourMapper;

@Service(value="tourService")
public class TourServiceImple implements TourService{

	@Autowired
	private TourMapper tourMapper;
	
	@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
	@Override
	public void insertTour(TourDTO dto) {
		//프로시져로 먼저 투어정보를 db에 저장하고, 투어 정보를 외래키로 갖는 marker정보를 db에 저장한다.
		//실패시 롤백
		System.out.println("userid : " + dto.getUserid());
		
		HostDTO hostdto = tourMapper.hostDetailById(dto.getUserid());
		System.out.println(hostdto.getHostno());
		
		dto.setHostno(hostdto.getHostno());
		
		//투어 정보를 가지고 db에 저장.
		String[] tourLatList = dto.getTourlatlist();
		String[] tourLngList = dto.getTourlnglist();

		//2. StringBuilder 사용
		StringBuilder tourlat = new StringBuilder("");
		StringBuilder tourlng = new StringBuilder("");
		for(int i=0; i<tourLatList.length; i++) {
			tourlat.append(tourLatList[i]);
			tourlng.append(tourLngList[i]);
			if(i!=(tourLatList.length-1)) {
				tourlat.append(",");
				tourlng.append(",");
			}
		}
		
		dto.setTourlat(tourlat.toString());
		dto.setTourlng(tourlng.toString());
		dto.setTourday(dto.getTourdate().substring(0, 10));
		dto.setTourtime(dto.getTourdate().substring(11));
		
		tourMapper.insertTour(dto);
		int tourno = dto.getTourno();
		
		/******************             이상 투어 저장                               ********************/
		/******************             이하 마커 저장                               ********************/
		
		//투어를 입력하고 결과 발생하는 tourno를 dto에 selectkey로  투어 번호를 받아온다.
		//해당 투어 번호를 아래 마커정보에 넣어준다.
		//https://yookeun.github.io/java/2014/07/11/mybatis-selectkey/
		//입력받은 marker 정보로 marker를 반복 생성해 저장.
		String[] spotTitleList = dto.getSpotListTitle();
		String[] spotConlist = dto.getSpotListCon();
		String[] spotLatList = dto.getSpotListLat();
		String[] spotLngList = dto.getSpotListLng();
		Integer[] spotnoList = dto.getSpotListNo();
		
		int totalMarkerCount = 0;
		for(int i=0; i<spotLatList.length; i++) {
			TourMarkerDTO mdto = new TourMarkerDTO();
			mdto.setTourno(tourno);
			mdto.setSpottitle(spotTitleList[i]);
			mdto.setSpotcontent(spotConlist[i]);
			mdto.setSpotlat(spotLatList[i]);
			mdto.setSpotlng(spotLngList[i]);
			
			//mapper를 통해서 db에 마커 갯수만큼 mdto 저장 반복			
			totalMarkerCount += tourMapper.insertMarker(mdto);
		}
		
		//투어 이미지 자동으로 선택
		//자주사용하는 경로 선택시에는, 자동으로 해당 이미지 지정해서 리턴 (DB에는 파일명 넣지 않는다.)
				
		//투어 타입에 따라 tourlist.jsp에서 표현해줄 마우스오버 효과 지정
				
		
	}

	@Override
	public List<TourDTO> tourList(int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		
		return tourMapper.tourList(map);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		
		return tourMapper.getTotalRow();
	}

	@Override
	public TourDTO tourDetail(int tourno) {
		// TODO Auto-generated method stub
		TourDTO dto = tourMapper.tourDetail(tourno);
		
		String lat = dto.getTourlat();
		String lng = dto.getTourlng();
	
		StringTokenizer stLat = new StringTokenizer(lat,",");
		String[] latList = new String[stLat.countTokens()];
		StringTokenizer stLng = new StringTokenizer(lng,",");
		String[] lngList = new String[stLng.countTokens()];
		for(int i=0; i<latList.length; i++) {
			latList[i] = stLat.nextToken();
			lngList[i] = stLng.nextToken();
		}
		
		dto.setTourlatlist(latList);
		dto.setTourlnglist(lngList);
		
		return dto;
	}

	@Override
	public List<TourMarkerDTO> markerList(int tourno) {
		// TODO Auto-generated method stub
		return tourMapper.markerList(tourno);
	}

	@Override
	public HostDTO hostDetail(Integer hostno) {
		// TODO Auto-generated method stub
		return tourMapper.hostDetail((int)hostno);
	}

	@Override
	public int applyTour(String userid, int tourno) {
		// TODO Auto-generated method stub
		//0. 지원완료
		//1. 이미 지원
		//2. 지원수 초과
		//3. 모집종료상태
		
		TourDTO dto = tourMapper.tourDetail(tourno);
		int result;
		if(dto.getTourstate()==1) {
			//지원수 초과
			result = 2;
		} else if(dto.getTourstate()==2) {
			//모집종료 상태
			result = 3;
		} else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("tourno", tourno);
			map.put("userid", userid);
			map.put("distance", dto.getDistance());
			TourApplyDTO adto = tourMapper.tourApplySelect(map);
			
			if(adto!=null) {
				//중복 지원
				result = 1;
			} else {
				tourMapper.insertApplyTour(map);
				tourMapper.increApplyCount(tourno);
				tourMapper.increUserDistance(map);
				
				//투어 지원 성공시 모집 최대인원과 지원 인원이 같아지면
				//trigger로 tourstate를 1(마감) 상태로 바꿔준다.
				//반대로 지원 취소시 다시 0(모집중) 상태로 바꿔준다.
				
				//지원 성공
				result = 0;
				
			}
		}
		
		
		return result;
	}

	
	@Override
	public int deleteTour(int tourno) {
		// TODO Auto-generated method stub
		
		//spot과 applylist는 cascade로 자동 삭제된다.
		/*tourMapper.deleteApplyList(tourno);
		tourMapper.deleteMarker(tourno);*/
		
		return tourMapper.deleteTour(tourno);
	}

	@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
	@Override
	public int updateTour(TourDTO dto) {
		// TODO Auto-generated method stub
		//투어 정보를 가지고 db에 저장.
				String[] tourLatList = dto.getTourlatlist();
				String[] tourLngList = dto.getTourlnglist();
			
				//1. Arrays.toString 사용
				//primitive type의 경우 Arrays.toString() 대신 Array.deepToString() 을 사용
				//Arrays.toString(tourLatList);	//[lat1, lat2, lat3, ... ]
				//Arrays.toString(tourLngList);	//[lng1, lng2, lng3, ... ]
				
				
				//2. StringBuilder 사용
				StringBuilder tourlat = new StringBuilder("");
				StringBuilder tourlng = new StringBuilder("");
				for(int i=0; i<tourLatList.length; i++) {
					tourlat.append(tourLatList[i]);
					tourlng.append(tourLngList[i]);
					if(i!=(tourLatList.length-1)) {
						tourlat.append(",");
						tourlng.append(",");
					}
				}
				
				dto.setTourlat(tourlat.toString());
				dto.setTourlng(tourlng.toString());
				dto.setTourday(dto.getTourdate().substring(0, 10));
				dto.setTourtime(dto.getTourdate().substring(11));
				
				int result = tourMapper.updateTour(dto);
				int tourno = dto.getTourno();
				
				/******************             이상 투어 저장                               ********************/
				/******************             이하 마커 저장                               ********************/
				//해당 투어에 속하던 모든 마커를 삭제하고 다시 생성한다.
				tourMapper.deleteMarker(tourno);
				
				String[] spotTitleList = dto.getSpotListTitle();
				String[] spotConlist = dto.getSpotListCon();
				String[] spotLatList = dto.getSpotListLat();
				String[] spotLngList = dto.getSpotListLng();
				Integer[] spotnoList = dto.getSpotListNo();
				
				int totalMarkerCount = 0;
				for(int i=0; i<spotLatList.length; i++) {
					TourMarkerDTO mdto = new TourMarkerDTO();
					mdto.setTourno(tourno);
					mdto.setSpottitle(spotTitleList[i]);
					mdto.setSpotcontent(spotConlist[i]);
					mdto.setSpotlat(spotLatList[i]);
					mdto.setSpotlng(spotLngList[i]);
					
					//mapper를 통해서 db에 마커 갯수만큼 mdto 저장 반복			
					totalMarkerCount += tourMapper.insertMarker(mdto);
				}
				
				//투어 이미지 자동으로 선택
				//자주사용하는 경로 선택시에는, 자동으로 해당 이미지 지정해서 리턴 (DB에는 파일명 넣지 않는다.)
						
				//투어 타입에 따라 tourlist.jsp에서 표현해줄 마우스오버 효과 지정
				
		return result;
	}

	@Override
	public List<TourReplyDTO> replyList(int tourno) {
		// TODO Auto-generated method stub
		return tourMapper.replyList(tourno);
	}

	@Override
	public List<TourReplyDTO> replyInsert(TourReplyDTO redto) {
		// TODO Auto-generated method stub
		if(redto.getReorder()<0) {
			tourMapper.replyInsert(redto);
		} else {
			tourMapper.rereplyInsert(redto);
		}
		
		return tourMapper.replyList(redto.getTourno());
	}

	@Override
	public int updateState(int tourno, int tourstate) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<>();
		map.put("tourno", tourno);
		map.put("tourstate", tourstate);
		return tourMapper.updateState(map);
	}
	
}
