package kr.or.ddit.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.InsuDetailVO;
import kr.or.ddit.vo.InsuVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

public interface MmInsuService {

	//보험검색
	public List<InsuVO> searchInsu(HashMap<String, Object> map);
	
	
	//보험 상세 페이지-보험 정보 가져오기
	public InsuVO getInsuVO(String insuId);
	
	
	//보험 상세 페이지-보험종류
	public List<InsuDetailVO> detailInsu(String insuId);
	
	
	//<!-- 보험 가입  -->
	public InsuDetailVO getInsuDeVO(String prodId);

}
