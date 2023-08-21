package kr.or.ddit.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MmAcmService;
import kr.or.ddit.member.service.MmRntcarService;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.HInsrVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.RmDeVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;

@RequestMapping("/member/rntcar")
@Controller
public class RntcarController{
	private static final Logger log = LoggerFactory.getLogger(RntcarController.class);
	


	@Autowired
	MmRntcarService mmRntcarService;
	
	@Autowired
	MmAcmService mmAcmService;

	/** 숙소 검색 메인페이지로
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String rntcarMain(Model model) {

		return "member/rntcar/rntcarMain";
	}
	

	
	/**검색 조건 처리-세션에 담아줌
	 * @param model
	 * @param busiLoc
	 * @param guestRoomNum
	 * @param checkInOut
	 * @param session
	 * @return
	 */
	@PostMapping("/search")
	public String searchRntcar(Model model,
			@RequestParam(value="busiLoc",required=false) String busiLoc,
		    @RequestParam(value="rsvSt",required=false) String rsvSt,
		    @RequestParam(value="rsvEd",required=false) String rsvEd,
		    HttpSession session){
		
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
	        LocalDateTime rsvStTime = LocalDateTime.parse(rsvSt, formatter);
	        LocalDateTime rsvEdTime = LocalDateTime.parse(rsvEd, formatter);
			
			long totalHours = ChronoUnit.HOURS.between(rsvStTime, rsvEdTime); // 시간 단위로 차이 계산
			
				
			//검색조건 유지위해 세션처리
			session.setAttribute("busiLoc",busiLoc);
			session.setAttribute("carRsvSt",rsvSt);
			session.setAttribute("carRsvEd",rsvEd);
			session.setAttribute("totalHours",totalHours);
			
		return "redirect:/member/rntcar/search/result";
	}
	
	
	
