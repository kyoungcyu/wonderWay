package kr.or.ddit.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Session;
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
import kr.or.ddit.member.service.MmCartService;
import kr.or.ddit.member.service.MmRntcarService;
import kr.or.ddit.member.service.MypageService;
import kr.or.ddit.util.ItemDTO;
import kr.or.ddit.util.PagingDTO;
import kr.or.ddit.vo.AttachDeVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BusiVO;
import kr.or.ddit.vo.CvfcVO;
import kr.or.ddit.vo.MemVO;
import kr.or.ddit.vo.MsgVO;
import kr.or.ddit.vo.RmDeVO;
import kr.or.ddit.vo.RmVO;
import kr.or.ddit.vo.RvwVO;
import kr.or.ddit.vo.WishVO;

@RequestMapping("/member/acm")
@Controller
public class AcmController{
	private static final Logger log = LoggerFactory.getLogger(AcmController.class);
	


	@Autowired
	MmAcmService mmAcmService;
	
	@Autowired
	MmRntcarService mmRntcarService;
	
	@Autowired
	MmCartService mmCartService;
	
	@Autowired
	MypageService mypageService;

	/** 숙소 검색 메인페이지로
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String acmMain(Model model, Principal principal, HttpSession session) {
		
		 ////////////////////////// 내 찜목록 가져오기  ////////////////////////////////
		String memId = (principal != null) ? principal.getName() : "Guest";
		log.info("memId:" + memId);
		
		if (memId != "Guest") {
			WishVO wishVO = new WishVO();
			wishVO.setMemId(memId);
			List<WishVO> myLikeList = this.mypageService.myLikeList(wishVO);
			session.setAttribute("myLikeList", myLikeList);
			log.info("찜목록:" + myLikeList);
		}

		return "member/acm/acmMain";
	}	
		
	@ResponseBody
	@PostMapping("/insertLikeAjax")
	public int insertLikeAjax(@RequestBody WishVO wishVO, HttpSession session){
		int result = this.mypageService.insertWish(wishVO);
		session.removeAttribute("myLikeList");
		List<WishVO> myLikeList = this.mypageService.myLikeList(wishVO);
		session.setAttribute("myLikeList", myLikeList);
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/deleteLikeAjax")
	public int deleteLikeAjax(@RequestBody WishVO wishVO, HttpSession session){
		int result = this.mypageService.deleteWish(wishVO);
		session.removeAttribute("myLikeList");
		List<WishVO> myLikeList = this.mypageService.myLikeList(wishVO);
		session.setAttribute("myLikeList", myLikeList);
		return result;
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
	public String searchAcm(Model model,
			@RequestParam(value="busiLoc",required=false, defaultValue="서울") String busiLoc,
		    @RequestParam(value="guestRoomNum",required=false, defaultValue="2 명 1 개의 객실") String guestRoomNum,
		    @RequestParam(value="checkInOut",required=false) String checkInOut,
			@RequestParam(value="busiNm",required=false) String busiNm,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="order",required=false) String order,
		    HttpSession session){
		
		//체크인아웃 날짜 선택 안할 시 자동으로 오늘부터 이틀 뒤까지로 설정
		if(checkInOut==null || checkInOut=="") {
			LocalDate now =LocalDate.now();
	        LocalDate TDLater = now.plusDays(2);
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
	        String StrNow=now.format(formatter);
	        String StrTDLater=TDLater.format(formatter);
			
	        checkInOut=StrNow + "to"+ StrTDLater;
			
		}
		
		String rsvSt=checkInOut.split("to")[0].trim();
		String rsvEd=checkInOut.split("to")[1].trim();
		session.setAttribute("rsvSt",rsvSt);
		session.setAttribute("rsvEd",rsvEd);
		session.setAttribute("checkInOut",checkInOut);

		
		//체크인날짜, 인원, 방개수로 검색
		if(busiNm==null) {
			String guestNum=guestRoomNum.split(" ")[0];
			String rmNum=guestRoomNum.split(" ")[2];
			
				
			//검색조건 유지위해 세션처리
			session.setAttribute("busiLoc",busiLoc);
			session.setAttribute("guestRoomNum",guestRoomNum);
			session.setAttribute("guestNum",guestNum);
			session.setAttribute("rmNum",rmNum);
			session.setAttribute("busiNm",busiNm);
			session.setAttribute("order",order);
			
		}else {
			session.setAttribute("busiLoc",busiLoc);
			session.setAttribute("busiNm",busiNm);
		}
		
		
		
		
		
		return "redirect:/member/acm/search/result";
	}
	
	
	
	/**검색 결과 리스트 
	 * @param model
	 * @param session
	 * @return 
	 */
	@GetMapping("/search/result")
	public String searchResultAcm(Model model, 
			HttpSession session,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			){
		
		//세션에서 값 가져온다 
		String busiLoc= (String) session.getAttribute("busiLoc");
		String guestRoomNum= (String) session.getAttribute("guestRoomNum");
		String guestNum= (String) session.getAttribute("guestNum");
		String rmNum= (String) session.getAttribute("rmNum");
		String rsvSt= (String) session.getAttribute("rsvSt");
		String rsvEd= (String) session.getAttribute("rsvEd");
		String busiNm= (String) session.getAttribute("busiNm");
		String order=(String) session.getAttribute("order");
		log.info("네임"+busiNm);
		
		//상단광고 노출 
		List<BusiVO> TopAdBusiVOList=this.mmAcmService.getTopAd(busiLoc);
		model.addAttribute("TopAdBusiVOList",TopAdBusiVOList);
		
		
		
		//숙소 검색 위해 쿼리로 들어갈 검색 조건 저장 map
		Map<String,String> map = new HashMap<String, String>();
		
		//체크인날짜, 인원,방개수로 검색 
		if(busiNm==null) {
			
			
			
			
			map.put("busiLoc",busiLoc);
			map.put("guestNum",guestNum);
			map.put("rmNum",rmNum);
			map.put("rsvSt",rsvSt);
			map.put("rsvEd",rsvEd);
			map.put("order",order);
			map.put("currentPage", Integer.toString(currentPage));
			log.info("맵이야:"+map);
			
			
			//조건에 맞는 숙소, 방리스트, 방 최대값 얻기
			List<BusiVO> busiVOList = this.mmAcmService.searchAcm(map);
			List<BusiVO> totalAcm =this.mmAcmService.getTotalAcm(map);
			int maxRmPr=this.mmAcmService.getMaxRmPr(map);
			session.setAttribute("maxRmPr", maxRmPr);
			
			
			model.addAttribute("busiVOList", new PagingDTO<BusiVO>( totalAcm.size(), currentPage, 10, busiVOList));
			model.addAttribute("totalAcm",totalAcm.size());
			model.addAttribute("busiLoc", busiLoc);
			model.addAttribute("guestRoomNum", guestRoomNum);
			model.addAttribute("rsvSt", rsvSt);
			model.addAttribute("rsvEd", rsvEd);
			model.addAttribute("maxRmPr", maxRmPr);
			model.addAttribute("maxPr", maxRmPr);
			model.addAttribute("order", order);
			
			
		
		//숙소 이름으로 검색 
		}else {
			
			map.put("busiLoc",busiLoc);
			map.put("busiNm",busiNm);
			map.put("rsvSt",rsvSt);
			map.put("rsvEd",rsvEd);
			map.put("currentPage", Integer.toString(currentPage));
			
			log.info("이거이거"+map);
			
			List<BusiVO> busiVOList = this.mmAcmService.searchForName(map);
			List<BusiVO> totalAcm =this.mmAcmService.getTotalAcmNm(map);
			int maxRmPr=this.mmAcmService.getMaxRmPr(map);
			
			model.addAttribute("busiVOList", new PagingDTO<BusiVO>( totalAcm.size(), currentPage, 10, busiVOList));
			model.addAttribute("totalAcm",totalAcm.size());
			model.addAttribute("busiLoc", busiLoc);
			model.addAttribute("busiNm", busiNm);
			model.addAttribute("rsvSt", rsvSt);
			model.addAttribute("rsvEd", rsvEd);
			model.addAttribute("maxRmPr", maxRmPr);
			model.addAttribute("maxPr", maxRmPr);

		}
		
		return "member/acm/acmList";
	}
	
	
	
