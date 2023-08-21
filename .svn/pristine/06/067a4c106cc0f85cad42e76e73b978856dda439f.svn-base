package kr.or.ddit.business.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BsRmVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;

public interface BsRmService {
	// 방 리스트
	public List<BsRmVO> bsRmList(Map<String, String> map);
	// 페이징
	public int getTotal(Map<String, String> map);
	// 방등록
	public int addRm(BsRmVO bsRmVO);
	// 방아이디 정보
	public BsRmVO rmIdList(String rmId);
	// 방정보 업데이트 1
	public int updateRm(BsRmVO bsRmVO);
	public List<CvfcVO> cvfcSer();
	public List<CvfcVO> cvfcRm();
	public List<CvfcVO> cvfcIcon();
	public List<CvfcVO> cvfcAcc();
	public int insertCvfc(BusiVO busiVO);
	public List<CvfcVO> selectCvfc(BusiVO busiVO);
	public int deleteCvfc(BusiVO busiVO);
	
	
	

}
