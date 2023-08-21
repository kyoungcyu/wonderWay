package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;

public interface AdBrdService {

	/**
	 * 게시판 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<BrdVO> brdList(Map<String, String> map);
	
	/**
	 * 게시글 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int brdTotal(Map<String,String> map);
	
	/**
	 * 공지사항 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<BrdVO> brdNotice(Map<String, String> map);
	
	/**
	 * 공지글 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int noticeTotal(Map<String,String> map);
	
	/**
	 * 공지사항 작성
	 * @param brdVO 제목, 내용, 작성자
	 * @return
	 */
	public int noticeRegistration(BrdVO brdVO);
	
	/**
	 * 공지사항 작성 - 첨부파일
	 * @param attachVO
	 * @return
	 */
	public int attachInsert(AttachVO attachVO);
	
	/**
	 * 공지사항 작성 - 첨부파일_상세
	 * @param attachDeVOlist
	 * @return
	 */
	public int attachDeInsert(List<AttachDeVO> attachDeVOlist);
	
	/**
	 * 공지사항 작성 - 첨부파일 아이디 update
	 * @param brdVO
	 * @return
	 */
	public int attachIdUpdate(BrdVO brdVO);
	
	/**
	 * 공지사항 공지 상태 변경
	 * @param brdVO 게시글ID
	 * @return
	 */
	public int noticeIntr(BrdVO brdVO);
	
	/**
	 * 공지사항 삭제
	 * @param brdVO 게시글ID
	 * @return
	 */
	public int noticeDelete(BrdVO brdVO);
	
	/**
	 * 게시글 상세
	 * @param brdVO 게시글ID
	 * @return
	 */
	public BrdVO brdSelect(BrdVO brdVO);
	
	/**
	 * 공지사항 수정 진행
	 * @param brdVO 제목, 내용, 수정자
	 * @return
	 */
	public int noticeModifyPost(BrdVO brdVO);
	
	/**
	 * 게시물 신고 확인
	 * @param brdVO 게시글ID
	 * @return
	 */
	public int reprtCk(BrdVO brdVO);
	
	/**
	 * 게시글 차단상태 변경
	 * @param brdVO 개시글ID, 차단상태, 차단이유
	 * @return
	 */
	public int blindBrd(BrdVO brdVO);
	
	/**
	 * 고객 문의 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<BrdVO> inquiryList(Map<String, String> map);
	
	/**
	 * 게시글 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int inqTotal(Map<String,String> map);
	
	/**
	 * 고객 문의 답변 작성
	 * @param brdId 게시글ID
	 * @return
	 */
	public int inquiryAnswer(String brdId);
}
