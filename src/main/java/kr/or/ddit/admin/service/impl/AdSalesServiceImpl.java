package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdSalesMapper;
import kr.or.ddit.admin.service.AdSalesService;
import kr.or.ddit.vo.AdSalesStatVO;
import kr.or.ddit.vo.AdSalesVO;
import kr.or.ddit.vo.AdStatsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdSalesServiceImpl implements AdSalesService{
	@Autowired
	AdSalesMapper adSalesMapper;
	
	// 매출 내역 목록
	@Override
	public List<AdSalesVO> salesList(Map<String, String> map) {
		return this.adSalesMapper.salesList(map);
	}

	// 매출 내역 엑셀 다운로드용 목록
	@Override
	public List<AdSalesVO> salesListExcel(Map<String, String> map) {
		return this.adSalesMapper.salesListExcel(map);
	}

	// 매출 내역 총 데이터 개수
	@Override
	public int getTotal(Map<String, String> map) {
		return this.adSalesMapper.getTotal(map);
	}

	// 매출 추이 계산용 전년도 매출
	@Override
	public int lastYearSales() {
		return this.adSalesMapper.lastYearSales();
	}

	// 매출 추이 계산용 현년도 매출
	@Override
	public int thisYearSales() {
		return this.adSalesMapper.thisYearSales();
	}

	// 매출 추이 계산용 전월 매출
	@Override
	public int lastMthSales() {
		// TODO Auto-generated method stub
		return this.adSalesMapper.lastMthSales();
	}

	// 매출 추이 계산용 현월 매출
	@Override
	public int thisMthSales() {
		return this.adSalesMapper.thisMthSales();
	}

	// 전월 최고 매출 업체 정보
	@Override
	public AdSalesStatVO popularBusi() {
		return this.adSalesMapper.popularBusi();
	}

	// 신규 가입 추이 계산용 전월 가입 회원 수
	@Override
	public int lastMthSignIn() {
		return this.adSalesMapper.lastMthSignIn();
	}

	// 신규 가입 추이 계산용 현월 가입 회원 수
	@Override
	public int thisMthSignIn() {
		return this.adSalesMapper.thisMthSignIn();
	}

	// 연도별 매출 통계
	@Override
	public List<AdStatsVO> salesYMStats(String year) {
		return this.adSalesMapper.salesYMStats(year);
	}

	// 연도별 예약 수 통계
	@Override
	public List<AdStatsVO> rsvYMStats(String year) {
		return this.adSalesMapper.rsvYMStats(year);
	}

	// 연도별 가입자 수 통계
	@Override
	public List<AdStatsVO> memYMStats(String year) {
		return this.adSalesMapper.memYMStats(year);
	}

	// 연령별 회원 수 통계
	@Override
	public List<AdStatsVO> memAgeStats() {
		return this.adSalesMapper.memAgeStats();
	}

}
