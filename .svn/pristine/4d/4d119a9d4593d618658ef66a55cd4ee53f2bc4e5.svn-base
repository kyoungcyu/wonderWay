package kr.or.ddit.member.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MemRcmMapper;
import kr.or.ddit.member.mapper.MmAcmMapper;
import kr.or.ddit.member.service.MemRcmService;
import kr.or.ddit.member.service.MmAcmService;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.RcmMbtiTourVO;
import kr.or.ddit.vo.RcmRntVO;
import kr.or.ddit.vo.MbtiStyRcmVO;
import kr.or.ddit.vo.RcmLocVO;
import kr.or.ddit.vo.RcmStyVO;

@Service
public class MemRcmServiceImpl implements MemRcmService {

	@Autowired
	MemRcmMapper memRcmMapper;
	
	//회원 맞춤 숙소 추천
	@Override
	public RcmStyVO rcmStyList(RcmStyVO rcmStyVO) {
		return this.memRcmMapper.rcmStyList(rcmStyVO);
	};
	
	//회원 맞춤 숙소 추천 조회
	@Override
	public List<BusiVO> rcmBusiSty(RcmStyVO rcmStyVO) {
		return this.memRcmMapper.rcmBusiSty(rcmStyVO);
	};
	
	//mbti별 여행지 추천
	@Override
	public RcmMbtiTourVO mbtiTourNm(String tourMbti) {
		return this.memRcmMapper.mbtiTourNm(tourMbti);
	};
	
	//MBTI별 숙소 추천1
	@Override
	public MbtiStyRcmVO styMbtiRcm(MbtiStyRcmVO mbtiStyRcmVO) {
		return this.memRcmMapper.styMbtiRcm(mbtiStyRcmVO);
	}
	//MBTI별 숙소 상세 조회
	@Override
	public BusiVO styMbtiRcmDetail(String busiId) {
		return this.memRcmMapper.styMbtiRcmDetail(busiId);
	}
	
	@Override
	public RcmRntVO rcmRntList(RcmRntVO rcmRntVO) {
		return this.memRcmMapper.rcmRntList(rcmRntVO);
	}

	@Override
	public int checkMember(String memId) {
		// TODO Auto-generated method stub
		return this.memRcmMapper.checkMember(memId);
	}

	@Override
	public int checkMemberUpdate(Map<String, String> map) {
		// TODO Auto-generated method stub
		return this.memRcmMapper.checkMemberUpdate(map);
	}

	@Override
	public int checkMemberInsert(Map<String, String> map) {
		// TODO Auto-generated method stub
		return this.memRcmMapper.checkMemberInsert(map);
	}

	@Override
	public RcmLocVO locRcmDetail(String tourNm) {
		// TODO Auto-generated method stub
		return this.memRcmMapper.locRcmDetail(tourNm);
	}
}
