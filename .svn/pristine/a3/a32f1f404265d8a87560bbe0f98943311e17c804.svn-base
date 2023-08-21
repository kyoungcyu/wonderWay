package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RsvListVO;
import kr.or.ddit.vo.RsvVO;

public interface AdMemMapper {
	/**
	 * 전체 회원 목록
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<MemVO> memList(Map<String,String> map);
	
	/**
	 * 회원 상세
	 * @param memVO 회원ID
	 * @return
	 */
	public MemVO memDetail(MemVO memVO);
	
	/**
	 * 회원 수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int memTotal(Map<String,String> map);
	
	/**
	 * 회원 작성 게시글
	 * @param memVO 회원ID
	 * @return
	 */
	public List<BrdVO> memBrdList(MemVO memVO);

	/**
	 * 부적절 회원 관리
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public List<BrdVO> brdReprtList(Map<String, String> map);
	
	/**
	 * 미처리 신고수
	 * @param map 검색어, 정렬, 현재 페이지, 한 페이지에 보여질 개수
	 * @return
	 */
	public int brdReptTotal(Map<String,String> map);
	
	/**
	 * 회원 경고 상태
	 * @param memVO 회원ID, 경고 상태
	 * @return
	 */
	public int updateWarningStatus(MemVO memVO);
	
	/**
	 * 회원 경고 개수 증가
	 * @param memVO 회원ID, 경고 개수
	 * @return
	 */
	public int updateWarningCnt(MemVO memVO);
	
	/**
	 * 차단 회원 등록
	 * @param map 회원ID, 차단이유
	 * @return
	 */
	public int insertInrtMem(Map<String, String> map);
	
	/**
	 * 차단 회원 등록 삭제
	 * @param map 회원ID
	 * @return
	 */
	public int deleteIntrMem(Map<String, String> map);
	
	/**
	 * 예약 완료
	 * @param map 회원ID, 예약상태코드
	 * @return
	 */
	public List<RsvListVO> rsvList(Map<String, String> map);
	
	/**
	 * 채팅 회원 목록
	 * @return
	 */
	public List<MemVO> chatMemList();
	
	/**
	 * 전체 회원 엑셀 다운로드
	 * @return
	 */
	public List<MemVO> excelList();
	
	/**
	 * 활성 회원수
	 * @return
	 */
	public int enableMem();
	
	/**
	 * 비활성 회원수
	 * @return
	 */
	public int disableMem();
	
	/**
	 * 브론즈 회원수
	 * @return
	 */
	public int bronze();
	
	/**
	 * 실버 회원수
	 * @return
	 */
	public int silver();
	
	
	/**
	 * 골드 회원수
	 * @return
	 */
	public int gold();
	
	/**
	 * 다이아 회원수
	 * @return
	 */
	public int dia();
	
	/**
	 * 2차 인증
	 * @return
	 */
	public int second(Map<String, String> map);
}








