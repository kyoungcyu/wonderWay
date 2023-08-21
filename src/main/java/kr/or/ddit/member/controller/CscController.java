package kr.or.ddit.member.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.service.CscService;
import kr.or.ddit.member.service.TripBoardService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.CmtVO;
import kr.or.ddit.vo.FaqVO;
import kr.or.ddit.vo.MemVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/csc")
@Controller
public class CscController {
	
	@Autowired
	CscService cscService;
	
	@Autowired
	TripBoardService tripBoardService;
	
	//고객센터 메인 페이지
	@GetMapping("/main")
	private String main() {
		return "member/csc/cscMain";
	}
	
	/**
	 * 고객센터-공지사항 목록 리스트
	 * @param model
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@GetMapping("/cscNoticeList")
	private String cscNoticeList(Model model, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("keyword", keyword);
	    map.put("currentPage", Integer.toString(currentPage));
	    int size = 20;
	    map.put("size", String.valueOf(size));
	    log.info("map : " + map);
	    
		List<BrdVO> noticeList = this.cscService.cscNoticeList(map);
		log.info("noticeList : " + noticeList);
		
		int total = this.cscService.cscNoticeTotal(map);
		log.info("total : " + total);
		
		PagingDTO<BrdVO> noticePage = new PagingDTO<BrdVO>(total, currentPage, size, noticeList);
		
		log.info("noticePage : " + noticePage);
		
		model.addAttribute("data", noticePage);
		
		return "member/csc/cscNoticeList";
	}	
	
	/**
	 * 고객센터-공지사항 상세 페이지
	 * @param brdId
	 * @param model
	 * @param cmtId
	 * @param brdVO
	 * @param principal
	 * @param map
	 * @param attachDeVO
	 * @return
	 */
	@GetMapping("/cscNoticeDetail")
	private String cscNoticeDetail(@RequestParam("brdId") String brdId, Model model, String cmtId,
			BrdVO brdVO, Principal principal, Map<String , String> map, AttachDeVO attachDeVO) {
		log.info("brdId : " + brdId);
		
		//조회수
		this.cscService.noticeCnt(brdId);
		brdVO.setBrdId(brdId);
		
		//공지사항 상세
		BrdVO notice = this.cscService.cscNoticeDetail(brdVO);
		log.info("notice : " + notice);
		model.addAttribute("notice", notice);
		
		String memId = principal.getName();
		log.info("memId : " + memId);
		model.addAttribute("memId",memId);
		
		//좋아요
		map.put("memId", memId);
		map.put("brdId", brdId);
		int checkLikeBrd = this.cscService.checkLikeBrd(map);
		model.addAttribute("checkLikeBrd",checkLikeBrd);
		log.info("checkLikeBrd : " + checkLikeBrd);
		
		//첨부파일
		attachDeVO = this.cscService.savePath(brdVO);
		String savePath = attachDeVO.getSavePath();
		String fileName = savePath.substring(savePath.lastIndexOf("_") + 1);
		long fileSz  = attachDeVO.getFileSz() / 1024;
		log.info("fileName : " + fileName);
		model.addAttribute("savePath",savePath);
		model.addAttribute("fileName",fileName);
		model.addAttribute("fileSz",fileSz);
		
		//댓글 내용 불러오기
		List<CmtVO> cmtList = this.tripBoardService.cmtDetail(brdId);
		model.addAttribute("cmtList", cmtList);
		
		//대댓글 내용 불러오기
		List<CmtVO> repCmtList = this.tripBoardService.replyDetail(cmtId);
		model.addAttribute("repCmtList", repCmtList);
		log.info("repCmtList : "+ repCmtList);
		
	
		//댓글 수 조회하기
		int cmtCount = this.tripBoardService.cmtCount(brdId);
		model.addAttribute("cmtCount",cmtCount);
		log.info("cmtCount : "+ cmtCount);
		
		return "member/csc/cscNoticeDetail";
	}
	
	/**
	 * FAQ 목록
	 * @param faqVO
	 * @param model
	 * @return
	 */
	@GetMapping("/faq")
	public String faq(FaqVO faqVO, Model model) {
		faqVO.setFaqCode("F01");
		List<FaqVO> f01List = this.cscService.faq(faqVO);
		model.addAttribute("f01List",f01List);
		
		faqVO.setFaqCode("F02");
		List<FaqVO> f02List = this.cscService.faq(faqVO);
		model.addAttribute("f02List",f02List);
		
		faqVO.setFaqCode("F03");
		List<FaqVO> f03List = this.cscService.faq(faqVO);
		model.addAttribute("f03List",f03List);
		
		faqVO.setFaqCode("F04");
		List<FaqVO> f04List = this.cscService.faq(faqVO);
		model.addAttribute("f04List",f04List);
		
		faqVO.setFaqCode("F05");
		List<FaqVO> f05List = this.cscService.faq(faqVO);
		model.addAttribute("f05List",f05List);
		
		faqVO.setFaqCode("F06");
		List<FaqVO> f06List = this.cscService.faq(faqVO);
		model.addAttribute("f06List",f06List);
		
		return "member/csc/faq";
	}
	
