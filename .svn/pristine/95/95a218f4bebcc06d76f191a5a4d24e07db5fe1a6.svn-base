package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdBusiSalesVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.RmVO;

public interface AdBusiMapper {
	/**
	 * 숙박 업체 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<BusiVO> styList(Map<String, String> map);
	
	/**
	 * 숙박업체 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int styTotal(Map<String, String> map);
	
	/**
	 * 렌트카 업체 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<BusiVO> rntList(Map<String, String> map);
	
	/**
	 * 렌터카 업체 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int rntTotal(Map<String, String> map);
	
	/**
	 * 숙박 업체 상세
	 * @param busiVO 업체ID
	 * @return
	 */
	public BusiVO styDetail(BusiVO busiVO);
	
	/**
	 * 숙박 업체 방리스트
	 * @param busiVO 업체ID
	 * @return
	 */
	public List<RmVO> roomList(BusiVO busiVO);
	
	/**
	 * 숙박 업체 방의 개수
	 * @param busiVO 업체ID
	 * @return
	 */
	public int countRoom(BusiVO busiVO);
	
	/**
	 * 최근 30일 예약건수
	 * @param busiVO 업체ID
	 * @return
	 */
	public int countRsv(BusiVO busiVO);
	
	/**
	 * 최근 30일 수익
	 * @param busiVO 업체ID
	 * @return
	 */
	public String totalPay(BusiVO busiVO);
	
	/**
	 * 업체 활성/비활성화
	 * @param busiVO 업체ID, 활성/비활성
	 * @return
	 */
	public int updateAbled(BusiVO busiVO);
	
	/**
	 * 렌터카 차량의 개수
	 * @param busiVO 업체ID
	 * @return
	 */
	public int countCar(BusiVO busiVO);
	
	/**
	 * 차량리스트
	 * @param busiVO 업체ID
	 * @return
	 */
	public List<CarVO> carList(BusiVO busiVO);
	
	/**
	 * 전체 업체 리스트
	 * @param busiVO
	 * @return
	 */
	public List<BusiVO> busiList();
	
	/**
	 * 숙박 업체 엑셀 다운로드
	 * @return
	 */
	public List<BusiVO> styExcelList();
	
	/**
	 * 렌터카 업체 엑셀 다운로드
	 * @return
	 */
	public List<BusiVO> rntExcelList();
	
	/**
	 * 활성 숙박 업체수
	 * @return
	 */
	public int enableSty();
	
	/**
	 * 비활성 숙박 업체수
	 * @return
	 */
	public int disableSty();
	
	/**
	 * 호텔 수
	 * @return
	 */
	public int hotel();
	
	/**
	 * 모텔 수
	 * @return
	 */
	public int motel();
	
	/**
	 * 리조트 수
	 * @return
	 */
	public int resort();
	
	/**
	 * 게스트하우스 수
	 * @return
	 */
	public int ghouse();
	
	/**
	 * 펜션 수
	 * @return
	 */
	public int pension();
	
	/**
	 * 이번 달 숙박 업체 수익
	 * @return
	 */
	public int thisMthSty();
	
	/**
	 * 지난 달 숙박 업체 수익
	 * @return
	 */
	public int lastMthSty();
	
	/**
	 * 활성 렌터카 업체수
	 * @return
	 */
	public int enableRnt();
	
	/**
	 * 비활성 렌터카 업체수
	 * @return
	 */
	public int disableRnt();
	
	/**
	 * 이번 달 렌터카 업체 수익
	 * @return
	 */
	public int thisMthRnt();
	
	/**
	 * 지난 달 렌터카 업체 수익
	 * @return
	 */
	public int lastMthRnt();
	
	/**
	 * 업체 별 정산 내역
	 * @param map
	 * @return
	 */
	public List<AdBusiSalesVO> busiSalesList(Map<String, String> map);
	
	/**
	 * 정산 내역 총 데이터 수
	 * @param map
	 * @return
	 */
	public int getTotalSales(Map<String, String> map);
	
	public int salesYear(String busiSearch);

	public int salesMonth(String busiSearch);
	
	public List<AdBusiSalesVO> downloadExcel(Map<String, String> map);
}








