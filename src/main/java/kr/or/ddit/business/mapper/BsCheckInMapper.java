package kr.or.ddit.business.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CheckInVO;

public interface BsCheckInMapper {
	public CheckInVO checkRsv(String memId);
	
	public int checkIn(String rsvId);

	public int checkOut(String rsvId);

	public List<CheckInVO> todayCome(Map<String, Object> checkInMap);

	public List<CheckInVO> todayOut(Map<String, Object> checkOutMap);

	public int totalIn(String busiId);

	public int totalOut(String busiId);
	
	//오늘 예약 수 
	public int todayRsv(String busiId);
	//오늘 취소 수 
	public int todayRfd(String busiId);
	//오늘 리뷰 수 
	public int todayRvw(String busiId);

}

