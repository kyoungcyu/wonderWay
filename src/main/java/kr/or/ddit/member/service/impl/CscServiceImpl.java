package kr.or.ddit.member.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.AdAdvMapper;
import kr.or.ddit.admin.mapper.AdRsvMapper;
import kr.or.ddit.admin.service.AdAdvService;
import kr.or.ddit.admin.service.AdRsvService;
import kr.or.ddit.member.mapper.CscMapper;
import kr.or.ddit.member.service.CscService;
import kr.or.ddit.vo.AdvListVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.FaqVO;
import kr.or.ddit.vo.RsvListVO;

@Service
public class CscServiceImpl implements CscService{
	@Autowired
	CscMapper cscMapper;
	
	//공지사항 목록
	@Override
	public List<BrdVO> cscNoticeList(Map<String, String> map) {
		return this.cscMapper.cscNoticeList(map);
	};
	
	//공지사항 수
	@Override
	public int cscNoticeTotal(Map<String,String> map) {
		return this.cscMapper.cscNoticeTotal(map);
	};
	
	//공지사항 상세
	@Override
	public BrdVO cscNoticeDetail(BrdVO brdVO) {
		return this.cscMapper.cscNoticeDetail(brdVO);
	};
	
	//공지사항 조회수
	@Override
	public int noticeCnt(String brdId) {
		return this.cscMapper.noticeCnt(brdId);
	};
	
	//좋아요 체크
	@Override
	public int checkLikeBrd(Map<String, String> map) {
		return this.cscMapper.checkLikeBrd(map);
	};
	
	//공지사항 첨부파일
	@Override
	public AttachDeVO savePath(BrdVO brdVO) {
		return this.cscMapper.savePath(brdVO);
	};
	
	//자주 묻는 질문 목록
	@Override
	public List<FaqVO> faq(FaqVO faqVO){
		return this.cscMapper.faq(faqVO);
	};
	
	//본인 작성 문의 내역
	@Override
	public List<BrdVO> inquiryList(Map<String, String> map){
		return this.cscMapper.inquiryList(map);
	};
	
	//본인 작성 문의 수
	@Override
	public int inquiryTotal(Map<String,String> map) {
		return this.cscMapper.inquiryTotal(map);
	};
	
	//본인 작성 문의 상세
	@Override
	public BrdVO inquiryDetail(Map<String,String> map) {
		return this.cscMapper.inquiryDetail(map);
	};
	
	//고객문의 등록
	@Override
	public int inquiryRegistrationPost(BrdVO brdVO) {
		return this.cscMapper.inquiryRegistrationPost(brdVO);
	};
	
	//고객문의 수정 진행
	public int inquiryModifyPost(BrdVO brdVO) {
		return this.cscMapper.inquiryModifyPost(brdVO);
	};
	
	//고객문의 삭제
	@Override
	public int inquiryDelete(BrdVO brdVO) {
		return this.cscMapper.inquiryDelete(brdVO);
	};
}
