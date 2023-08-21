package kr.or.ddit.business.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BsRmVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;

public interface BsRmMapper {
	// 방 리스트
	public List<BsRmVO> bsRmList(Map<String, String> map);

	public int getTotal(Map<String, String> map);

	public int addRm(BsRmVO bsRmVO);

	public BsRmVO rmIdList(String rmId);

	public int updateRm(BsRmVO bsRmVO);
	
	public int updateRm2(BsRmVO bsRmVO);
	
	//공지사항 작성 - 첨부파일
	public int attachInsert(AttachVO attachVO);
	
	//공지사항 작성 - 첨부파일_상세
	public int attachDeInsert(List<AttachDeVO> attachDeVOlist);

	public List<CvfcVO> cvfcSer();

	public List<CvfcVO> cvfcRm();

	public List<CvfcVO> cvfcIcon();

	public List<CvfcVO> cvfcAcc();

	public int insertCvfc(BusiVO busiVO);

	public List<CvfcVO> selectCvfc(BusiVO busiVO);

	public int deleteCvfc(BusiVO busiVO);
}