	/**검색 결과 리스트 
	 * @param model
	 * @param session
	 * @return 
	 */
	@GetMapping("/search/result")
	public String searchResultRntcar(Model model, HttpSession session){
		
		//세션에서 값 가져온다 
		String busiLoc= (String) session.getAttribute("busiLoc");
		String rsvSt= (String) session.getAttribute("carRsvSt");
		String rsvEd= (String) session.getAttribute("carRsvEd");
		long totalHours= (long) session.getAttribute("totalHours");
		
		
		//렌트카 검색 위해 쿼리로 들어갈 검색 조건 저장 map
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		map.put("busiLoc",busiLoc);
		map.put("rsvSt",rsvSt);
		map.put("rsvEd",rsvEd);
		
		log.info("맵이야:"+map);
		

		
		//조건에 맞는 업체, 자동차 리스트, 자동차 최대값 얻기
		List<CarVO> carVOList = this.mmRntcarService.searchRntcar(map);
		int maxCarPr=this.mmRntcarService.getMaxCarPr(map);
		session.setAttribute("maxCarPr", maxCarPr);
		
		Map<String, List<CarVO>> carMap = new HashMap<>();
		for (CarVO car : carVOList) {
			if (!carMap.containsKey(car.getCarKnd())) {
				carMap.put(car.getCarKnd(), new ArrayList<>());
			}
			carMap.get(car.getCarKnd()).add(car);
			log.info("차종",car.getCarKnd());
		}

		log.info("카맵",carMap);
		model.addAttribute("carMap", carMap);
		model.addAttribute("carVOList", carVOList);
		model.addAttribute("carRsvSt", rsvSt);
		model.addAttribute("carRsvEd", rsvEd);
		model.addAttribute("maxCarPr", maxCarPr);
		model.addAttribute("maxPr", maxCarPr);
		model.addAttribute("totalHours", totalHours);
		
		
		return "member/rntcar/rntcarList";
	}
	
	
	
	
	/**
	 * @param carNum
	 * @param rsvSt
	 * @param rsvEd
	 * @param model
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@GetMapping("/detail/{carNum}")
	public String acmDetail(@PathVariable(value="carNum",required=true) String carNum,Principal principal,HttpServletRequest request,
			Model model,HttpServletResponse response,
			HttpSession session) throws UnsupportedEncodingException {
		
		
		String carRsvSt= (String) session.getAttribute("carRsvSt");
		String carRsvEd= (String) session.getAttribute("carRsvEd");
		long totalHours= (long) session.getAttribute("totalHours");

		
		//차량정보
		CarVO carVO = this.mmRntcarService.detailRntcar(carNum);
		
		//model에 값 넣기
		model.addAttribute("carVO",carVO);
		model.addAttribute("carRsvSt",carRsvSt);
		model.addAttribute("carRsvEd",carRsvEd);
		model.addAttribute("totalHours",totalHours);
		
		
		//최근 본 상품
		String memId = null;
		principal = request.getUserPrincipal();
		
		if(principal !=null) {
			memId = principal.getName();
		}
		
		Cookie[] cookiesCar = request.getCookies();
		String cookieValueCar = "";
		if (cookiesCar != null) {
			for (Cookie cookie : cookiesCar) {
				if (cookie.getName().equals(memId + "recentlyViewedCar")) {
					cookieValueCar = URLDecoder.decode(cookie.getValue(), "utf-8");
					break;
				}
			}
		}
		if (!"".equals(cookieValueCar)) {
			cookieValueCar += ",";
		}
		cookieValueCar += carNum;
		log.info("쿠키 추가전  cookieValue ==> " + cookieValueCar);
		// 최근 본 상품 정보를 쿠키에 추가
		Cookie recentlyViewedCookieCar = new Cookie(memId + "recentlyViewedCar", URLEncoder.encode(cookieValueCar, "utf-8"));
		recentlyViewedCookieCar.setMaxAge(7 * 24 * 60 * 60); // 쿠키의 유효 기간 설정 (7일)
		recentlyViewedCookieCar.setPath("/");
		response.addCookie(recentlyViewedCookieCar);

		log.info("쿠키 save : " + recentlyViewedCookieCar.getName() + ";" + recentlyViewedCookieCar.getValue());

		
		return "member/rntcar/rntcarDetail";
	}

	
	@GetMapping("/searchfilter")
	public String searchFilter(Model model,
			@RequestParam(value="maxPpList",required=false) List<String> maxPpList, 
			@RequestParam(value="carCodeList",required=false) List<String> carCodeList, 
			@RequestParam(value="fuelTyList",required=false) List<String> fuelTyList,
			@RequestParam(value="minPr",required=false) String minPr,
			@RequestParam(value="maxPr",required=false) String maxPr,
			HttpSession session
			) {
		
		//세션에서 값 가져온다 
		String busiLoc= (String) session.getAttribute("busiLoc");
		String rsvSt= (String) session.getAttribute("carRsvSt");
		String rsvEd= (String) session.getAttribute("carRsvEd");
		long totalHours= (long) session.getAttribute("totalHours");
		int maxCarPr=(int) session.getAttribute("maxCarPr");

		
		
		//숙소 검색 위해 쿼리로 들어갈 검색 조건 저장 map
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("busiLoc",busiLoc);
		map.put("rsvSt",rsvSt);
		map.put("rsvEd",rsvEd);
		map.put("minPr",minPr);
		map.put("maxPr",maxPr);
		map.put("maxPpList", maxPpList);
		map.put("carCodeList", carCodeList);
		map.put("fuelTyList", fuelTyList);
		
		
		log.info("맵이야맵이:"+map);
		List<CarVO> carVOList = mmRntcarService.searchFilter(map);

			
		
				
		Map<String, List<CarVO>> carMap = new LinkedHashMap<>();
		for (CarVO car : carVOList) {
			if (!carMap.containsKey(car.getCarKnd())) {
				carMap.put(car.getCarKnd(), new ArrayList<>());
			}
			carMap.get(car.getCarKnd()).add(car);
			log.info("차종",car.getCarKnd());
		}

		model.addAttribute("carMap", carMap);
		model.addAttribute("carVOList", carVOList);
		model.addAttribute("carRsvSt", rsvSt);
		model.addAttribute("carRsvEd", rsvEd);
		model.addAttribute("totalHours", totalHours);
		model.addAttribute("maxCarPr",maxCarPr);
		model.addAttribute("maxPr",maxPr);
		model.addAttribute("maxPpList",maxPpList);
		model.addAttribute("carCodeList",carCodeList);
		model.addAttribute("fuelTyList",fuelTyList);
		
		return "member/rntcar/rntcarList";
	}
	
	
	
	/**
	 * @param model
	 * @param busiId
	 * @param session
	 * @param principal
	 * @return
	 */
	@PostMapping("/rsvCar")
	public String rsvCar(Model model,
			@RequestParam("carNum") String carNum,
			@RequestParam("totalFee") String totalFee,
			HttpSession session,
			Principal principal
			) {
		
		//로그인 했을시 회원정보 넘겨주기 
		if(principal!=null) {
			String memId = principal.getName();
			MemVO memVO = mmAcmService.getMemInfo(memId);
			model.addAttribute("memVO",memVO);
			
		}
		
		
		//픽업반납날짜 가져오기
		String carRsvSt= (String) session.getAttribute("carRsvSt");
		String carRsvEd= (String) session.getAttribute("carRsvEd");
	
		CarVO carVO = this.mmRntcarService.detailRntcar(carNum);

		List<HInsrVO> hInsrVOList =this.mmRntcarService.getHInsrVO(carVO.getBusiId()) ;
		
		model.addAttribute("hInsrVOList",hInsrVOList);
		model.addAttribute("carVO",carVO);
		model.addAttribute("carRsvSt",carRsvSt);
		model.addAttribute("carRsvEd",carRsvEd);
		model.addAttribute("totalFee",totalFee);
		
		
		return "member/rntcar/rntcarRsv";
	}
	
	

