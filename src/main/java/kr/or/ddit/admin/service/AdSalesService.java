package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import kr.or.ddit.vo.AdSalesStatVO;
import kr.or.ddit.vo.AdSalesVO;
import kr.or.ddit.vo.AdStatsVO;
import kr.or.ddit.vo.AdadVO;
import kr.or.ddit.vo.AdvListVO;
import kr.or.ddit.vo.AdvReqListVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RcmLocVO;

public interface AdSalesService {
	// 매출 내역 목록
	public List<AdSalesVO> salesList(Map<String, String> map);

	// 매출 내역 엑셀 다운로드용 목록
	public List<AdSalesVO> salesListExcel(Map<String, String> map);
	
	// 매출 내역 총 데이터 개수
	public int getTotal(Map<String, String> map);
	
	// 매출 추이 계산용 전년도 매출
	public int lastYearSales();
	
	// 매출 추이 계산용 현년도 매출
	public int thisYearSales();
	
	// 매출 추이 계산용 전월 매출
	public int lastMthSales();
	
	// 매출 추이 계산용 현월 매출
	public int thisMthSales();
	
	// 전월 최고 매출 업체 정보
	public AdSalesStatVO popularBusi();
	
	// 신규 가입 추이 계산용 전월 가입 회원 수
	public int lastMthSignIn();

	// 신규 가입 추이 계산용 현월 가입 회원 수
	public int thisMthSignIn();
	
	// 연도별 매출 통계
	public List<AdStatsVO> salesYMStats(String year);
	
	// 연도별 예약 수 통계
	public List<AdStatsVO> rsvYMStats(String year);

	// 연도별 가입자 수 통계
	public List<AdStatsVO> memYMStats(String year);
	
	// 연령별 회원 수 통계
	public List<AdStatsVO> memAgeStats();
}
