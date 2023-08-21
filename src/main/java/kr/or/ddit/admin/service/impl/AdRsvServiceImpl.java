package kr.or.ddit.admin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdRsvMapper;
import kr.or.ddit.admin.service.AdRsvService;
import kr.or.ddit.vo.RsvListVO;

@Service
public class AdRsvServiceImpl implements AdRsvService{
	@Autowired
	AdRsvMapper adRsvMapper;
	
	// 숙박 예약 목록
	public List<RsvListVO> rsvList(Map<String,String> map) {
		return adRsvMapper.rsvList(map);
	}

	// 예약 상세 정보
	@Override
	public RsvListVO rsvDetail(Map<String, String> map) {
		return adRsvMapper.rsvDetail(map);
	}

	// 예약 데이터 총 개수
	@Override
	public int getTotal(Map<String, String> map) {
		return adRsvMapper.getTotal(map);
	}

	@Override
	public int cntStyMonth() {
		return adRsvMapper.cntStyMonth();
	}

	@Override
	public int cntRntMonth() {
		return adRsvMapper.cntRntMonth();
	}

	@Override
	public int sumRsvMonth() {
		return adRsvMapper.sumRsvMonth();
	}
}