	/**결제 완료시 db에 정보 인서트 
	 * @param data
	 * @return
	 */
	@PostMapping("/payComplete")
	public String payComplete(
			@RequestBody Map<String, String> data,
			HttpSession session) {

		//현재 날짜 가져와서 예약날짜, 결제날짜에 넣어주기
		LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        DateTimeFormatter formatterT = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
        String today = currentDateTime.format(formatter);
        String now = currentDateTime.format(formatterT);
        data.put("rsvDt", today);
        data.put("payDt", today);
        data.put("payId","P"+now);
        
        //payId,rsvId 오늘날짜로 된 id있나 조회	
        String countPayId="" + this.mmRntcarService.countPayId("P"+now);
        data.put("countPayId",countPayId);
        
        int countRsvId= this.mmRntcarService.countRsvId("R"+now);
	    if (countRsvId==0) 
	        data.put("rsvId","R"+now+"01");
        else 
        	data.put("rsvId",mmRntcarService.checkRsvId("R"+now));
        
        
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    //비회원시 
	    if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			int insertN=this.mmRntcarService.insertGuestRsv(data);
		//회원시 
	    } else {
	    	int insertN=this.mmRntcarService.insertMemRsv(data);

	    	//쿠폰사용시 
	    	if(data.get("cupnId") !=null) {
	    		int chageCupn=this.mmAcmService.changeCupnInfo(data);
		    	log.info("쿠폰이야"+chageCupn);
	    		
	    	}
	    	
	    	//마일리지 사용시 
	    	if(data.get("usedMilage") !=null) {
	    		int changeMlg=this.mmAcmService.changeMlg(data);
		    	log.info("마일리지야"+changeMlg);
	    	
	    	}
	    	
	    }
	    
	    
	    session.setAttribute("rsvNm",data.get("rsvNm"));
	    session.setAttribute("buyerNm",data.get("buyerNm"));
	    session.setAttribute("payPr",data.get("payPr"));
	    session.setAttribute("hinsrNm",data.get("hinsrNm"));
	    session.setAttribute("rRsvSt",data.get("rsvSt"));
	    session.setAttribute("rRsvEd",data.get("rsvEd"));
	    session.setAttribute("busiNm",data.get("busiNm"));
	    session.setAttribute("carImg",data.get("carImg"));
		
		return "redirect:/member/rntcar/rsvConfirm";
	}
	
	
	/**예약 완료 페이지로 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/rsvConfirm")
	public  String rsvConfirm(HttpSession session, Model model) {
		
		String rsvNm = (String) session.getAttribute("rsvNm");
	    String rsvId = (String) session.getAttribute("rsvId");
	    String buyerNm = (String) session.getAttribute("buyerNm");
	    String payPr = (String) session.getAttribute("payPr");
	    String rRsvSt = (String) session.getAttribute("rRsvSt");
	    String rRsvEd = (String) session.getAttribute("rRsvEd");
	    String insrNm = (String) session.getAttribute("hinsrNm");
	    String busiNm = (String) session.getAttribute("busiNm");
	    String carImg = (String) session.getAttribute("carImg");
		
	    
		
	    model.addAttribute("rsvNm", rsvNm );
	    model.addAttribute("rsvId", rsvId );
	    model.addAttribute("buyerNm", buyerNm);
	    model.addAttribute("payPr", payPr );
	    model.addAttribute("rRsvSt", rRsvSt);
	    model.addAttribute("rRsvEd", rRsvEd);
	    model.addAttribute("insrNm", insrNm);
	    model.addAttribute("busiNm", busiNm);
	    model.addAttribute("carImg", carImg);
	    
	    
		return "member/rntcar/rntcarRsvConfirm";
	}
	
}