	//고객센터 상담/채팅
	@GetMapping("/counseling")
	public String cscCounseling(Model model, Principal principal) {
		String id = principal.getName();
		model.addAttribute("id",id);
		
		return "member/csc/counseling";
	}
	
	//고객 문의
	@GetMapping("/inquiry")
	public String cscInquiry(Model model, Principal principal,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		
		
		Map<String, String> map = new HashMap<String, String>();
		String frstWrtr = principal.getName();
		map.put("frstWrtr", frstWrtr);
	    map.put("keyword", keyword);
	    map.put("currentPage", Integer.toString(currentPage));
	    int size = 20;
	    map.put("size", String.valueOf(size));
	    log.info("map : " + map);
	    
		List<BrdVO> inquiryList = this.cscService.inquiryList(map);
		log.info("inquiryList : " + inquiryList);
		
		int total = this.cscService.inquiryTotal(map);
		log.info("total : " + total);
		
		PagingDTO<BrdVO> inquiryPage = new PagingDTO<BrdVO>(total, currentPage, size, inquiryList);
		
		log.info("inquiryPage : " + inquiryPage);
		
		model.addAttribute("data", inquiryPage);	
		
		return "member/csc/inquiry";
	}
	
	//고객문의 상세
	@GetMapping("/inquiryDetail")
	public String inquiryDetail(@RequestParam("brdId") String brdId, Model model, String cmtId,
			BrdVO brdVO, Principal principal, Map<String , String> map) {
		String memId = principal.getName();
		model.addAttribute("memId",memId);
		
		map.put("brdId", brdId);
		
		//고객문의 상세
		BrdVO inquiry = this.cscService.inquiryDetail(map);
		model.addAttribute("inquiry", inquiry);
		
		
		//댓글 내용 불러오기
		List<CmtVO> cmtList = this.tripBoardService.cmtDetail(brdId);
		model.addAttribute("cmtList", cmtList);
		
		//대댓글 내용 불러오기
		List<CmtVO> repCmtList = this.tripBoardService.replyDetail(cmtId);
		model.addAttribute("repCmtList", repCmtList);
		
		return "member/csc/inquiryDetail";
	}
	
	//고객문의 작성
	@GetMapping("/inquiryRegistration")
	public String inquiryRegistration() {
		return "member/csc/inquiryRegistration";
	}
	
	//고객문의 등록
	@PostMapping("/inquiryRegistrationPost")
	public String inquiryRegistrationPost(@ModelAttribute("brdVO") BrdVO brdVO) {
		
		int result = this.cscService.inquiryRegistrationPost(brdVO);
		log.info("result : " + result);
		
		if (result > 0) {
			return "redirect:/member/csc/inquiry";
		} else {
			return "redirect:/member/csc/inquiryRegistration";
		}
		
	}
	
	//고객문의 수정
	@GetMapping("/inquiryModify")
	public String inquiryModify(@RequestParam("brdId") String brdId, BrdVO brdVO, Model model, Map<String, String> map) {
		map.put("brdId", brdId);
		
		brdVO = this.cscService.inquiryDetail(map);
		model.addAttribute("brdVO", brdVO);
		
		return "member/csc/inquiryModify";
	}
	
	//고객문의 수정 진행
	@PostMapping("/inquiryModifyPost")
	public String noticeModifyPost(@ModelAttribute("brdVO") BrdVO brdVO) {
		log.info("brdVO : " + brdVO);
		String brdId = brdVO.getBrdId();
		
		int update = this.cscService.inquiryModifyPost(brdVO);
		
		if (update > 0) {
			return "redirect:/member/csc/inquiryDetail?brdId=" + brdId;
		} else {
			return "redirect:/member/csc/inquiryModify?brdId=" + brdId;
		}
	}
	
	//고객문의 삭제
	@PostMapping("/inquiryDelete")
	public ResponseEntity<String> inquiryDelete(@RequestBody Map<String, String> map, BrdVO brdVO) {
		String brdId = map.get("brdId");
		brdVO.setBrdId(brdId);
		
		int delete = this.cscService.inquiryDelete(brdVO);
		log.info("delete : " + delete);
		
		if (delete == 1) {
			return ResponseEntity.ok("success");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}
}





