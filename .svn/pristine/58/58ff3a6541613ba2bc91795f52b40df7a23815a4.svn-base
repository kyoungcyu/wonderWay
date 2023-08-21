package kr.or.ddit.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.HInsrVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

public interface MmRntcarService {

	//차량 검색
	public List<CarVO> searchRntcar(HashMap<String, Object> map);
	
	
	//차량 최댓값
	public Integer getMaxCarPr(HashMap<String, Object> map);

	
	//검색필터
	public List<CarVO> searchFilter(HashMap<String, Object> map);

	
	//차량정보 가져오기
	public CarVO detailRntcar(String carNum);
	
	
	//보험정보 가져오기
	public List<HInsrVO> getHInsrVO(String busiId);
	

	//<!--payId 오늘날짜로 시작하는거 있는지 확인  -->
	public int countPayId(String payId);
	
	//<!--rsvId 오늘날짜로 시작하는거 있는지 확인  -->
	public int countRsvId(String rsvId);
	
	
	//<!--rsvId겹치면 +1해주기  -->
	public String checkRsvId(String rsvId);
	
	//게스트 인서트
	public int insertGuestRsv(Map<String, String> data);

	
	//멤버테이블에 인서트
	public int insertMemRsv(Map<String, String> data);




			
	
}
