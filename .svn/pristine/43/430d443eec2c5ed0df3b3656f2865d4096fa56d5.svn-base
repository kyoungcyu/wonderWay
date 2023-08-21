package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MbtiStyRcmVO;
import kr.or.ddit.vo.RcmLocVO;
import kr.or.ddit.vo.RcmMbtiTourVO;
import kr.or.ddit.vo.RcmRntVO;
import kr.or.ddit.vo.RcmStyVO;

public interface MemRcmMapper {
	
	//회원 맞춤 숙소 추천
	public RcmStyVO rcmStyList(RcmStyVO rcmStyVO);
	//회원 맞춤 숙소 추천 조회
	public List<BusiVO> rcmBusiSty(RcmStyVO	rcmStyVO);
	
	
	//MBTI별 숙소 추천 조회
	public MbtiStyRcmVO styMbtiRcm(MbtiStyRcmVO mbtiStyRcmVO);
	//MBIT별 숙소 상세 조회
	public BusiVO styMbtiRcmDetail(String busiId);
	
	
	//mbti별 여행지 추천
	public RcmMbtiTourVO mbtiTourNm(String tourNm);
	
	// 회원별 렌트카 추천
	public RcmRntVO rcmRntList(RcmRntVO rcmRntVO);
	
	// 선호도 조사 기반 여행지 추천
	// 회원 유무 체크
	public int checkMember(String memId);
	
	// 회원 존재 시, update
	public int checkMemberUpdate(Map<String, String> map);

	// 회원 부재 시, insert
	public int checkMemberInsert(Map<String, String> map);
	
	// 추천된 여행지 상세
	public RcmLocVO locRcmDetail(String tourNm);
}







