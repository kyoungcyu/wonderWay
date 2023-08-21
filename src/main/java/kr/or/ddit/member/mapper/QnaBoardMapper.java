package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AnsVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.LikeBrdVO;

public interface QnaBoardMapper {
	//답변 없는 질문 리스트 조회
	public List<BrdVO> qnaBoardList(Map<String, String> map);
	//답변있는 질문 리스트 조회
	public List<BrdVO> qnaBoardAnsList(Map<String, String> map);
	//질문 답변 게시판 모든 질문 리스트
	public List<BrdVO> allQnaBoardList(Map<String, String> map);
	
	//많이 본 QNA 조회
	public List<BrdVO> manyQnaList(Map<String, String> map);
	//답변 유무 조회
	public int hasAns(String brdId);
	//질문 상세보기
	public List<BrdVO> qnaBoardDetail(String brdId);
	//질문 삭제하기
	public int queDelete(String brdId);
	//답변 상세보기
	public List<AnsVO> ansDetail(String brdId);
	//질문등록하기
	public int queWrite(BrdVO brdVO);
	
	//질문답변 글 등록 - 첨부파일
	public int attachInsert(AttachVO attachVO);
	//질문답변 글 등록 - 첨부파일_상세
	public int attachDeInsert(List<AttachDeVO> attachDeVOlist);
	//질문답변 글 등록 - 첨부파일 아이디 update
	public int attachIdUpdate(BrdVO brdVO);
	
	//질문 수정하기
	public int qnaUpdate(BrdVO brdVO);
	public int attachDeBefUpdate(BrdVO brdVO);
	//첨부파일 상세 아이디는 그대로 파일 정보 업데이트
	public int attachDeUpdate(List<AttachDeVO> attachDeVOlist);
	
	/**
	 * 답변기능
	 * @param ansVO
	 * @return
	 */
	//답변 등록하기
	public int ansWrite(AnsVO ansVO);
	//답변 삭제하기
	public int ansDelete(String ansId);
	public int ansCmtDelete(String ansId);
	
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
	
	/**
	 * 댓글 기능
	 */
	//1. 댓글 작성
	public int cmtWrite(CmtVO cmtVO);
	//2. 댓글 수정
	public int cmtUpdate(CmtVO cmtVO);
	//3. 댓글 삭제
	public int cmtDelete(CmtVO cmtVO);
	//4. 댓글 조회
	public List<CmtVO> cmtDetail(CmtVO cmtVO);
	//5.댓글 개수 조회
	public int cmtCount(String ansId);
	
	
	/**
	 * 게시물 좋아요 기능
	 * @param likeBrdVO
	 */
	//게시물 좋아요 기능
	//좋아요 버튼 눌렀는지 확인
	public int findLike(LikeBrdVO likeBrdVO);
	//게시물 좋아요 클릭
	public int likeBrd(LikeBrdVO likeBrdVO);
	public int insertBrd(LikeBrdVO likeBrdVO);
	//좋아요 한번 더 클릭시 비활성화
	public int dislikeBrd(LikeBrdVO likeBrdVO);
	public int deleteBrd(LikeBrdVO likeBrdVO);
	
	
}
