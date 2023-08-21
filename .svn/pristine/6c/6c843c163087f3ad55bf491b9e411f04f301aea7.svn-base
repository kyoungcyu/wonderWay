package kr.or.ddit.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.TrnRmVO;
import kr.or.ddit.vo.TrnSeatVO;

public interface MmTrnService {

	//<!--기차역에 맞는 아이디 가져오기  -->
	public String getStationId (String stationNm);
	
	
	//<!--랜덤 좌석 배정  -->
	public List<TrnSeatVO> getRndSeat(HashMap<String, Object> map);
	
	
	//<!--객실 가져오기  -->
	public List<TrnRmVO> getRm(String trnKnd);
	
	
	//<!--좌석 가져오기  -->
	public List<TrnSeatVO> getSeat(HashMap<String, String> map);
	

	//<!--rsvId 오늘날짜로 시작하는거 있는지 확인  -->
	public int countTrRsvId(String rsvId);

	
	//<!--오늘날짜 예약아이디 있을시 +1해주기  -->
	public String checkTrRsvId(String string);

	
	//	<!--회원 예약시 테이블에 인서트  -->
	public int insertMemRsv(HashMap<String, Object> map);




	
		
	
	
}
