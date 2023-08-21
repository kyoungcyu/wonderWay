package kr.or.ddit.admin.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.admin.mapper.AdBrdMapper;
import kr.or.ddit.admin.mapper.AdFaqMapper;
import kr.or.ddit.admin.mapper.AdMemMapper;
import kr.or.ddit.admin.mapper.AdRvwMapper;
import kr.or.ddit.admin.service.AdBrdService;
import kr.or.ddit.admin.service.AdFaqService;
import kr.or.ddit.admin.service.AdMemService;
import kr.or.ddit.admin.service.AdRvwService;
import kr.or.ddit.util.CommonFile;
import kr.or.ddit.vo.AdReviewListVO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.FaqVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdFaqServiceImpl implements AdFaqService{
	@Autowired
	AdFaqMapper adFaqMapper;
	
	/**
	 * FAQ 목록
	 */
	@Override
	public List<FaqVO> faqList(Map<String, String> map){
		return this.adFaqMapper.faqList(map);
	};
	
	/**
	 * FAQ 수
	 */
	@Override
	public int faqTotal(Map<String,String> map) {
		return this.adFaqMapper.faqTotal(map);
	};
	
	/**
	 * FAQ 작성
	 */
	@Override
	public int faqRegistration(FaqVO faqVO) {
		return this.adFaqMapper.faqRegistration(faqVO);
	};
	
	/**
	 * FAQ 선택
	 */
	@Override
	public FaqVO faqSelect(FaqVO faqVO) {
		return this.adFaqMapper.faqSelect(faqVO);
	};
	
	/**
	 * FAQ 수정
	 */
	@Override
	public int faqModifyPost(FaqVO faqVO) {
		return this.adFaqMapper.faqModifyPost(faqVO);
	};
	
	/**
	 * FAQ 삭제
	 */
	@Override
	public int faqDelete(FaqVO faqVO) {
		return this.adFaqMapper.faqDelete(faqVO);
	};
}
