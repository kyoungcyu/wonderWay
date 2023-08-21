package kr.or.ddit.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MmAcmMapper;
import kr.or.ddit.member.mapper.MmInsuMapper;
import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.member.service.MmAcmService;
import kr.or.ddit.member.service.MmInsuService;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.InsuDetailVO;
import kr.or.ddit.vo.InsuVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

@Service
public class MmInsuServiceImpl implements MmInsuService {

	@Inject
	MmInsuMapper mmInsuMapper;
	
	//보험 검색
	@Override
	public List<InsuVO> searchInsu(HashMap<String, Object> map) {
		
		return this.mmInsuMapper.searchInsu(map);
	}


	//보험상세페이지-보험정보 가져오기 
	@Override
	public InsuVO getInsuVO(String insuId) {
		
		return this.mmInsuMapper.getInsuVO(insuId);
	}
	
	
	
	//보험상세페이지
	@Override
	public List<InsuDetailVO> detailInsu(String insuId) {

		return this.mmInsuMapper.detailInsu(insuId);
	}


	@Override
	public InsuDetailVO getInsuDeVO(String prodId) {
		// TODO Auto-generated method stub
		return this.mmInsuMapper.getInsuDeVO(prodId);
	}
	
	

	



	

}
