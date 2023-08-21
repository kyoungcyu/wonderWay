package kr.or.ddit.business.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BsRfdListVO;
import kr.or.ddit.vo.BsRsvListVO;
import kr.or.ddit.vo.RsvListVO;

public interface BsRsvService {
	// 예약내역  
	public List<BsRsvListVO> rsvList(Map<String,String> map);
	// 예약회원 상세보기
	public BsRsvListVO rsvDetail(String rsvId);
	// 검색 
	public int getTotal(Map<String, String> map);
	
	// 환불내역
	public List<BsRfdListVO> rfdList(Map<String, String> map);
	// 환불검색
	public int getTotalRfd(Map<String, String> map);
	


}
