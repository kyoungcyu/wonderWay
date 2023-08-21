package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdAdvMapper;
import kr.or.ddit.admin.mapper.AdRsvMapper;
import kr.or.ddit.admin.service.AdAdvService;
import kr.or.ddit.admin.service.AdRsvService;
import kr.or.ddit.vo.AdadVO;
import kr.or.ddit.vo.AdvListVO;
import kr.or.ddit.vo.AdvReqListVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RcmLocVO;
import kr.or.ddit.vo.RsvListVO;

@Service
public class AdAdvServiceImpl implements AdAdvService{
	@Autowired
	AdAdvMapper adAdvMapper;

	// 광고 목록
	@Override
	public List<AdvListVO> advList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return this.adAdvMapper.advList(map);
	}

	// 광고 상세
	@Override
	public AdvListVO advDetail(String advId) {
		return this.adAdvMapper.advDetail(advId);
	}

	// 총 데이터 개수(광고목록)
	@Override
	public int getTotalAdv(Map<String, String> map) {
		return this.adAdvMapper.getTotalAdv(map);
	}
	
	// 광고 요청 목록
	@Override
	public List<AdvReqListVO> advReqList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return this.adAdvMapper.advReqList(map);
	}
	
	// 광고 요청 상세
	@Override
	public AdvReqListVO advReqDetail(String advId) {
		return this.adAdvMapper.advReqDetail(advId);
	}

	// 총 데이터 개수(광고요청목록)
	@Override
	public int getTotalAdvReq(Map<String, String> map) {
		return this.adAdvMapper.getTotalAdvReq(map);
	}
	
	// 요청 승인 or 거절
	@Override
	public int processRequest(Map<String, String> map) {
		return this.adAdvMapper.processRequest(map);
	}

	// 광고 상품 금액 수정
	@Override
	public int adSetting(Map<String, String> map) {
		return this.adAdvMapper.adSetting(map);
	}

	// 광고 상품 정보
	@Override
	public AdadVO selectAdDc(String adId) {
		return this.adAdvMapper.selectAdDc(adId);
	}

	// 광고 상품 목록
	@Override
	public List<AdadVO> selectAdList(Map<String, String> map) {
		return this.adAdvMapper.selectAdList(map);
	}

	// 광고 상품 총 데이터 개수
	@Override
	public int getTotalAdSet() {
		return this.adAdvMapper.getTotalAdSet();
	}

	@Override
	public int cntAdvActive() {
		return this.adAdvMapper.cntAdvActive();
	}

	@Override
	public int cntAdvExp() {
		return this.adAdvMapper.cntAdvExp();
	}

	@Override
	public int sumAdvActive() {
		return this.adAdvMapper.sumAdvActive();
	}

	@Override
	public int cntAdvReqAll() {
		return this.adAdvMapper.cntAdvReqAll();
	}

	@Override
	public int cntAdvReqMain() {
		return this.adAdvMapper.cntAdvReqMain();
	}

	@Override
	public int cntAdvReqUnder() {
		return this.adAdvMapper.cntAdvReqUnder();
	}

	@Override
	public int cntAdvReqSearch() {
		return this.adAdvMapper.cntAdvReqSearch();
	}
}
