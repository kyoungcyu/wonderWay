package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdCupnMapper;
import kr.or.ddit.admin.service.AdCupnService;
import kr.or.ddit.vo.CupnVO;

@Service
public class AdCupnServiceImpl implements AdCupnService{
	@Autowired
	AdCupnMapper adCupnMapper;

	// 쿠폰 목록
	@Override
	public List<CupnVO> cupnList(Map<String, String> map) {
		return this.adCupnMapper.cupnList(map);
	}

	// 전체 목록 개수
	@Override
	public int getTotal(Map<String, String> map) {
		return this.adCupnMapper.getTotal(map);
	}

	// 쿠폰 상세
	@Override
	public CupnVO cupnDetail(String cupnId) {
		return this.adCupnMapper.cupnDetail(cupnId);
	}

	// 쿠폰 비활성화
	@Override
	public int cupnUnable(String cupnId) {
		return this.adCupnMapper.cupnUnable(cupnId);
	}

	// 쿠폰 등록
	@Override
	public int cupnRegist(CupnVO cupnVO) {
		return this.adCupnMapper.cupnRegist(cupnVO);
	}
}
