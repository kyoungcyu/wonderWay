package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CupnVO;

public interface AdCupnService {
	
	// 쿠폰 목록
	public List<CupnVO> cupnList(Map<String, String> map);
	
	// 전체 목록 개수
	public int getTotal(Map<String, String> map);
	
	// 쿠폰 상세
	public CupnVO cupnDetail(String cupnId);
	
	// 쿠폰 비활성화
	public int cupnUnable(String cupnId);
	
	// 쿠폰 등록
	public int cupnRegist(CupnVO cupnVO);
}
