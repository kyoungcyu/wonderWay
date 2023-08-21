package kr.or.ddit.member.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.admin.service.AdMemService;
import kr.or.ddit.member.service.MemRcmService;
import kr.or.ddit.vo.BrdVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.MbtiStyRcmVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RcmLocVO;
import kr.or.ddit.vo.RcmMbtiTourVO;
import kr.or.ddit.vo.RcmRntVO;
import kr.or.ddit.vo.RcmStyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class RcmController {

	@Autowired
	AdMemService adMemService;

	@Autowired
	MemRcmService memRcmService;
	
	//회원 맞춤 숙소 추천
	@GetMapping("/rcm/sty")
	public String rcmSty(Model model,
			@RequestParam(value = "loc", required = false, defaultValue = "") String loc,
			@RequestParam(value = "acmdCode", required = false, defaultValue = "") String acmdCode,
			HttpSession session, Authentication authentication, MemVO memVO, RcmStyVO rcmStyVO) {
		
		
	    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    String memId = userDetails.getUsername();
	    log.info("memId : " + memId);
	    memVO.setMemId(memId);
	    
	    memVO = this.adMemService.memDetail(memVO);
	    String memGen = memVO.getMemGen();
	    Date memBir = memVO.getMemBir();
	    
	    LocalDate currentDate = LocalDate.now();
	    LocalDate birthDate = memBir.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	    Period period = Period.between(birthDate, currentDate);
	    int bir = period.getYears();

	    // 연령대 계산
	    int age;
	    if (bir < 30) {
	    	age = 20;
	    } else if (bir < 40) {
	    	age = 30;
	    } else if (bir < 50) {
	    	age = 40;
	    } else if (bir < 60) {
	    	age = 50;
	    } else {
	    	age = 60;
	    }
	    
	    rcmStyVO.setAge(age);
	    rcmStyVO.setGen(memGen);
	    rcmStyVO.setLoc(loc);
	    rcmStyVO.setAcmdCode(acmdCode);
	    
		RcmStyVO rcmStyList = this.memRcmService.rcmStyList(rcmStyVO);
		log.info("rcmStyList : " + rcmStyList);

		if (rcmStyList != null) {
			List<BusiVO> busiVO = this.memRcmService.rcmBusiSty(rcmStyVO);
			model.addAttribute("busiVO", busiVO);
		}

		return "member/rcm/sty";
	}
	
	/**
	 * 태희
	 * @return
	 */

	// mbti별 여행지 숙소 추천 1 - 메인
	@GetMapping("/rcm/styMbtiMain")
	public String styMbti() {

		return "member/rcm/styMbti";
	}

	// mbti별 여행지 숙소 추천 - mbti 테스트
	@GetMapping("/rcm/testMbti")
	public String testMbti() {

		return "member/rcm/testMbti";
	}
	//
	@ResponseBody
	@PostMapping("/rcm/testMbtiPost")
	public String styMbtiResult1(@RequestBody String styMbti, Model model, MbtiStyRcmVO mbtiStyRcmVO) {
		
		log.info("styMbti : " + styMbti);

		return "member/rcm/styMbtiResult?" + mbtiStyRcmVO.getStyMbti();
	}
	
	
	/*
	 요청URI : /member/rcm/styMbtiResult?styMbti=INFP&styLoc=부산
	요청방식 : get
	요청파라미터 : styMbti=INFP&styLoc=부산
	 */
	@GetMapping("/rcm/styMbtiResult")
	public String styMbtiResult2(@RequestParam("styMbti") String styMbti,@RequestParam(value = "styLoc", required = false, defaultValue = "부산") String styLoc,
										BusiVO busiVO, Model model, MbtiStyRcmVO mbtiStyRcmVO, HttpServletRequest request) {
		//styMbti : INFP
		log.info("styMbti : " + styMbti);
		//styLoc : 부산
		log.info("styLoc : " + styLoc);
		
		mbtiStyRcmVO.setStyLoc(styLoc);
		//mbtiStyRcmVO : MbtiStyRcmVO(styMbti=INFP, styLoc=부산, styId1=null, styId2=null, styId3=null)
		log.info("mbtiStyRcmVO : "+mbtiStyRcmVO);
		//styMbti : INFP
		log.info("styMbti : " + styMbti);
		//list : MbtiStyRcmVO(styMbti=INFP, styLoc=부산, styId1=B0100126, styId2=B0100034, styId3=B0100122)
		MbtiStyRcmVO list = this.memRcmService.styMbtiRcm(mbtiStyRcmVO);
		
		model.addAttribute("list",list);
		//list : MbtiStyRcmVO(styMbti=INFP, styLoc=부산, styId1=B0100126, styId2=B0100034, styId3=B0100122)
		
		//선택한 지역과 같은 숙소만 추천하기
		
//		if (list.getStyLoc()== substr(busiLoc,1,2)) {
//			
//		}
		
		BusiVO detail1 = this.memRcmService.styMbtiRcmDetail(list.getStyId1());	//B0100126
		BusiVO detail2 = this.memRcmService.styMbtiRcmDetail(list.getStyId2()); //B0100034
		BusiVO detail3 = this.memRcmService.styMbtiRcmDetail(list.getStyId3());	//B0100122
		
		//detail1 : BusiVO(busiId=null, lginId=null, busiPw=null, busiNm=송원모텔, busiLoc=부산광역시 영도구 대교동1가 182-1번지,
		log.info("detail : " + detail1);
		//detail2 : BusiVO(busiId=null, lginId=null, busiPw=null, busiNm=오션 더 포인트호텔, busiLoc=부산광역시 수
		log.info("detail2 : " + detail2);
		//detail3 : BusiVO(busiId=null, lginId=null, busiPw=null, busiNm=엑스모텔, busiLoc=부산광역시 부산진구
		log.info("detail3 : " + detail3);
		
		model.addAttribute("detail1",detail1);
		model.addAttribute("detail2",detail2);
		model.addAttribute("detail3",detail3);
		
		return "member/rcm/styMbtiResult";
	}

	
	
	
	
	//mbti별 여행지추천
	@GetMapping("/rcm/mbtiTour")
	public String mbtiTour() {

		
		
		return "member/rcm/mbtiTour";
	}
	
	//mbti별 여행지추천 ajax
	@ResponseBody
	@GetMapping("/rcm/mbtiTourAjax")
	public RcmMbtiTourVO mbtiTourAjax(@RequestParam String mbti, Model model) {
		
		System.out.println("mbtti : " + mbti);
		
		RcmMbtiTourVO rcmMbtiTour = this.memRcmService.mbtiTourNm(mbti);
		rcmMbtiTour.setTourMbti(mbti);
		
		return rcmMbtiTour;
	}
	
	
	// 렌터카 추천
	@GetMapping("/rcm/car")
	public String car() {
	
		return "member/rcm/car";
	}
	
	// 렌터카 추천 결과
	@GetMapping("/rcm/carResult")
	public String carResult(Model model,HttpSession session,Authentication authentication, RcmRntVO rcmRntVO) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    String memId = userDetails.getUsername();
	    
	    rcmRntVO.setMemId(memId);
	    
	    rcmRntVO = this.memRcmService.rcmRntList(rcmRntVO);
	    
	    model.addAttribute("data", rcmRntVO);
	    
		return "member/rcm/carResult";
	}
	
	
	// 선호도 조사 페이지
	@GetMapping("/rcm/psnlPrfr")
	public String locRcm() {
		return "member/rcm/psnlPrfr";
	}
	
	// 선호도 조사 결과 response
	@ResponseBody
	@PostMapping("/rcm/psnlPrfrPost")
	public String locRcmPost(Principal principal
						   , @RequestParam("location") String location
						   , @RequestParam("active") String active
						   , @RequestParam("mood") String mood
						   , @RequestParam("locaPrefer") String locaPrefer
						   , @RequestParam("styCl") String styCl
						   , @RequestParam("tgrpn") String tgrpn
						   , @RequestParam("exprnc") String exprnc
						   , @RequestParam("plan") String plan
						   , @RequestParam("pvtCar") String pvtCar) {
		
		String memId = principal.getName();
	    log.info("memId : " + memId);
		
		Map<String, String> map = new HashMap<String, String>();
		if(active.equals("0")) {
			map.put("active", "A");
		} else if(active.equals("1")) {
			map.put("active", "B");
		}
		if(mood.equals("0")) {
			map.put("mood", "A");
		} else if(mood.equals("1")) {
			map.put("mood", "B");
		}
		if(locaPrefer.equals("0")) {
			map.put("locaPrefer", "A");
		} else if(locaPrefer.equals("1")) {
			map.put("locaPrefer", "B");
		}
		if(styCl.equals("0")) {
			map.put("styCl", "A");
		} else if(styCl.equals("1")) {
			map.put("styCl", "B");
		}
		if(tgrpn.equals("0")) {
			map.put("tgrpn", "A");
		} else if(tgrpn.equals("1")) {
			map.put("tgrpn", "B");
		}
		if(exprnc.equals("0")) {
			map.put("exprnc", "A");
		} else if(exprnc.equals("1")) {
			map.put("exprnc", "B");
		}
		if(plan.equals("0")) {
			map.put("plan", "A");
		} else if(plan.equals("1")) {
			map.put("plan", "B");
		}
		if(pvtCar.equals("0")) {
			map.put("pvtCar", "A");
		} else if(pvtCar.equals("1")) {
			map.put("pvtCar", "B");
		}
		if (location.equals("KW")) {
			map.put("location", "강원");
		} else if(location.equals("SL")) {
			map.put("location", "서울");
		} else if(location.equals("KJJL")) {
			map.put("location", "광주,전라");
		} else if(location.equals("DGKS")) {
			map.put("location", "대구,경상");
		} else if(location.equals("DGCC")) {
			map.put("location", "대전,충청");
		} else if(location.equals("BS")) {
			map.put("location", "부산");
		} else if(location.equals("JEJU")) {
			map.put("location", "제주");
		}
		
		map.put("location", location);
		map.put("memId", memId);
		
		log.info("map : " + map);
		
		int chk = this.memRcmService.checkMember(memId);
		log.info("chk : " + chk);
		
		
		int cnt = 1;
		
		log.info("cnt : " + cnt);
		
		if(cnt > 0) {
			return memId;
		} else {
			return "failed";
		}
	}
	
	// 추천 결과 페이지
	@RequestMapping(value="/rcm/result",method=RequestMethod.GET)
	public String locPredictPost(Model model
							   , @RequestParam(value = "predict1", required = false, defaultValue = "") String predict1
							   , @RequestParam(value = "predict2", required = false, defaultValue = "") String predict2
							   , @RequestParam(value = "predict3", required = false, defaultValue = "") String predict3) {
		log.info("Hello Spring");
		
		
		log.info("predict1 : " + predict1);
		log.info("predict2 : " + predict2);
		log.info("predict3 : " + predict3);
		
		RcmLocVO vo1 = this.memRcmService.locRcmDetail(predict1);
		RcmLocVO vo2 = this.memRcmService.locRcmDetail(predict2);
		RcmLocVO vo3 = this.memRcmService.locRcmDetail(predict3);
		
		String[] str1 = vo1.getTourDc().split("\\.");
		vo1.setTourDc(str1[0]);
		
		String[] str2 = vo2.getTourDc().split("\\.");
		vo2.setTourDc(str2[0]);
		
		String[] str3 = vo3.getTourDc().split("\\.");
		vo3.setTourDc(str3[0]);
		
		log.info("str1 : " + str1[0]);
		log.info("str2 : " + str2[0]);
		log.info("str3 : " + str3[0]);
		
		model.addAttribute("predict1", vo1);
		model.addAttribute("predict2", vo2);
		model.addAttribute("predict3", vo3);
		
		return "member/rcm/result";
	}
}
