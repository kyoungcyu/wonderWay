package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdRfdMapper;
import kr.or.ddit.admin.service.AdRfdService;
import kr.or.ddit.vo.RfdListVO;

@Service
public class AdRfdServiceImpl implements AdRfdService{
	@Autowired
	AdRfdMapper adRfdMapper;
	
	// 환불 요청 목록
	@Override
	public List<RfdListVO> rfdList(Map<String,String> map) {
		return adRfdMapper.rfdList(map);
	}

	// 환불 요청 상세
	@Override
	public RfdListVO rfdDetail(String payId) {
		return adRfdMapper.rfdDetail(payId);
	}

	// 환불 요청 승인
	@Override
	public int rfdAccept(String payId) {
		return adRfdMapper.rfdAccept(payId);
	}
	
	// 환불 요청 승인 일자 갱신
	@Override
	public int rfdDtAccept(String payId) {
		return this.adRfdMapper.rfdDtAccept(payId);
	}

	// 환불 요청 거절
	@Override
	public int rfdDenied(String payId) {
		return adRfdMapper.rfdDenied(payId);
	}

	// 결제 정보 환불 완료로 갱신
	@Override
	public int rsvAccept(String payId) {
		return adRfdMapper.rsvAccept(payId);
	}

	// 환불 요청 총 데이터 개수
	@Override
	public int getTotal(Map<String, String> map) {
		return adRfdMapper.getTotal(map);
	}
	
	// 환불 정책 수수료 갱신
	@Override
	public int rfdUpdateFee(Map<String, String> map) {
		return adRfdMapper.rfdUpdateFee(map);
	}

	@Override
	public int cntRfdAll() {
		return adRfdMapper.cntRfdAll();
	}

	@Override
	public int cntRfdAcceptAll() {
		return adRfdMapper.cntRfdAcceptAll();
	}

	@Override
	public int sumRfdAll() {
		return adRfdMapper.sumRfdAll();
	}

}
