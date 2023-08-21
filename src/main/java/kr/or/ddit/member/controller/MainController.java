package kr.or.ddit.member.controller;

import java.security.Principal;
import java.text.DateFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.service.MmMemService;
import kr.or.ddit.member.service.MypageService;
import kr.or.ddit.member.service.TripBoardService;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.NonMemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MmMemService memService;

	@Autowired
	TripBoardService tripBoardService;

	@Autowired
	MypageService mypageService;

	@GetMapping
	public String home(Locale locale, Authentication authentication, HttpSession session, Model model,
			@ModelAttribute BrdVO brdVO, HttpServletRequest request, Object principal, MemVO memVO) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		if (authentication != null) {
			 //--------시큐리티가 넣어놓은 session에서 username가져오고 Httpsession에 넣는다 -------------//
			  principal =SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			  UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			  
			  log.info("session getUsername : " + userDetails.getUsername());
			  
			  String memId = userDetails.getUsername();
			  
			  //------------------ 메인 시작 --------------------// //로그인한 회원 정보 가져옴 MemVO
			  memVO = this.memService.userDetail(memId);
			  
			  //log.info("memVO : " + memVO);
			  
			  model.addAttribute("data", memVO); 
			  session.setAttribute("memVO1",memVO);//로그인한 회원의 로그인아이디 session에 저장
			  
		}
		
		 

		model.addAttribute("serverTime", formattedDate);

		// 게시글가져오기
		Map<String, String> data = new HashMap<String, String>();
		// 최근순정렬
		List<BrdVO> list = this.tripBoardService.tripRecList(data);
		// 인기순정렬
		List<BrdVO> like = this.tripBoardService.tripLikeList(data);

		// select 결과 목록을 데이터로 넣어줘서 jsp로 리턴
		model.addAttribute("list", list);
		model.addAttribute("like", like);
		model.addAttribute("brdVO", brdVO);

//		String memId = null;
//		principal = request.getUserPrincipal();
//		if (principal != null) {
//			memId = principal.getName();
//			MemVO memVO = this.mypageService.detailMyInfo(memId);
//			model.addAttribute("memVO1", memVO);
//		}

		return "member/main";
	}

	// footer
	// terms and conditions
	@GetMapping("/termsConditions")
	public String termsConditions() {
		return "member/termsConditions";
	}

	// privacy Policy
	@GetMapping("/privacyPolicy")
	public String privacyPolicy() {
		return "member/privacyPolicy";
	}

	// privacy Policy
	@GetMapping("/refundPolicy")
	public String refundPolicy() {
		return "member/refundPolicy";
	}

	@GetMapping("/nonMember")
	public String nonMember() {
		return "member/main/nonMember";
	}

	@PostMapping("/nonMemberPost")
	public ResponseEntity<String> nonMemberPost(@RequestBody Map<String, String> map, NonMemberVO nonMemberVO) {

		String email = map.get("email"); // 업체ID
		String rsvId = map.get("rsvId"); // 활성,비활성

		nonMemberVO.setGstEmail(email);
		nonMemberVO.setRsvId(rsvId);

		// 업체 활성화 or 비활성화
		nonMemberVO = this.mypageService.nonMem(nonMemberVO);
		log.info("nonMemberVO : " + nonMemberVO);
		if (nonMemberVO != null) { // 성공 시
			return ResponseEntity.ok("success");
		} else { // 실패 시
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("failure");
		}
	}

	@GetMapping("/nonMemberRsv")
	public String nonMemberRSv(@RequestParam("email") String email, @RequestParam("rsvId") String rsvId,
			NonMemberVO nonMemberVO, Model model) {

		nonMemberVO.setGstEmail(email);
		nonMemberVO.setRsvId(rsvId);
		nonMemberVO = this.mypageService.nonMem(nonMemberVO);

		model.addAttribute("nonMemberVO", nonMemberVO);

		return "member/main/nonMemberRsv";
	}
	
	
}
