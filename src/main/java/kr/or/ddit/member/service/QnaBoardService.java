package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AnsVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.LikeBrdVO;
import kr.or.ddit.vo.TourVO;

public interface QnaBoardService {
	//오늘의 질문 조회하기 (최근순) 답변 없는
	public List<BrdVO> qnaBoardList(Map<String, String> map);	
	//qna 조회하기(답변 있는)
	public List<BrdVO> qnaBoardAnsList(Map<String, String> map);
	//질문답변 게시판 모든 질문 조회
	public List<BrdVO> allQnaBoardList(Map<String, String> map);
	//많이 본 QNA 조회
	public List<BrdVO> manyQnaList(Map<String, String> map);	
	
	//답변 유무 조회
	public int hasAns(String brdId);
	
	//질문 상세보기
	public List<BrdVO> qnaBoardDetail(String brdId);
	//질문 삭제하기
	public int queDelete(String brdId);
	//질문 등록하기
	public int queWrite(BrdVO brdVO);
	//질문 수정하기
	public int qnaUpdate(BrdVO brdVO);
	
	
	
	//답변 상세보기
	public List<AnsVO> ansDetail(String brdId);
	//답변 등록하기
	public int ansWrite(AnsVO ansVO);
	//답변 삭제하기
	public int ansDelete(String ansId);
	//답변 수정하기
	public int ansUpdate(AnsVO ansVO);
	
	
	
	
	
	//조회수 
	public int qnaViewCnt(String ansId);
	
	//답변없는 질문의 개수
	public int qnaBoardListCnt(BrdVO brdVO);
	//답변있는 질문의 개수
	public int qnaBoardAnsListCnt(BrdVO brdVO);
	//질문답변 게시판의 모든 질문의 수
	public int allQnaBoardListCnt(BrdVO brdVO);
	
	//오늘의 질문
	public int todayQna(BrdVO brdVO);
	//오늘의 답변
	public int todayAns(AnsVO ansVO);
	//누적질문수
	public int countQna(BrdVO brdVO);
	//누적답변수
	public int countAns(AnsVO ansVO);

	
	//댓글기능
	//댓글 총 개수 
	public int cmtCount(String ansId);
	//댓글 상세보기
	public List<CmtVO> cmtDetail(CmtVO cmtVO);
	//댓글 작성
	public int cmtWrite(CmtVO cmtVO);
	//댓글 수정
	public int cmtUpdate(CmtVO cmtVO);	
	//댓글 삭제
	public int cmtDelete(CmtVO cmtVO);
	
	
	//좋아요 기능
	//좋아요 확인
	public int findLike(LikeBrdVO likeBrdVO);
	//좋아요 활성화
	public int likeBrd(LikeBrdVO likeBrdVO);
	//좋아요 비활성화
	public int dislikeBrd(LikeBrdVO likeBrdVO);
	
}
