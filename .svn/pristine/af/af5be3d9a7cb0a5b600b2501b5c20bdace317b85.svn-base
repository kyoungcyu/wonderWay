package kr.or.ddit.admin.service;

import java.util.List;

import java.util.Map;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.TourVO;

public interface AdTourService {
	// 여행지 목록
	public List<TourVO> tourList(Map<String, String> map);

	// 여행지 총 데이터 개수
	public int getTotal(Map<String, String> map);
	
	// 여행지 신규 등록
	public int tourReg(TourVO tourVO);
	
	// 등록된 여행지 이미지 경로 가져오기
	public String getImgPath(String tourId);
	
	// 여행지 상세 정보
	public TourVO tourDetail(String tourId);
	
	// 여행지 삭제
	public int tourDel(String tourId);
	
	// 여행지 목록 엑셀 등록
	public int insertTourExcel(TourVO tourVO);

	// 여행지 소개 매거진 등록 시 선택할 여행지 목록
	public List<TourVO> tourListMagazine();
	
	// 여행지 소개 매거진 등록
	public int magazineRegister(BrdVO brdVO);
	
	// 여행지 소개 매거진 목록
	public List<BrdVO> tourMagazineList(Map<String, String> map);
	
	// 여행지 소개 매거진 상세
	public BrdVO tourMagazineDetail(String brdId);
	
	// 여행지 소개 매거진 총 데이터 수
	public int getTotalMagazine(Map<String, String> map);
	
	// 여행후기 글 수정
	public int magazineUpdate(BrdVO brdVO);
	
	// 여행지 소개 매거진 삭제
	public int magazineDelete(String attachId);
}
