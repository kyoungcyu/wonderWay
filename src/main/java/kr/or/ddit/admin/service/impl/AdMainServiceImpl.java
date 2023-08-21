package kr.or.ddit.admin.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdMainMapper;
import kr.or.ddit.admin.service.AdMainService;
import kr.or.ddit.vo.AdCheckDaysVO;
import kr.or.ddit.vo.AdCountCarsVO;
import kr.or.ddit.vo.AdCountRoomsVO;
import kr.or.ddit.vo.AdPopularRntVO;
import kr.or.ddit.vo.AdPopularStayVO;
import kr.or.ddit.vo.AdRntDaysVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdMainServiceImpl implements AdMainService{
	@Autowired
	AdMainMapper adMainMapper;
	
	/**
	 * 숙박 업체 수
	 */
	@Override
	public int styCount() {
		return this.adMainMapper.styCount();
	};
	
	/**
	 * 렌터카 업체 수
	 */
	@Override
	public int rntCount() {
		return this.adMainMapper.rntCount();
	};
	
	/**
	 * 전체 회원 수
	 */
	@Override
	public int memCount() {
		return this.adMainMapper.memCount();
	};
	
	/**
	 * 지난 30일 매출
	 */
	@Override
	public int totalSales() {
		return this.adMainMapper.totalSales();
	};
	
	/**
	 * 숙박 업체 지난 30일 매출 TOP4
	 */
	@Override
	public List<AdPopularStayVO> popularSty(){
		return this.adMainMapper.popularSty();
	};
	
	/**
	 * 체크인 체크아웃 통계
	 */
	@Override
	public List<AdCheckDaysVO> checkDays(){
		return this.adMainMapper.checkDays();
	};
	
	/**
	 * 전체 방 수와 예약 중인 방 수
	 */
	@Override
	public AdCountRoomsVO countRooms(){
		return this.adMainMapper.countRooms();
	};
	
	/**
	 * 렌터카 업체 지난 30일 매출 TOP4
	 */
	@Override
	public List<AdPopularRntVO> popularRnt(){
		return this.adMainMapper.popularRnt();
	};
	 
	/**
	 * 렌트시작 렌트종료 통계
	 */
	@Override
	public List<AdRntDaysVO> rntDays(){
		return this.adMainMapper.rntDays();
	};
	 
	/**
	 * 전체 차 수와 예약 중인 차 수
	 */
	@Override
	public AdCountCarsVO countCars() {
		return this.adMainMapper.countCars();
	};
}
