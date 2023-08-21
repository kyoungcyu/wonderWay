package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdadVO;
import kr.or.ddit.vo.AdvListVO;
import kr.or.ddit.vo.AdvReqListVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RcmLocVO;

public interface AdAdvService {
	// 광고 목록
	public List<AdvListVO> advList(Map<String, String> map);

	// 광고 상세
	public AdvListVO advDetail(String advId);

	// 총 데이터 개수(광고목록)
	public int getTotalAdv(Map<String, String> map);

	// 광고 목록
	public List<AdvReqListVO> advReqList(Map<String, String> map);

	// 광고 상세
	public AdvReqListVO advReqDetail(String advId);

	// 총 데이터 개수(광고요청목록)
	public int getTotalAdvReq(Map<String, String> map);
	
	// 요청 승인 or 거절
	public int processRequest(Map<String, String> map);
	
	// 광고 상품 금액 수정
	public int adSetting(Map<String, String> map);
	
	// 광고 상품 설명
	public AdadVO selectAdDc(String adId);
	
	// 광고 상품 목록
	public List<AdadVO> selectAdList(Map<String, String> map);
	
	// 광고 상품 총 데이터 개수
	public int getTotalAdSet();
	
	// 광고 중 업체 수
	public int cntAdvActive();
	
	// 만료된 광고 수
	public int cntAdvExp();

	// 총 광고 금액 합계
	public int sumAdvActive();
	
	// 미처리 요청 수
	public int cntAdvReqAll();
	
	// 메인 배너 요청
	public int cntAdvReqMain();
	
	// 하단 배너 요청
	public int cntAdvReqUnder();
	
	// 최상단 노출 요청
	public int cntAdvReqSearch();
}
