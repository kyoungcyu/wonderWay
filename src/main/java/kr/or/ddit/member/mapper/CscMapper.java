package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.FaqVO;
import kr.or.ddit.vo.LikeBrdVO;

public interface CscMapper {
	
	//공지사항 목록
	public List<BrdVO> cscNoticeList(Map<String, String> map);
	
	//공지사항 수
	public int cscNoticeTotal(Map<String,String> map);
	
	//공지사항 상세
	public BrdVO cscNoticeDetail(BrdVO brdVO);
	
	//공지사항 조회수
	public int noticeCnt(String brdId);
	
	//좋아요 체크
	public int checkLikeBrd(Map<String, String> map);
	
	//공지사항 첨부파일
	public AttachDeVO savePath(BrdVO brdVO);
	
	//자주 묻는 질문 목록
	public List<FaqVO> faq(FaqVO faqVO);
	
	//본인 작성 문의 내역
	public List<BrdVO> inquiryList(Map<String, String> map);
	
	//본인 작성 문의 수
	public int inquiryTotal(Map<String,String> map);
	
	//본인 작성 문의 상세
	public BrdVO inquiryDetail(Map<String,String> map);
	
	//고객문의 등록
	public int inquiryRegistrationPost(BrdVO brdVO);
	
	//고객문의 수정 진행
	public int inquiryModifyPost(BrdVO brdVO);
	
	//고객문의 삭제
	public int inquiryDelete(BrdVO brdVO);
}
