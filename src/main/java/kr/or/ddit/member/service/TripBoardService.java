package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.LikeBrdVO;
import kr.or.ddit.vo.TourVO;

public interface TripBoardService {
	
	//여행후기 메인 - 최근순 정렬
	public List<BrdVO> tripRecList(Map<String, String> map);
	//여행후기 메인 - 인기순 정렬
	public List<BrdVO> tripLikeList(Map<String, String> map);
	//여행후기 글 목록
	public List<BrdVO> tripBoardList(Map<String, String> map);
	
	//여행후기 글 상세보기
	public BrdVO tripDetail(BrdVO brdVO);
	//조회수 기능
	public int tripViewCnt(String brdId);
	//첨부파일 가져오기
	public String savePath(String brdId);
	
	
	//여행후기 글 등록하기
	public int tripAddWrite(BrdVO brdVO);
	//여행지 목록 불러오기
	public List<TourVO> tourList(Map<String, String> map);
	//여행지명 가져오기
	public String tourNm(String tourId);
	//여행후기 글 수정
	public int tripUpdate(BrdVO brdVO);
	//여행후기 글 삭제
	public int tripDelete(BrdVO brdVO);
	
	
	//좋아요 기능
	//좋아요 확인
	public int findLike(LikeBrdVO likeBrdVO);
	//좋아요 활성화
	public int likeBrd(LikeBrdVO likeBrdVO);
	//좋아요 비활성화
	public int dislikeBrd(LikeBrdVO likeBrdVO);
	
	
	//총 게시글 수
	public int countBoard(Map<String,String> map);

	//글 신고 기능
	public int tripReprt(BrdVO brdVO);
	
	
	//댓글기능
	//댓글 총 개수 
	public int cmtCount(String brdId);
	//댓글 상세보기
	public List<CmtVO> cmtDetail(String brdId);
	//댓글 작성
	public int cmtWrite(CmtVO cmtVO);
	//댓글 수정
	public int cmtUpdate(CmtVO cmtVO);	
	//댓글 삭제
	public int cmtDelete(CmtVO cmtVO);
	
	//대댓글기능
	//대댓글 상세보기
	public List<CmtVO> replyDetail(String cmtId);	
	//대댓글 작성
	public int replyWrite(CmtVO cmtVO);
	//대댓글 조회
	public int repCmtCount(String repCmtId);
	
	
	// 여행지 매거진
	
	// 매거진 목록
	public List<BrdVO> magazineList(Map<String, String> map);
	
	// 매거진 상세
	public BrdVO magazineDetail(String brdId);
	
	// 매거진 총 개수
	public int getTotalMagazine(Map<String, String> map);
}
