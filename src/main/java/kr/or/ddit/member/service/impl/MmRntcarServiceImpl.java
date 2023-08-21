package kr.or.ddit.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.member.mapper.MmRntcarMapper;
import kr.or.ddit.member.service.MmRntcarService;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.HInsrVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RvwVO;

@Service
public class MmRntcarServiceImpl implements MmRntcarService {

	@Inject
	MmRntcarMapper mmRntcarMapper;
	
	@Inject
	MmMemMapper mmMemMapper;

	//업체 검색
	@Override
	public List<CarVO> searchRntcar(HashMap<String, Object> map) {

		return this.mmRntcarMapper.searchRntcar(map);
	}

	//차량 최댓값
	@Override
	public Integer getMaxCarPr(HashMap<String, Object> map) {
		
		return this.mmRntcarMapper.getMaxCarPr(map);
	}

	
	//차량정보 가져오기
	@Override
	public CarVO detailRntcar(String carNum) {
		
		return this.mmRntcarMapper.detailRntcar(carNum);
	}

	@Override
	public int insertGuestRsv(Map<String, String> data) {

		return this.mmRntcarMapper.insertGuestRsv(data);
	}

	@Override
	public List<HInsrVO> getHInsrVO(String busiId) {
		
		return this.mmRntcarMapper.getHInsrVO(busiId);
	}
	
	
	
	@Override
	public int countPayId(String payId) {
		
		return this.mmRntcarMapper.countPayId(payId);
	}

	@Override
	public int countRsvId(String rsvId) {
		
		return this.mmRntcarMapper.countRsvId(rsvId);
	}
	
	
	@Override
	public String checkRsvId(String rsvId) {

		return this.mmRntcarMapper.checkRsvId(rsvId);
	}
	

	@Override
	public int insertMemRsv(Map<String, String> data) {

		return this.mmRntcarMapper.insertMemRsv(data);
	}

	@Override
	public List<CarVO> searchFilter(HashMap<String, Object> map) {
		
		return this.mmRntcarMapper.searchFilter(map);
	}

	

	

	

}
