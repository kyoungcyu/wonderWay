package kr.or.ddit.member.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

public interface MmAcmMapper {
	
	//숙소검색-체크인날짜,인원,방개수로
	//<select id="searchAcm" parameterType="hashMap" resultType="BusiVO">
	public List<BusiVO> searchAcm(Map<String, String> map);
	
	//숙소검색-숙소명으로
	//<select id="searchForName" parameterType="hashMap" resultType="BusiVO">
	public List<BusiVO> searchForName(Map<String, String> map);
	
	
	//숙소 총개수
	//<select id="getTotalAcm" parameterType="hashMap" resultMap="busiMap">
	public List<BusiVO> getTotalAcm(Map<String, String> map);
	
	//숙소 총개수
	//<select id="getTotalAcmNm" parameterType="hashMap" resultMap="busiMap">
	public List<BusiVO> getTotalAcmNm(Map<String, String> map);

	
	//상단광고 노출
	public List<BusiVO> getTopAd(String busiLoc);
	
	
	//방 최대값 가져오기
	//	<select id="getMaxRmPr" parameterType="hashMap" resultType="int">
	public int getMaxRmPr(Map<String, String> map);
	
	
	
	//검색필터
	//<select id="searchFilter" parameterType="hashMap" resultMap="busiMap">
	public List<BusiVO> searchFilter(Map<String, Object> map);
	
	
	//필터 결과 총개수
	//<select id="getTotalFilter" parameterType="hashMap" resultMap="busiMap">
	public List<BusiVO> getTotalFilter(Map<String, Object> map);


	//숙소 상세 페이지
	//<select id="detailAcm" parameterType="busiVO" resultType="busiVO">
	public BusiVO detailAcm(BusiVO busiVO);
	
	
	//<!--숙소 이미지  -->
	//	<select id="getImg" parameterType="String" resultType="attachDeVO">
	public List<AttachDeVO> getImg(String busiId);

	
	
	//편의시설 가져오기
	//<select id="getRoom" parameterType="hashMap" resultType="rmVO">
	public List<CvfcVO> getCvfc(String busiId);
	
	//아동,펫,장애인,흡연 여부 
	//<select id="existKPDS" parameterType="String" resultType="hashMap">
	public Map<String, String> availKPDS(String busiId);


	//객실 가져오기
	//<select id="getRoom" parameterType="hashMap" resultType="busiVO">
	public List<RmVO> getRm(Map<String, String> map);
	
	//예약된 객실 가져오기
	//<select id="getReservedRm" parameterType="hashMap" resultMap="rmMap">
	public List<RmVO> getReservedRm(Map<String, String> map);
	
	//방 상세정보
	//<select id="rmDetail" parameterType="String" resultMap="rmMap">
	public List<RmVO> rmDetail(String rmId);

	//리뷰 가져오기-페이징처리
	public List<RvwVO> getRvw(Map<String, String> map);
	
	
	//리뷰 별점 비율 
	//<select id="getRvwRatio" parameterType="String" resultType="hashMap">
	public Map<String, Double> getRvwRatio(String busiId);
	
	
	//리뷰 총개수 
	public int getTotalRvw(String busiId);

	//예약정보 넘겨주기
	//<select id="rsvInfo" parameterType="hashMap" resultMap="busiMap">
	public BusiVO rsvInfo(Map<String, String> map);
	
	
	//비회원 예약시 테이블에 인서트
	//<insert id="insertGuestRsv" parameterType="hashMap">
	public int insertGuestRsv(Map<String, String> map);
	
	//회원 예약시 테이블에 인서트
	//<insert id="insertMemRsv" parameterType="hashMap">
	public int insertMemRsv(Map<String, String> map);

	
	//쿠폰상태 변경  
	//<update id="changeCupnInfo" parameterType="hashMap">
	public int changeCupnInfo(Map<String, String> map);
	
	
	//마일리지 상태 변경 
	//<update id="changeMlg" parameterType="hashMap">
	public int changeMlg(Map<String, String> map);

	
	//쪽지 보내기 위한 업체id가져오기
	public String getId(String busiNm);

	//쪽지 보내기
	public int msgInsert(MsgVO msgVO);

}







