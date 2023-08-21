package kr.or.ddit.member.service.impl;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.member.mapper.MmTrnMapper;
import kr.or.ddit.member.service.MmTrnService;
import kr.or.ddit.vo.TrnRmVO;
import kr.or.ddit.vo.TrnSeatVO;

@Service
public class MmTrnServiceImpl implements MmTrnService {
	
	@Inject
	MmTrnMapper mmTrnMapper;

	//<!--기차역에 맞는 아이디 가져오기  -->
	@Override
	public String getStationId(String stationNm) {

		return this.mmTrnMapper.getStationId(stationNm);
	}

	
	//	<!-- 랜덤 좌석 배정  -->
	@Override
	public List<TrnSeatVO> getRndSeat(HashMap<String, Object> map) {

		return this.mmTrnMapper.getRndSeat(map);
	}

	
	//<!--객실 가져오기  -->
	@Override
	public List<TrnRmVO> getRm(String trnKnd) {
		
		return this.mmTrnMapper.getRm(trnKnd);
	}


	//<!--좌석 가져오기  -->
	@Override
	public List<TrnSeatVO> getSeat(HashMap<String, String> map) {
	
		return this.mmTrnMapper.getSeat(map);
	}

	
	//<!--rsvId 오늘날짜로 시작하는거 있는지 확인  -->
	@Override
	public int countTrRsvId(String rsvId) {
		
		return this.mmTrnMapper.countTrRsvId(rsvId);
	}
	
	
	//<!--오늘날짜 예약아이디 있을시 +1해주기  -->
	@Override
	public String checkTrRsvId(String rsvId) {
		// TODO Auto-generated method stub
		return this.mmTrnMapper.checkTrRsvId(rsvId);
	}


	
	//<!--회원 예약시 테이블에 인서트  -->
	@Override
	public int insertMemRsv(HashMap<String, Object> map) {
		
		return this.mmTrnMapper.insertMemRsv(map);
	}

	

	
	
}
