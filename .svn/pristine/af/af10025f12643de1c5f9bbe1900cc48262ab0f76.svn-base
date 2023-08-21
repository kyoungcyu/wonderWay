package kr.or.ddit.member.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.mapper.MmAcmMapper;
import kr.or.ddit.member.mapper.MmMemMapper;
import kr.or.ddit.member.service.MmAcmService;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

@Service
public class MmAcmServiceImpl implements MmAcmService {

	@Inject
	MmAcmMapper mmAcmMapper;
	
	@Inject
	MmMemMapper mmMemMapper;

	//숙소 검색-체크인날짜,인원,방개수로 - 기본정렬 최근인기순
	@Override
	public List<BusiVO> searchAcm(Map<String, String> map) {

		return this.mmAcmMapper.searchAcm(map);
	}

	
	//숙소검색-숙소명으로
	@Override
	public List<BusiVO> searchForName(Map<String, String> map) {

		return this.mmAcmMapper.searchForName(map);
	}
	

	//숙소 총개수 -체크인날짜,인원,방개수로
	@Override
	public List<BusiVO> getTotalAcm(Map<String, String> map) {
		
		return this.mmAcmMapper.getTotalAcm(map);
	}
	
	//숙소 총개수-숙소명으로 
	@Override
	public List<BusiVO> getTotalAcmNm(Map<String, String> map) {
		
		return this.mmAcmMapper.getTotalAcmNm(map);
	}
	
	//상단광고 리스트
	@Override
	public List<BusiVO> getTopAd(String busiLoc){
		
		return this.mmAcmMapper.getTopAd(busiLoc);
		
	}
	
	//방 최대값 가져오기
	@Override
	public int getMaxRmPr(Map<String, String> map) {
		
		return this.mmAcmMapper.getMaxRmPr(map);
	}

	
	//검색 필터
	@Override
	public List<BusiVO> searchFilter( Map<String, Object> map) {

		return 	this.mmAcmMapper.searchFilter(map);
	}
	
	
	//필터 결과 총개수
	@Override
	public List<BusiVO> getTotalFilter(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mmAcmMapper.getTotalFilter(map);
	}
	
	
	//숙소 상세페이지
	@Override
	public BusiVO detailAcm(BusiVO busiVO) {

		return this.mmAcmMapper.detailAcm(busiVO);
	}
	
	
	//아동,펫,장애인,흡연 여부 
	@Override
	public Map<String, String> availKPDS(String busiId) {
		
		return this.mmAcmMapper.availKPDS(busiId);
	}
	
	
	//이미지 가져오기
	@Override
	public List<AttachDeVO> getImg(String busiId) {
		
		return this.mmAcmMapper.getImg(busiId);
	}
		
	//편의시설 가져오기
	@Override
	public List<CvfcVO> getCvfc(String busiId) {
		
		return this.mmAcmMapper.getCvfc(busiId);
	}
	

	//예약가능 객실 가져오기
	@Override
	public List<RmVO> getRm(Map<String, String> map) {

		return this.mmAcmMapper.getRm(map);
	}
	
	
	//예약된 객실 가져오기
	@Override
	public List<RmVO> getReservedRm(Map<String, String> map) {

		return this.mmAcmMapper.getReservedRm(map);
	}

	
	//방 상세정보
	@Override
	public List<RmVO> rmDetail(String rmId) {

		return this.mmAcmMapper.rmDetail(rmId);
	}

	
	// 리뷰 가져오기
	@Override
	public List<RvwVO> getRvw(Map<String, String> map) {

		return this.mmAcmMapper.getRvw(map);
	}

	//리뷰 비율 
	@Override
	public Map<String, Double> getRvwRatio(String busiId) {
		
		return this.mmAcmMapper.getRvwRatio(busiId);
	}

	
	// 리뷰 총개수
	@Override
	public int getTotalRvw(String busiId) {
		
		return this.mmAcmMapper.getTotalRvw(busiId);
	}

	
	//예약정보 넘겨주기
	@Override
	public BusiVO rsvInfo(Map<String, String> map) {
		
		return this.mmAcmMapper.rsvInfo(map);
	}
	
	
	//로그인한 회원정보 가져오기 
	@Override
	public MemVO getMemInfo(String memId) {
		return this.mmMemMapper.getMemInfo(memId);
	}


	//비회원 예약시 테이블에 인서트
	@Override
	public int insertGuestRsv(Map<String, String> map) {

		return this.mmAcmMapper.insertGuestRsv(map);
	}

	
	//회원 예약시 테이블에 인서트
	@Override
	public int insertMemRsv(Map<String, String> map) {

		return this.mmAcmMapper.insertMemRsv(map);
	}

	
	//쿠폰상태 변경  
	@Override
	public int changeCupnInfo(Map<String, String> map) {
		
		return this.mmAcmMapper.changeCupnInfo(map);
	}


	//마일리지 상태 변경 
	@Override
	public int changeMlg(Map<String, String> map) {
		
		return this.mmAcmMapper.changeMlg(map);
	}

	//쪽지 보내기 위한 업체id가져오기
	@Override
	public String getId(String busiNm) {
		return this.mmAcmMapper.getId(busiNm);
	}
	
	//쪽지 보내기
	@Override
	public int msgInsert(MsgVO msgVO) {
		return this.mmAcmMapper.msgInsert(msgVO);
	}


	




	

	
	
	





	

}
