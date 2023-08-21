package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdReviewListVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;

public interface AdRvwMapper {
	/**
	 * 리뷰 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<AdReviewListVO> rvwList(Map<String, String> map);
	
	/**
	 * 리뷰 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int rvwTotal(Map<String,String> map);
	
	/**
	 * 리뷰 차단
	 * @param adReviewListVO 예약ID, 차단여부
	 * @return
	 */
	public int blindRvw(AdReviewListVO adReviewListVO);
}