	/**필터사용 재검색 
	 * @param acmTypeList
	 * @param minPr
	 * @param maxPr
	 * @param star
	 * @param session
	 * @returns
	 */
	@GetMapping("/searchfilter")
	public String searchFilter(Model model,
			@RequestParam(value="acmTypeList",required=false) List<String> acmTypeList, 
			@RequestParam(value="cvfcList",required=false) List<String> cvfcList, 
			@RequestParam(value="minPr",required=false) String minPr,
			@RequestParam(value="maxPr",required=false) String maxPr,
			@RequestParam(value="star",required=false) String star,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="order",required=false) String order,
			HttpSession session
			) {
		
		String busiLoc= (String) session.getAttribute("busiLoc");
		String guestNum= (String) session.getAttribute("guestNum");
		String rmNum= (String) session.getAttribute("rmNum");
		String rsvSt= (String) session.getAttribute("rsvSt");
		String rsvEd= (String) session.getAttribute("rsvEd");
		int maxRmPr= (int) session.getAttribute("maxRmPr");
		
		log.info("정렬이야"+order);
		
		//상단광고 노출 
		List<BusiVO> TopAdBusiVOList=this.mmAcmService.getTopAd(busiLoc);
		model.addAttribute("TopAdBusiVOList",TopAdBusiVOList);
		
		
		//숙소 검색 위해 쿼리로 들어갈 검색 조건 저장 map
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("busiLoc",busiLoc);
		map.put("guestNum",guestNum);
		map.put("rmNum",rmNum);
		map.put("rsvSt",rsvSt);
		map.put("rsvEd",rsvEd);
		map.put("star",star);
		map.put("minPr",minPr);
		map.put("maxPr",maxPr);
		map.put("acmTypeList", acmTypeList);
		map.put("cvfcList", cvfcList);
		map.put("order", order);
		map.put("currentPage", Integer.toString(currentPage));

		
		log.info("map:"+map);
		List<BusiVO>busiVOList = mmAcmService.searchFilter(map);
		List<BusiVO> totalAcm =mmAcmService.getTotalFilter(map);
		
		model.addAttribute("busiVOList", new PagingDTO<BusiVO>(busiVOList.size(), currentPage, 10, busiVOList));
		model.addAttribute("star",star);
		model.addAttribute("minPr",minPr);
		model.addAttribute("maxPr",maxPr);
		model.addAttribute("maxRmPr",maxRmPr);
		model.addAttribute("acmTypeList",acmTypeList);
		model.addAttribute("cvfcList",cvfcList);
		model.addAttribute("order",order);
		model.addAttribute("totalAcm",totalAcm.size());
		
		return "member/acm/acmList";
	}
	
	
	/** 숙소 클릭시 숙소 디테일 정보 페이지로 
	 * @param busiId
	 * @param currentPage
	 * @param busiVO
	 * @param model
	 * @param session
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@GetMapping("/detail/{busiId}")
	public String acmDetail(@PathVariable(value="busiId",required=true) String busiId,
			@RequestParam(value="rsvSt",required=false) String rsvSt,
			@RequestParam(value="rsvEd",required=false) String rsvEd,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@ModelAttribute BusiVO busiVO,
			Model model, Principal principal,HttpServletRequest request,
			HttpSession session,HttpServletResponse response) throws UnsupportedEncodingException {
		
		//숙소정보
		busiVO = this.mmAcmService.detailAcm(busiVO);
		
		//이미지
		List<AttachDeVO> attachDeVOList=this.mmAcmService.getImg(busiId);
		
		//아동,펫,장애인,흡연 여부
		Map <String,String> mapKPDS = this.mmAcmService.availKPDS(busiId);
		log.info("=====mapKPDS",mapKPDS);

		
		//편의시설 정보
		log.info("busiId : " + busiId);
		List<CvfcVO> cvfcVOList = this.mmAcmService.getCvfc(busiId);
		System.out.println("편의시설 : "+cvfcVOList);
		
		Map<String,String> RmMap = new HashMap<String, String>();
		RmMap.put("busiId",busiId);

		
		
		//객실정보
		if(rsvSt!=null && rsvEd!=null) { //재검색시 입력한 값을 가져온다
			RmMap.put("rsvSt",rsvSt);
			RmMap.put("rsvEd",rsvEd);
			
			model.addAttribute("rsvSt",rsvSt);
			model.addAttribute("rsvEd",rsvEd);

		}else {//처음 상세정보 볼때 세션에서 가져온다
			rsvSt= (String) session.getAttribute("rsvSt");
			rsvEd= (String) session.getAttribute("rsvEd");
			RmMap.put("rsvSt",rsvSt);
			RmMap.put("rsvEd",rsvEd);
			model.addAttribute("rsvSt",rsvSt);
			model.addAttribute("rsvEd",rsvEd);

		}
		
		
		//이용 가능 객실
		List<RmVO> rmVOList=this.mmAcmService.getRm(RmMap);
		
		//예약된 객실도 
		List<RmVO> rsvedRmVOList=this.mmAcmService.getReservedRm(RmMap);

		
		
		//리뷰
		Map<String,String> RvwMap = new HashMap<String, String>();
		RvwMap.put("busiId",busiId);
		RvwMap.put("currentPage", Integer.toString(currentPage));
		List<RvwVO> rvwVOList= this.mmAcmService.getRvw(RvwMap);
		Map<String,Double> ratioMap=this.mmAcmService.getRvwRatio(busiId);
		
		log.info("busiVO:"+busiVO);
		log.info("rvwVO:"+rvwVOList);
		
		int total = this.mmAcmService.getTotalRvw(busiId);
		
		//model에 값 넣기
		model.addAttribute("busiVO",busiVO);
		model.addAttribute("attachDeVOList",attachDeVOList);
		model.addAttribute("mapKPDS",mapKPDS);
		model.addAttribute("cvfcVOList",cvfcVOList);
		model.addAttribute("rmVOList",rmVOList);
		model.addAttribute("rsvedRmVOList",rsvedRmVOList);
		model.addAttribute("rvwTotal",total);
		model.addAttribute("ratioMap",ratioMap);
		model.addAttribute("rvw", new PagingDTO<RvwVO>(total, currentPage, 5, rvwVOList));
		
		String memId = null;
		principal = request.getUserPrincipal();
		if (principal != null) {
		    memId = principal.getName();
		}
			
			Cookie[] cookies = request.getCookies();
			String cookieValue = "";
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals(memId + "recentlyViewed")) {
						cookieValue = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					}
				}
			}
			if (!"".equals(cookieValue)) {
				cookieValue += ",";
			}
			cookieValue += busiId;
			log.info("쿠키 추가전  cookieValue ==> " + cookieValue);
			// 최근 본 상품 정보를 쿠키에 추가
			Cookie recentlyViewedCookie = new Cookie(memId + "recentlyViewed", URLEncoder.encode(cookieValue, "utf-8"));
			recentlyViewedCookie.setMaxAge(7 * 24 * 60 * 60); // 쿠키의 유효 기간 설정 (7일)
			recentlyViewedCookie.setPath("/"); 
			response.addCookie(recentlyViewedCookie);

			log.info("쿠키 save : " + recentlyViewedCookie.getName() + ";" + recentlyViewedCookie.getValue());
			
		
		
		
		return "member/acm/acmDetail";
	}

	
	
	
	/**
	 * @param busiId
	 * @param rsvSt
	 * @param rsvEd
	 * @param model
	 * @return
	 */
	@GetMapping("/detail/rmSearch")
	public String rmSearch(@RequestParam("busiId") String busiId,
			@RequestParam("rsvSt") String rsvSt,
			@RequestParam("rsvEd") String rsvEd,
			Model model) {
		
		
		//객실정보
		Map<String,String> RmMap = new HashMap<String, String>();
		RmMap.put("busiId",busiId);
		RmMap.put("rsvSt",rsvSt);
		RmMap.put("rsvEd",rsvEd);
		List<RmVO> rmVOList=this.mmAcmService.getRm(RmMap);
		
		//예약된객실도 
		List<RmVO> rsvedRmVOList=this.mmAcmService.getReservedRm(RmMap);

		
		//model에 값 넣기
		model.addAttribute("rmVOList",rmVOList);
		model.addAttribute("rsvedRmVOList",rsvedRmVOList);

		return "member/acm/acmDetail";
	}

	
	
	
	
	/**방 상세정보 클릭시 모달창에 정보 넘겨줌 
	 * @param rmId
	 * @return
	 */
	@ResponseBody
	@PostMapping("/rmDetail")
	public List<RmVO> rmDetail(@RequestParam("rmId") String rmId) {
		
		List<RmVO> rmVOList = mmAcmService.rmDetail(rmId);

		System.out.println(rmVOList);

		return rmVOList;
	}
	
	
	/**장바구니 추가
	 * @param data
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/addCart", produces = "application/text; charset=utf8")//이걸해줘야 텍스트가 보낼때도 깨지지 않는다 
	public String addCart(@RequestBody Map<String, Object> data, 
							HttpSession session,  
							Principal principal) {
		
		//로그인 했을시 회원정보 넘겨주기 
		if(principal!=null) {
			String memId = principal.getName();
			MemVO memVO = mmAcmService.getMemInfo(memId);
			
		}
		
		
		@SuppressWarnings("unchecked")
		ArrayList<ItemDTO> itemList=(ArrayList<ItemDTO>) session.getAttribute("itemList");
		
		//장바구니 없을 시 생성
		if(itemList==null) {
			itemList = new ArrayList<ItemDTO>();
		}
		
		
		String busiId=(String) data.get("busiId");
		String busiNm=(String) data.get("busiNm");
		String rmId=(String) data.get("rmId");
		String rmNm=(String) data.get("rmNm");
		int rmNum=Integer.parseInt((String)data.get("rmNum"));
		int rmPr=(int) data.get("rmPr");
		String rsvStStr= (String) session.getAttribute("rsvSt");
		String rsvEdStr= (String) session.getAttribute("rsvEd");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
		LocalDate rsvSt = LocalDate.parse(rsvStStr, formatter);
		LocalDate rsvEd = LocalDate.parse(rsvEdStr, formatter);
		
		String busiImg = (String) data.get("busiImg");
		
		ItemDTO itemDTO=new ItemDTO(busiNm, busiId, rmNm, rmId, rmNum, rmPr, rsvSt, rsvEd,busiImg);
		String message =mmCartService.addItem(itemDTO,itemList);
		
		session.setAttribute("itemList",itemList);
		
		log.info("텍스트야"+message);

		return message;
	}
	
	
	
	
	
	
	/** 방 예약하기 클릭시 예약정보 넘겨줌
	 * @param model
	 * @param rmId
	 * @param rmNum
	 * @param session
	 * @return
	 */
	@PostMapping("/reserveRm")
	public String reserveRm(Model model,
			@RequestParam("busiId") String busiId,
			@RequestParam("rmId") String rmId,
			@RequestParam("rmNum") String rmNum,
			HttpSession session,
			Principal principal
			) {
		
		//로그인 했을시 회원정보 넘겨주기 
		if(principal!=null) {
			String memId = principal.getName();
			MemVO memVO = mmAcmService.getMemInfo(memId);
			model.addAttribute("memVO",memVO);
			
		}
		
		//검색 조건 넣기 위한 map
		Map<String, String> map = new HashMap<String, String>();
		map.put("rmId",rmId);
		map.put("rmNum",rmNum);
		
		BusiVO busiVO =mmAcmService.rsvInfo(map);
		
		//체크인아웃날짜 가져오기
		String rsvSt= (String) session.getAttribute("rsvSt");
		String rsvEd= (String) session.getAttribute("rsvEd");
		
		//아동,펫,장애인,흡연 여부
		Map <String,String> mapKPDS = this.mmAcmService.availKPDS(busiId);
		
		
		model.addAttribute("busiVO",busiVO);
		model.addAttribute("rsvSt",rsvSt);
		model.addAttribute("rsvEd",rsvEd);
		model.addAttribute("mapKPDS",mapKPDS);
		
		
		return "member/acm/acmRsv";
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
        
        
        // 23/01/01에서 2023/01/01형식으로 바꿔주기
        String rsvSt="20"+data.get("rsvSt");
        String rsvEd="20"+data.get("rsvEd");
        data.put("rsvSt", rsvSt);
        data.put("rsvEd", rsvEd);
        
        //payId,rsvId 오늘날짜로 된 id있나 조회	-공통로직이라 렌트카꺼 빼옴
        String countPayId="" + this.mmRntcarService.countPayId("P"+now);
        data.put("countPayId",countPayId);
        
        int countRsvId= this.mmRntcarService.countRsvId("R"+now);
	    if (countRsvId==0) 
	        data.put("rsvId","R"+now+"01");
        else 
        	data.put("rsvId",mmRntcarService.checkRsvId("R"+now));
        
        
        
        log.info("아작스로 받아왔다 data"+data);
        
        
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    //비회원시 
	    if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			int insertN=this.mmAcmService.insertGuestRsv(data);
		//회원시 
	    } else {
	    	int insertN=this.mmAcmService.insertMemRsv(data);

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
	    session.setAttribute("rRsvSt",data.get("rsvSt"));
	    session.setAttribute("rRsvEd",data.get("rsvEd"));
	    session.setAttribute("rStyPp",data.get("rStyPp"));
	    session.setAttribute("rsvId",data.get("rsvId"));
	    session.setAttribute("userNm",data.get("userNm"));
	    session.setAttribute("busiImg",data.get("busiImg"));
		
	    
	    log.info("이미지"+data.get("busiImg"));
		return "redirect:/member/acm/rsvConfirm";
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
	    String userNm = (String) session.getAttribute("userNm");
	    String payPr = (String) session.getAttribute("payPr");
	    String rRsvSt = (String) session.getAttribute("rRsvSt");
	    String rRsvEd = (String) session.getAttribute("rRsvEd");
	    String rStyPp = (String) session.getAttribute("rStyPp");
	    String busiImg = (String) session.getAttribute("busiImg");
		
		
	    model.addAttribute("rsvNm", rsvNm );
	    model.addAttribute("rsvId", rsvId );
	    model.addAttribute("buyerNm", buyerNm);
	    model.addAttribute("userNm", userNm);
	    model.addAttribute("payPr", payPr );
	    model.addAttribute("rRsvSt", rRsvSt);
	    model.addAttribute("rRsvEd", rRsvEd);
	    model.addAttribute("rStyPp", rStyPp);
	    model.addAttribute("busiImg", busiImg);
	    
	    
		return "member/acm/acmRsvConfirm";
	}
	
	
	/**acm detail 쪽지보내기
	 * @param session, msgVO, principal
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping("/msgInsert")
	public int msgInsert(@RequestBody MsgVO msgVO, HttpSession session, Principal principal) {
		//sendId, sendNm 넣기 
		String memId = principal.getName();
		MemVO memVO = mmAcmService.getMemInfo(memId);
		msgVO.setSendId(memVO.getMemId());
		msgVO.setSendNm(memVO.getMemNm());
		log.info(memId);
		int cnt = this.mmAcmService.msgInsert(msgVO);
		
		return cnt;
	}
	
	/**예약 완료 페이지로 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/chatting")
	public  String chatting(HttpSession session, Model model, Principal principal, 
							@RequestParam("busiNm")String busiNm ) {
		String memId = principal.getName();
		MemVO memVO = mmAcmService.getMemInfo(memId);
		model.addAttribute("memVO",memVO);
		model.addAttribute("busiNm",busiNm);
	    
		return "member/acm/chatting";
	}
	
	
	
	
	
	
}
