package kr.or.ddit.member.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.HInsrVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RvwVO;

public interface MmRntcarMapper {
	
	//업체검색
	//<select id="searchAcm" parameterType="hashMap" resultType="BusiVO">
	public List<CarVO> searchRntcar(HashMap<String, Object> map);
	

	//차량 최댓값
	//<select id="getMaxCarPr" parameterType="hashMap" resultType="int">
	public Integer getMaxCarPr(HashMap<String, Object> map);
		
	
	//검색필터
	//<select id="searchFilter" parameterType="hashMap" resultType="carVO">
	public List<CarVO> searchFilter(HashMap<String, Object> map);
	
	//차량 정보 가져오기
	//<select id="detailRntcar"  parameterType="String" resultType="carVO">
	public CarVO detailRntcar(String carNum);
	
	//보험 정보 가져오기
	//<select id="detailRntcar"  parameterType="String" resultType="carVO">
	public List<HInsrVO> getHInsrVO(String busiId);
	
	
	//<!--payId 오늘날짜로 시작하는거 있는지 확인  -->
	//<select id="countPayId" resultType="int">
	public int countPayId(String payId);
	
	//<!--rsvId 오늘날짜로 시작하는거 있는지 확인  -->
	//<select id="countRsvId" resultType="int">
	public int countRsvId(String rsvId);
	
	//<!--rsvId겹치면 +1해주기  -->
	//<select id="checkRsvId" parameterType="String" resultType="String">
	public String checkRsvId(String rsvId);
	
	
	//멤버테이블에 인서트
	public int insertGuestRsv(Map<String, String> data);

	
	//멤버테이블에 인서트
	public int insertMemRsv(Map<String, String> data);

}







