package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdadVO;
import kr.or.ddit.vo.AdvListVO;
import kr.or.ddit.vo.AdvReqListVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RcmLocVO;
import kr.or.ddit.vo.TourVO;

public interface AdTourMapper {
	// 여행지 목록
	public List<TourVO> tourList(Map<String, String> map);
	
	// 여행지 총 데이터 개수
	public int getTotal(Map<String, String> map);
	
	// 여행지 신규 등록
	public int tourReg(TourVO tourVO);
	
	// 여행지 사진 첨부 파일 처리
	public int attachInsert(AttachVO attachVO);

	// 여행지 사진 첨부 파일 상세 처리
	public int attachDeInsert(List<AttachDeVO> attachDeVOlist);
	
	// 등록된 여행지 이미지 경로 가져오기
	public String getImgPath(String tourId);
	
	// 여행지 상세 정보
	public TourVO tourDetail(String tourId);
	
	// 여행지 삭제
	public int tourDel(String tourId);
	
	// 여행지 첨부 파일 삭제
	public int tourAttachDel(String tourId);
	
	// 여행지 목록 엑셀 등록
	public int insertTourExcel(TourVO tourVO);
	
	// 여행지 소개 매거진 등록 시 선택할 여행지 목록
	public List<TourVO> tourListMagazine();
	
	// 여행지 소개 매거진 등록
	public int magazineRegister(BrdVO brdVO);
	
	// 여행지 소개 매거진 첨부 파일 등록
	public int attachInsertMagazine(AttachVO attachVO);
	
	// 여행지 소개 매거진 attachId 갱신
	public int attachIdUpdateMagazine(BrdVO brdVO);
	
	// 여행지 소개 매거진 목록
	public List<BrdVO> tourMagazineList(Map<String, String> map);
	
	// 여행지 소개 매거진 상세
	public BrdVO tourMagazineDetail(String brdId);
	
	// 여행지 소개 매거진 총 데이터 수
	public int getTotalMagazine(Map<String, String> map);
	
	// 여행후기 글 수정
	public int magazineUpdate(BrdVO brdVO);
	
	// 여행지 소개 매거진 첨부 파일 삭제
	public int attachDeBefUpdate(BrdVO brdVO);

	// 첨부파일 상세 아이디는 그대로 파일 정보 업데이트
	public int attachDeUpdate(List<AttachDeVO> attachDeVOlist);
	
	// 여행지 소개 매거진 첨부 파일 상세 DB 삭제
	public int magazineDeleteAtcDe(String attachId);
	
	// 여행지 소개 매거진 첨부 파일 DB 삭제
	public int magazineDeleteAtc(String attachId);
	
	// 여행지 소개 매거진 삭제
	public int magazineDeleteBrd(String attachId);
}
