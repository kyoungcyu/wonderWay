package kr.or.ddit.business.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.mapper.BsRsvMapper;
import kr.or.ddit.business.service.BsRsvService;
import kr.or.ddit.vo.BsRfdListVO;
import kr.or.ddit.vo.BsRsvListVO;
import kr.or.ddit.vo.RsvListVO;

@Service
public class BsRsvServiceImpl implements BsRsvService {
	@Autowired
	BsRsvMapper bsRsvMapper;
	
	public List<BsRsvListVO> rsvList(Map<String,String> map) {
		return bsRsvMapper.rsvList(map);
	}
	
	public BsRsvListVO rsvDetail(String rsvId) {
		return bsRsvMapper.rsvDetail(rsvId);
	}
	
	public int getTotal(Map<String, String> map) {
		return bsRsvMapper.getTotal(map);
	}

	public List<BsRfdListVO> rfdList(Map<String, String> map){
		return bsRsvMapper.rfdList(map);
	}

	public int getTotalRfd(Map<String, String> map) {
		return bsRsvMapper.getTotalRfd(map);
	}
}

