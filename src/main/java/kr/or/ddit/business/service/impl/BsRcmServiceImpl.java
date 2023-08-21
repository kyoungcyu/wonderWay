package kr.or.ddit.business.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsRcmMapper;
import kr.or.ddit.business.service.BsRcmService;
import kr.or.ddit.vo.CvfcRcmVO;
import kr.or.ddit.vo.CvfcVO;

@Service
public class BsRcmServiceImpl implements BsRcmService{
	
	@Autowired
	BsRcmMapper bsRcmMapper;

	//업체 편의시설/서비스 추천
	@Override
	public CvfcRcmVO cvfcRcm(HashMap<String, String> map) {

		return this.bsRcmMapper.cvfcRcm(map);
	}

	//추천 편의시설/서비스의 VO가져오기
	@Override
	public CvfcVO getCvfcInfo(String cvfcId) {
		
		return this.bsRcmMapper.getCvfcInfo(cvfcId);
	}

}
