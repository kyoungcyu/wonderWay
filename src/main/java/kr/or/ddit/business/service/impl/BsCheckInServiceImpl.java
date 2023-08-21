package kr.or.ddit.business.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsCheckInMapper;
import kr.or.ddit.business.service.BsCheckInService;
import kr.or.ddit.vo.CheckInVO;

@Service
public class BsCheckInServiceImpl implements BsCheckInService{
	@Autowired
	BsCheckInMapper bsCheckInMapper;

	@Override
	public CheckInVO checkRsv(String memId) {
		return this.bsCheckInMapper.checkRsv(memId);
	}

	@Override
	public int checkIn(String rsvId) {
		return this.bsCheckInMapper.checkIn(rsvId);
	}
	@Override
	public int checkOut(String rsvId) {
		return this.bsCheckInMapper.checkOut(rsvId);
	}
	
	//메인페이지
	// 오늘 입실 리스트
	@Override
	public List<CheckInVO> todayCome(Map<String,Object> checkInMap) {
		return this.bsCheckInMapper.todayCome(checkInMap);
	}
	// 오늘 퇴실 리스트
	@Override
	public List<CheckInVO> todayOut(Map<String,Object> checkOutMap) {
		return this.bsCheckInMapper.todayOut(checkOutMap);
	}
	
	// 총 입실 수
	@Override
	public int totalIn(String busiId) {
		return this.bsCheckInMapper.totalIn(busiId);
	}
	//총 퇴실 수
	@Override
	public int totalOut(String busiId) {
		return this.bsCheckInMapper.totalOut(busiId);
	}
	
	
	// 오늘 예약 수 
	@Override
	public int todayRsv(String busiId) {
		return this.bsCheckInMapper.todayRsv(busiId);
	}
	
	// 오늘 취소 수
	@Override
	public int todayRfd(String busiId) {
		return this.bsCheckInMapper.todayRfd(busiId);
	}
	
	// 오늘 리뷰 수
	@Override
	public int todayRvw(String busiId) {
		return this.bsCheckInMapper.todayRvw(busiId);
	}
}
