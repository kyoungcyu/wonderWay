package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdCheckDaysVO;
import kr.or.ddit.vo.AdCountCarsVO;
import kr.or.ddit.vo.AdCountRoomsVO;
import kr.or.ddit.vo.AdPopularRntVO;
import kr.or.ddit.vo.AdPopularStayVO;
import kr.or.ddit.vo.AdRntDaysVO;

public interface AdMainMapper {
	/**
	 * 숙박 업체 수
	 * @return
	 */
	public int styCount();
	
	/**
	 * 렌터카 업체 수
	 * @return
	 */
	public int rntCount();
	
	/**
	 * 전체 회원 수
	 * @return
	 */
	public int memCount();
	
	/**
	 * 지난 30일 매출
	 * @return
	 */
	public int totalSales();
	
	/**
	 * 숙박 업체 지난 30일 매출 TOP4
	 * @return
	 */
	public List<AdPopularStayVO> popularSty();
	
	/**
	 * 체크인 체크아웃 통계
	 * @return
	 */
	public List<AdCheckDaysVO> checkDays();
	
	/**
	 * 전체 방 수와 예약 중인 방 수
	 * @return
	 */
	public AdCountRoomsVO countRooms();
	 
	/**
	 * 렌터카 업체 지난 30일 매출 TOP4
	 * @return
	 */
	public List<AdPopularRntVO> popularRnt();
	 
	/**
	 * 렌트시작 렌트종료 통계
	 * @return
	 */
	public List<AdRntDaysVO> rntDays();
	 
	/**
	 * 전체 차 수와 예약 중인 차 수
	 * @return
	 */
	public AdCountCarsVO countCars();
}








