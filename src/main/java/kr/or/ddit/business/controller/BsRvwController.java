package kr.or.ddit.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.business.service.BsRvwService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RvwVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/business/review")
@Controller
public class BsRvwController {
	
	
	@Autowired
	BsRvwService bsRvwService;
	
	
	@GetMapping("/bsReview") // 리뷰 페이지
	public String bsReview(Model model, HttpSession session 
			,@RequestParam(value = "currentPage", required = false, defaultValue = "1")
							int currentPage) {
		
		// 1. 맵선언해서 페이징처리 파라미터와 원래파라미터 넣기
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		String busiId = busiVO.getBusiId();
		reviewMap.put("busiId",busiId);
		reviewMap.put("currentPage",currentPage);
		
		// list (+페이징처리값까지) 받아오기
		List<RvwVO> rvwList= bsRvwService.selectRvw(reviewMap);
		
		// totalRvw
		String totalRvw= bsRvwService.totalRvw(busiId);
		model.addAttribute("totalRvw", totalRvw);
		int totalRvwInt = Integer.parseInt(totalRvw);
		
		// 페이징처리까지한 list보내기
		model.addAttribute("rvwList", new PagingDTO<RvwVO>(totalRvwInt, currentPage, 5, rvwList));
		
		// totalCmt
		String totalCmt= bsRvwService.totalCmt(busiId);
		model.addAttribute("totalCmt", totalCmt);
		
		// totalBlind
		String totalBlind= bsRvwService.totalBlind(busiId);
		model.addAttribute("totalBlind", totalBlind);
		
		// averStar
		String averageStar= bsRvwService.averageStar(busiId);
		model.addAttribute("averageStar", averageStar);

		return "business/review/bsReview";
	}
	
	@ResponseBody
	@PostMapping("/rvwBlindOn") 
	public ResponseEntity<Integer> rvwBlindOn(@RequestBody RvwVO rvwVO) {
		
		String rsvId = rvwVO.getRsvId();
		int cnt = bsRvwService.updateBlind(rsvId);
		
		return ResponseEntity.ok(cnt);
	}
	
	@ResponseBody
	@PostMapping("/rvwBlindOff")
	public ResponseEntity<Integer> rvwBlindOff(@RequestBody RvwVO rvwVO) {
		
		String rsvId = rvwVO.getRsvId();
		int cnt = bsRvwService.deleteBlind(rsvId);
		
		return ResponseEntity.ok(cnt);
	}
	
	@ResponseBody
	@PostMapping("/insertCmt") 
	public ResponseEntity<Integer> insertCmt(@RequestBody RvwVO rvwVO) {
		
		int cnt = bsRvwService.insertCmt(rvwVO);
		
		return ResponseEntity.ok(cnt);
	}

	
	@GetMapping("/blind") // 리뷰 페이지
	public String selectBlind(Model model, HttpSession session 
			,@RequestParam(value = "currentPage", required = false, defaultValue = "1")
							int currentPage) {
		
		// 1. 맵선언해서 페이징처리 파라미터와 원래파라미터 넣기
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		String busiId = busiVO.getBusiId();
		reviewMap.put("busiId",busiId);
		reviewMap.put("currentPage",currentPage);
		
		// list (+페이징처리값까지) 받아오기
		List<RvwVO> blindList= bsRvwService.selectBlind(reviewMap);
		
		// totalBlind
		String totalBlind= bsRvwService.totalBlind(busiId);
		model.addAttribute("totalRvw", totalBlind);
		int totalBlindInt = Integer.parseInt(totalBlind);
		
		// 페이징처리까지한 list보내기
		model.addAttribute("rvwList", new PagingDTO<RvwVO>(totalBlindInt, currentPage, 5, blindList));
		
		return "business/review/blind";
	}
	
	
	
	@GetMapping("/noCmt") // 리뷰 페이지
	public String selectNoCmt(Model model, HttpSession session 
			,@RequestParam(value = "currentPage", required = false, defaultValue = "1")
	int currentPage) {
		
		// 1. 맵선언해서 페이징처리 파라미터와 원래파라미터 넣기
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		BusiVO busiVO = (BusiVO) session.getAttribute("vo");
		String busiId = busiVO.getBusiId();
		reviewMap.put("busiId",busiId);
		reviewMap.put("currentPage",currentPage);
		
		// list (+페이징처리값까지) 받아오기
		List<RvwVO> noCmtList= bsRvwService.selectNoCmt(reviewMap);
		
		// totalRvw
		String totalRvw= bsRvwService.totalRvw(busiId);
		String totalCmt= bsRvwService.totalCmt(busiId);
		model.addAttribute("totalRvw", totalRvw);
		int totalNoCmtInt = Integer.parseInt(totalRvw) - Integer.parseInt(totalCmt);
		
		// 페이징처리까지한 list보내기
		model.addAttribute("rvwList", new PagingDTO<RvwVO>(totalNoCmtInt, currentPage, 5, noCmtList));
		
		return "business/review/noCmt";
	}
	
	
	
}
