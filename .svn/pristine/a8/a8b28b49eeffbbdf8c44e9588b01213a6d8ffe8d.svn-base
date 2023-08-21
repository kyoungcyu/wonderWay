package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdReviewListVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.FaqVO;

public interface AdFaqMapper {
	/**
	 * FAQ 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<FaqVO> faqList(Map<String, String> map);
	
	/**
	 * FAQ 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int faqTotal(Map<String,String> map);
	
	/**
	 * FAQ 작성
	 * @param faqVO 제목, 질문코드, 답변
	 * @return
	 */
	public int faqRegistration(FaqVO faqVO);
	
	/**
	 * FAQ 선택
	 * @param faqVO 게시글ID
	 * @return
	 */
	public FaqVO faqSelect(FaqVO faqVO);
	
	/**
	 * FAQ 수정
	 * @param faqVO 게시글ID, 제목, 질문코드, 답변
	 * @return
	 */
	public int faqModifyPost(FaqVO faqVO);
	
	/**
	 * FAQ 삭제
	 * @param faqVO 게시글ID
	 * @return
	 */
	public int faqDelete(FaqVO faqVO);
}








